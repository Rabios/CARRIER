local ffi = require("ffi")
ffi.cdef([[
/*
  SDL_net:  An example cross-platform network library for use with SDL
  Copyright (C) 1997-2013 Sam Lantinga <slouken@libsdl.org>
  Copyright (C) 2012 Simeon Maxein <smaxein@googlemail.com>
  This software is provided 'as-is', without any express or implied
  warranty.  In no event will the authors be held liable for any damages
  arising from the use of this software.
  Permission is granted to anyone to use this software for any purpose,
  including commercial applications, and to alter it and redistribute it
  freely, subject to the following restrictions:
  1. The origin of this software must not be misrepresented; you must not
     claim that you wrote the original software. If you use this software
     in a product, an acknowledgment in the product documentation would be
     appreciated but is not required.
  2. Altered source versions must be plainly marked as such, and must not be
     misrepresented as being the original software.
  3. This notice may not be removed or altered from any source distribution.
*/

/* $Id$ */
typedef uint8_t Uint8;
typedef uint16_t Uint16;
typedef uint32_t Uint32;

typedef struct SDLNet_version {
    Uint8 major;
    Uint8 minor;
    Uint8 patch;
} SDLNet_version;

/* Printable format: "%d.%d.%d", MAJOR, MINOR, PATCHLEVEL
*/
enum {
    SDL_NET_MAJOR_VERSION   = 2,
    SDL_NET_MINOR_VERSION   = 0,
    SDL_NET_PATCHLEVEL      = 0
};
/* This function gets the version of the dynamically linked SDL_net library.
   it should NOT be used to fill a version structure, instead you should
   use the SDL_NET_VERSION() macro.
 */
const SDLNet_version * SDLNet_Linked_Version(void);

/* Initialize/Cleanup the network API
   SDL must be initialized before calls to functions in this library,
   because this library uses utility functions from the SDL library.
*/
int  SDLNet_Init(void);
void SDLNet_Quit(void);

/***********************************************************************/
/* IPv4 hostname resolution API                                        */
/***********************************************************************/

typedef struct {
    Uint32 host;            /* 32-bit IPv4 host address */
    Uint16 port;            /* 16-bit protocol port */
} IPaddress;

/* Resolve a host name and port to an IP address in network form.
   If the function succeeds, it will return 0.
   If the host couldn't be resolved, the host portion of the returned
   address will be INADDR_NONE, and the function will return -1.
   If 'host' is NULL, the resolved host will be set to INADDR_ANY.
 */
enum {
    INADDR_ANY          = 0x00000000,
    INADDR_NONE         = 0xFFFFFFFF,
    INADDR_LOOPBACK     = 0x7f000001,
    INADDR_BROADCAST    = 0xFFFFFFFF
};    
int SDLNet_ResolveHost(IPaddress *address, const char *host, Uint16 port);

/* Resolve an ip address to a host name in canonical form.
   If the ip couldn't be resolved, this function returns NULL,
   otherwise a pointer to a static buffer containing the hostname
   is returned.  Note that this function is not thread-safe.
*/
const char * SDLNet_ResolveIP(const IPaddress *ip);

/* Get the addresses of network interfaces on this system.
   This returns the number of addresses saved in 'addresses'
 */
int SDLNet_GetLocalAddresses(IPaddress *addresses, int maxcount);

/***********************************************************************/
/* TCP network API                                                     */
/***********************************************************************/

typedef struct _TCPsocket *TCPsocket;

/* Open a TCP network socket
   If ip.host is INADDR_NONE or INADDR_ANY, this creates a local server
   socket on the given port, otherwise a TCP connection to the remote
   host and port is attempted. The address passed in should already be
   swapped to network byte order (addresses returned from
   SDLNet_ResolveHost() are already in the correct form).
   The newly created socket is returned, or NULL if there was an error.
*/
TCPsocket SDLNet_TCP_Open(IPaddress *ip);

/* Accept an incoming connection on the given server socket.
   The newly created socket is returned, or NULL if there was an error.
*/
TCPsocket SDLNet_TCP_Accept(TCPsocket server);

/* Get the IP address of the remote system associated with the socket.
   If the socket is a server socket, this function returns NULL.
*/
IPaddress * SDLNet_TCP_GetPeerAddress(TCPsocket sock);

/* Send 'len' bytes of 'data' over the non-server socket 'sock'
   This function returns the actual amount of data sent.  If the return value
   is less than the amount of data sent, then either the remote connection was
   closed, or an unknown socket error occurred.
*/
int SDLNet_TCP_Send(TCPsocket sock, const void *data,
        int len);

/* Receive up to 'maxlen' bytes of data over the non-server socket 'sock',
   and store them in the buffer pointed to by 'data'.
   This function returns the actual amount of data received.  If the return
   value is less than or equal to zero, then either the remote connection was
   closed, or an unknown socket error occurred.
*/
int SDLNet_TCP_Recv(TCPsocket sock, void *data, int maxlen);

/* Close a TCP network socket */
void SDLNet_TCP_Close(TCPsocket sock);


/***********************************************************************/
/* UDP network API                                                     */
/***********************************************************************/

/* The maximum channels on a a UDP socket */
enum { SDLNET_MAX_UDPCHANNELS  = 32 };
/* The maximum addresses bound to a single UDP socket channel */
enum { SDLNET_MAX_UDPADDRESSES = 4 };

typedef struct _UDPsocket *UDPsocket;
typedef struct {
    int channel;        /* The src/dst channel of the packet */
    Uint8 *data;        /* The packet data */
    int len;            /* The length of the packet data */
    int maxlen;         /* The size of the data buffer */
    int status;         /* packet status after sending */
    IPaddress address;  /* The source/dest address of an incoming/outgoing packet */
} UDPpacket;

/* Allocate/resize/free a single UDP packet 'size' bytes long.
   The new packet is returned, or NULL if the function ran out of memory.
 */
UDPpacket * SDLNet_AllocPacket(int size);
int SDLNet_ResizePacket(UDPpacket *packet, int newsize);
void SDLNet_FreePacket(UDPpacket *packet);

/* Allocate/Free a UDP packet vector (array of packets) of 'howmany' packets,
   each 'size' bytes long.
   A pointer to the first packet in the array is returned, or NULL if the
   function ran out of memory.
 */
UDPpacket ** SDLNet_AllocPacketV(int howmany, int size);
void SDLNet_FreePacketV(UDPpacket **packetV);


/* Open a UDP network socket
   If 'port' is non-zero, the UDP socket is bound to a local port.
   The 'port' should be given in native byte order, but is used
   internally in network (big endian) byte order, in addresses, etc.
   This allows other systems to send to this socket via a known port.
*/
UDPsocket SDLNet_UDP_Open(Uint16 port);

/* Set the percentage of simulated packet loss for packets sent on the socket.
*/
void SDLNet_UDP_SetPacketLoss(UDPsocket sock, int percent);

/* Bind the address 'address' to the requested channel on the UDP socket.
   If the channel is -1, then the first unbound channel that has not yet
   been bound to the maximum number of addresses will be bound with
   the given address as it's primary address.
   If the channel is already bound, this new address will be added to the
   list of valid source addresses for packets arriving on the channel.
   If the channel is not already bound, then the address becomes the primary
   address, to which all outbound packets on the channel are sent.
   This function returns the channel which was bound, or -1 on error.
*/
int SDLNet_UDP_Bind(UDPsocket sock, int channel, const IPaddress *address);

/* Unbind all addresses from the given channel */
void SDLNet_UDP_Unbind(UDPsocket sock, int channel);

/* Get the primary IP address of the remote system associated with the
   socket and channel.  If the channel is -1, then the primary IP port
   of the UDP socket is returned -- this is only meaningful for sockets
   opened with a specific port.
   If the channel is not bound and not -1, this function returns NULL.
 */
IPaddress * SDLNet_UDP_GetPeerAddress(UDPsocket sock, int channel);

/* Send a vector of packets to the the channels specified within the packet.
   If the channel specified in the packet is -1, the packet will be sent to
   the address in the 'src' member of the packet.
   Each packet will be updated with the status of the packet after it has
   been sent, -1 if the packet send failed.
   This function returns the number of packets sent.
*/
int SDLNet_UDP_SendV(UDPsocket sock, UDPpacket **packets, int npackets);

/* Send a single packet to the specified channel.
   If the channel specified in the packet is -1, the packet will be sent to
   the address in the 'src' member of the packet.
   The packet will be updated with the status of the packet after it has
   been sent.
   This function returns 1 if the packet was sent, or 0 on error.
   NOTE:
   The maximum size of the packet is limited by the MTU (Maximum Transfer Unit)
   of the transport medium.  It can be as low as 250 bytes for some PPP links,
   and as high as 1500 bytes for ethernet.
*/
int SDLNet_UDP_Send(UDPsocket sock, int channel, UDPpacket *packet);

/* Receive a vector of pending packets from the UDP socket.
   The returned packets contain the source address and the channel they arrived
   on.  If they did not arrive on a bound channel, the the channel will be set
   to -1.
   The channels are checked in highest to lowest order, so if an address is
   bound to multiple channels, the highest channel with the source address
   bound will be returned.
   This function returns the number of packets read from the network, or -1
   on error.  This function does not block, so can return 0 packets pending.
*/
int SDLNet_UDP_RecvV(UDPsocket sock, UDPpacket **packets);

/* Receive a single packet from the UDP socket.
   The returned packet contains the source address and the channel it arrived
   on.  If it did not arrive on a bound channel, the the channel will be set
   to -1.
   The channels are checked in highest to lowest order, so if an address is
   bound to multiple channels, the highest channel with the source address
   bound will be returned.
   This function returns the number of packets read from the network, or -1
   on error.  This function does not block, so can return 0 packets pending.
*/
int SDLNet_UDP_Recv(UDPsocket sock, UDPpacket *packet);

/* Close a UDP network socket */
void SDLNet_UDP_Close(UDPsocket sock);


/***********************************************************************/
/* Hooks for checking sockets for available data                       */
/***********************************************************************/
/* Any network socket can be safely cast to this socket type */
typedef struct _SDLNet_GenericSocket {
    int ready;
} *SDLNet_GenericSocket;

typedef struct _SDLNet_SocketSet *SDLNet_SocketSet;
int SDLNet_DelSocket(SDLNet_SocketSet set, SDLNet_GenericSocket sock);
int SDLNet_AddSocket(SDLNet_SocketSet set, SDLNet_GenericSocket sock);

/* Allocate a socket set for use with SDLNet_CheckSockets()
   This returns a socket set for up to 'maxsockets' sockets, or NULL if
   the function ran out of memory.
 */
SDLNet_SocketSet SDLNet_AllocSocketSet(int maxsockets);

/* This function checks to see if data is available for reading on the
   given set of sockets.  If 'timeout' is 0, it performs a quick poll,
   otherwise the function returns when either data is available for
   reading, or the timeout in milliseconds has elapsed, which ever occurs
   first.  This function returns the number of sockets ready for reading,
   or -1 if there was an error with the select() system call.
*/
int SDLNet_CheckSockets(SDLNet_SocketSet set, Uint32 timeout);

/* Free a set of sockets allocated by SDL_NetAllocSocketSet() */
void SDLNet_FreeSocketSet(SDLNet_SocketSet set);

/***********************************************************************/
/* Error reporting functions                                           */
/***********************************************************************/

void SDLNet_SetError(const char *fmt, ...);
const char * SDLNet_GetError(void);

/***********************************************************************/
/* Inline functions to read/write network data                         */
/***********************************************************************/

/* Warning, some systems have data access alignment restrictions */
enum { SDL_DATA_ALIGNED = 0 };

void _SDLNet_Write16(Uint16 value, void *areap);
void _SDLNet_Write32(Uint32 value, void *areap);
Uint16 _SDLNet_Read16(void *areap);
Uint32 _SDLNet_Read32(const void *areap);
]])

