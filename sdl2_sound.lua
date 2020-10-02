local ffi = require("ffi")
ffi.cdef([[
/*
 * SDL_sound; An abstract sound format decoding API.
 *
 * Please see the file LICENSE.txt in the source's root directory.
 */

/**
 * \mainpage SDL_sound
 *
 * The latest version of SDL_sound can be found at:
 *     https://icculus.org/SDL_sound/
 *
 * The basic gist of SDL_sound is that you use an SDL_RWops to get sound data
 *  into this library, and SDL_sound will take that data, in one of several
 *  popular formats, and decode it into raw waveform data in the format of
 *  your choice. This gives you a nice abstraction for getting sound into your
 *  game or application; just feed it to SDL_sound, and it will handle
 *  decoding and converting, so you can just pass it to your SDL audio
 *  callback (or whatever). Since it gets data from an SDL_RWops, you can get
 *  the initial sound data from any number of sources: file, memory buffer,
 *  network connection, etc.
 *
 * As the name implies, this library depends on SDL: Simple Directmedia Layer,
 *  which is a powerful, free, and cross-platform multimedia library. It can
 *  be found at https://www.libsdl.org/
 *
 * Support is in place or planned for the following sound formats:
 *   - .WAV  (Microsoft WAVfile RIFF data, internal.)
 *   - .VOC  (Creative Labs' Voice format, internal.)
 *   - .MP3  (MPEG-1 Layer 3 support, via libmpg123.)
 *   - .MID  (MIDI music converted to Waveform data, internal.)
 *   - .MOD  (MOD files, via internal copy of libModPlug.)
 *   - .OGG  (Ogg files, via internal copy of stb_vorbis.)
 *   - .SHN  (Shorten files, internal.)
 *   - .RAW  (Raw sound data in any format, internal.)
 *   - .AU   (Sun's Audio format, internal.)
 *   - .AIFF (Audio Interchange format, internal.)
 *   - .FLAC (Lossless audio compression, via libFLAC.)
 *
 *   (...and more to come...)
 *
 * Please see the file LICENSE.txt in the source's root directory.
 *
 * \author Ryan C. Gordon (icculus@icculus.org)
 * \author many others, please see CREDITS in the source's root directory.
 */

enum {
    SOUND_VER_MAJOR = 1,
    SOUND_VER_MINOR = 9,
    SOUND_VER_PATCH = 0,
};

typedef enum
{
    SOUND_SAMPLEFLAG_NONE    = 0,       /**< No special attributes. */

        /* these are set at sample creation time... */
    SOUND_SAMPLEFLAG_CANSEEK = 1,       /**< Sample can seek to arbitrary points. */

        /* these are set during decoding... */
    SOUND_SAMPLEFLAG_EOF     = 1 << 29, /**< End of input stream. */
    SOUND_SAMPLEFLAG_ERROR   = 1 << 30, /**< Unrecoverable error. */
    SOUND_SAMPLEFLAG_EAGAIN  = 1 << 31  /**< Function would block, or temp error. */
} Sound_SampleFlags;

typedef struct
{
    Uint16 format;  /**< Equivalent of SDL_AudioSpec.format. */
    Uint8 channels; /**< Number of sound channels. 1 == mono, 2 == stereo. */
    Uint32 rate;    /**< Sample rate; frequency of sample points per second. */
} Sound_AudioInfo;

typedef struct
{
    const char **extensions; /**< File extensions, list ends with NULL. */
    const char *description; /**< Human readable description of decoder. */
    const char *author;      /**< "Name Of Author \<email@emailhost.dom\>" */
    const char *url;         /**< URL specific to this decoder. */
} Sound_DecoderInfo;

typedef struct
{
    void *opaque;  /**< Internal use only. Don't touch. */
    const Sound_DecoderInfo *decoder;  /**< Decoder used for this sample. */
    Sound_AudioInfo desired;  /**< Desired audio format for conversion. */
    Sound_AudioInfo actual;  /**< Actual audio format of sample. */
    void *buffer;  /**< Decoded sound data lands in here. */
    Uint32 buffer_size;  /**< Current size of (buffer), in bytes (Uint8). */
    Sound_SampleFlags flags;  /**< Flags relating to this sample. */
} Sound_Sample;

typedef struct
{
    int major; /**< major revision */
    int minor; /**< minor revision */
    int patch; /**< patchlevel */
} Sound_Version;
void Sound_GetLinkedVersion(Sound_Version *ver);
int Sound_Init(void);
int Sound_Quit(void);
const Sound_DecoderInfo ** Sound_AvailableDecoders(void);
const char * Sound_GetError(void);
void Sound_ClearError(void);
Sound_Sample * Sound_NewSample(SDL_RWops *rw,
                                                   const char *ext,
                                                   Sound_AudioInfo *desired,
                                                   Uint32 bufferSize);
Sound_Sample * Sound_NewSampleFromMem(const Uint8 *data,
                                                      Uint32 size,
                                                      const char *ext,
                                                      Sound_AudioInfo *desired,
                                                      Uint32 bufferSize);
Sound_Sample * Sound_NewSampleFromFile(const char *fname,
                                                      Sound_AudioInfo *desired,
                                                      Uint32 bufferSize);
void Sound_FreeSample(Sound_Sample *sample);
Sint32 Sound_GetDuration(Sound_Sample *sample);
int Sound_SetBufferSize(Sound_Sample *sample,
                                            Uint32 new_size);
Uint32 Sound_Decode(Sound_Sample *sample);
Uint32 Sound_DecodeAll(Sound_Sample *sample);
int Sound_Rewind(Sound_Sample *sample);
int Sound_Seek(Sound_Sample *sample, Uint32 ms);
]])

return ffi.load("SDL_sound")