local SDL2_NET = ffi.load("SDL2_net")
local _N = {
  -- Write a 16/32-bit value to network packet buffer
  SDLNet_Write16 = function(value, areap) SDL2_NET._SDLNet_Write16(value, areap) end,
  SDLNet_Write32 = function(value, areap) SDL2_NET._SDLNet_Write32(value, areap) end,

  -- Read a 16/32-bit value from network packet buffer
  SDLNet_Read16 = function(areap) SDL2_NET._SDLNet_Read16(areap) end,
  SDLNet_Read32 = function(areap) SDL2_NET._SDLNet_Read32(areap) end,
  
  -- Add a socket to a set of sockets to be checked for available data
  SDLNet_TCP_AddSocket = function(set, sock)
    return SDL2_NET.SDLNet_AddSocket(set, ffi.cast("SDLNet_GenericSocket", sock))
  end,

  SDLNet_UDP_AddSocket = function(set, sock)
    return SDL2_NET.SDLNet_AddSocket(set, ffi.cast("SDLNet_GenericSocket", sock))
  end,
  
  -- Remove a socket from a set of sockets to be checked for available data
  SDLNet_TCP_DelSocket = function(set, sock)
    return SDL2_NET.SDLNet_DelSocket(set, ffi.cast("SDLNet_GenericSocket", sock))
  end,
  
  SDLNet_UDP_DelSocket = function(set, sock)
    return SDL2_NET.SDLNet_DelSocket(set, ffi.cast("SDLNet_GenericSocket", sock))
  end,
  
  --[[
  After calling SDLNet_CheckSockets(), you can use this function on a
   socket that was in the socket set, to find out if data is available
   for reading.
  ]]
  
 _SDLNet_SocketReady = function(sock)
   return (sock ~= nil) and (sock.ready)
  end
}
_N.SDLNet_SocketReady = function(sock)
    SDL2_NET._SDLNet_SocketReady(ffi.cast("SDLNet_GenericSocket", sock))
end

setmetatable(_N, {
  __index = function(table, key)
	return SDL2_NET[key]
  end
})

return _N