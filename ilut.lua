local ffi = require("ffi")
ffi.cdef([[
enum {
    ILUT_VERSION_1_8_0 = 1,
    ILUT_VERSION       = 180
};

enum {
    ILUT_OPENGL_BIT      = 0x00000001,
    ILUT_D3D_BIT         = 0x00000002,
    ILUT_ALL_ATTRIB_BITS = 0x000FFFFF,

    ILUT_INVALID_ENUM        = 0x0501,
    ILUT_OUT_OF_MEMORY       = 0x0502,
    ILUT_INVALID_VALUE       = 0x0505,
    ILUT_ILLEGAL_OPERATION   = 0x0506,
    ILUT_INVALID_PARAM       = 0x0509,
    ILUT_COULD_NOT_OPEN_FILE = 0x050A,
    ILUT_STACK_OVERFLOW      = 0x050E,
    ILUT_STACK_UNDERFLOW     = 0x050F,
    ILUT_BAD_DIMENSIONS      = 0x0511,
    ILUT_NOT_SUPPORTED       = 0x0550,

    ILUT_PALETTE_MODE         = 0x0600,
    ILUT_OPENGL_CONV          = 0x0610,
    ILUT_D3D_MIPLEVELS        = 0x0620,
    ILUT_MAXTEX_WIDTH         = 0x0630,
    ILUT_MAXTEX_HEIGHT        = 0x0631,
    ILUT_MAXTEX_DEPTH         = 0x0632,
    ILUT_GL_USE_S3TC          = 0x0634,
    ILUT_D3D_USE_DXTC         = 0x0634,
    ILUT_GL_GEN_S3TC          = 0x0635,
    ILUT_D3D_GEN_DXTC         = 0x0635,
    ILUT_S3TC_FORMAT          = 0x0705,
    ILUT_DXTC_FORMAT          = 0x0705,
    ILUT_D3D_POOL             = 0x0706,
    ILUT_D3D_ALPHA_KEY_COLOR  = 0x0707,
    ILUT_D3D_ALPHA_KEY_COLOUR = 0x0707,
    ILUT_FORCE_INTEGER_FORMAT = 0x0636
};

ILboolean		ilutDisable(ILenum Mode);
ILboolean		ilutEnable(ILenum Mode);
ILboolean		ilutGetBoolean(ILenum Mode);
void          ilutGetBooleanv(ILenum Mode, ILboolean *Param);
ILint			ilutGetInteger(ILenum Mode);
void          ilutGetIntegerv(ILenum Mode, ILint *Param);
ILstring      ilutGetString(ILenum StringName);
void          ilutInit(void);
ILboolean     ilutIsDisabled(ILenum Mode);
ILboolean     ilutIsEnabled(ILenum Mode);
void          ilutPopAttrib(void);
void          ilutPushAttrib(ILuint Bits);
void          ilutSetInteger(ILenum Mode, ILint Param);

ILboolean     ilutRenderer(ILenum Renderer);
]])

if ILUT_USE_OPENGL then
  ffi.cdef([[
	GLuint	ilutGLBindTexImage();
	GLuint	ilutGLBindMipmaps(void);
	ILboolean	ilutGLBuildMipmaps(void);
	GLuint	ilutGLLoadImage(ILstring FileName);
	ILboolean	ilutGLScreen(void);
	ILboolean	ilutGLScreenie(void);
	ILboolean	ilutGLSaveImage(ILstring FileName, GLuint TexID);
	ILboolean ilutGLSubTex2D(GLuint TexID, ILuint XOff, ILuint YOff);
	ILboolean ilutGLSubTex3D(GLuint TexID, ILuint XOff, ILuint YOff, ILuint ZOff);
	ILboolean	ilutGLSetTex2D(GLuint TexID);
	ILboolean	ilutGLSetTex3D(GLuint TexID);
	ILboolean	ilutGLTexImage(GLuint Level);
	ILboolean ilutGLSubTex(GLuint TexID, ILuint XOff, ILuint YOff);

	ILboolean	ilutGLSetTex(GLuint TexID);  // Deprecated - use ilutGLSetTex2D.
	ILboolean ilutGLSubTex(GLuint TexID, ILuint XOff, ILuint YOff);  // Use ilutGLSubTex2D.
  ]])
end

if ILUT_USE_ALLEGRO then
  ffi.cdef([[
	BITMAP* ilutAllegLoadImage(ILstring FileName);
	BITMAP* ilutConvertToAlleg(PALETTE Pal);
  ]])
end

if ILUT_USE_SDL then
  ffi.cdef([[
	struct SDL_Surface* ilutConvertToSDLSurface(unsigned int flags);
	struct SDL_Surface* ilutSDLSurfaceLoadImage(ILstring FileName);
	ILboolean    ilutSDLSurfaceFromBitmap(struct SDL_Surface *Bitmap);
  ]])
end

if ILUT_USE_BEOS then
  ffi.cdef([[
	BBitmap ilutConvertToBBitmap(void);
  ]])
end

if ILUT_USE_WIN32 then
  ffi.cdef([[
	HBITMAP	ilutConvertToHBitmap(HDC hDC);
	HBITMAP	ilutConvertSliceToHBitmap(HDC hDC, ILuint slice);
	void	ilutFreePaddedData(ILubyte *Data);
	void	ilutGetBmpInfo(BITMAPINFO *Info);
	HPALETTE	ilutGetHPal(void);
	ILubyte*	ilutGetPaddedData(void);
	ILboolean	ilutGetWinClipboard(void);
	ILboolean	ilutLoadResource(HINSTANCE hInst, ILint ID, ILstring ResourceType, ILenum Type);
	ILboolean	ilutSetHBitmap(HBITMAP Bitmap);
	ILboolean	ilutSetHPal(HPALETTE Pal);
	ILboolean	ilutSetWinClipboard(void);
	HBITMAP	ilutWinLoadImage(ILstring FileName, HDC hDC);
	ILboolean	ilutWinLoadUrl(ILstring Url);
	ILboolean ilutWinPrint(ILuint XPos, ILuint YPos, ILuint Width, ILuint Height, HDC hDC);
	ILboolean	ilutWinSaveImage(ILstring FileName, HBITMAP Bitmap);
  ]])
end

if ILUT_USE_DIRECTX8 then
  ffi.cdef([[
    void	ilutD3D8MipFunc(ILuint NumLevels);
	struct IDirect3DTexture8* ilutD3D8Texture(struct IDirect3DDevice8 *Device);
	struct IDirect3DVolumeTexture8* ilutD3D8VolumeTexture(struct IDirect3DDevice8 *Device);
	ILboolean	ilutD3D8TexFromFile(struct IDirect3DDevice8 *Device, char *FileName, struct IDirect3DTexture8 **Texture);
	ILboolean	ilutD3D8VolTexFromFile(struct IDirect3DDevice8 *Device, char *FileName, struct IDirect3DVolumeTexture8 **Texture);
	ILboolean	ilutD3D8TexFromFileInMemory(struct IDirect3DDevice8 *Device, void *Lump, ILuint Size, struct IDirect3DTexture8 **Texture);
	ILboolean	ilutD3D8VolTexFromFileInMemory(struct IDirect3DDevice8 *Device, void *Lump, ILuint Size, struct IDirect3DVolumeTexture8 **Texture);
	ILboolean	ilutD3D8TexFromFileHandle(struct IDirect3DDevice8 *Device, ILHANDLE File, struct IDirect3DTexture8 **Texture);
	ILboolean	ilutD3D8VolTexFromFileHandle(struct IDirect3DDevice8 *Device, ILHANDLE File, struct IDirect3DVolumeTexture8 **Texture);
	// These two are not tested yet.
	ILboolean ilutD3D8TexFromResource(struct IDirect3DDevice8 *Device, HMODULE SrcModule, char *SrcResource, struct IDirect3DTexture8 **Texture);
	ILboolean ilutD3D8VolTexFromResource(struct IDirect3DDevice8 *Device, HMODULE SrcModule, char *SrcResource, struct IDirect3DVolumeTexture8 **Texture);
	ILboolean ilutD3D8LoadSurface(struct IDirect3DDevice8 *Device, struct IDirect3DSurface8 *Surface);
  ]])
end

if ILUT_USE_DIRECTX9 then
  ffi.cdef([[
    void  ilutD3D9MipFunc(ILuint NumLevels);
	struct IDirect3DTexture9*       ilutD3D9Texture         (struct IDirect3DDevice9* Device);
	struct IDirect3DVolumeTexture9* ilutD3D9VolumeTexture   (struct IDirect3DDevice9* Device);
    struct IDirect3DCubeTexture9*       ilutD3D9CubeTexture (struct IDirect3DDevice9* Device);

    ILboolean ilutD3D9CubeTexFromFile(struct IDirect3DDevice9 *Device, ILconst_string FileName, struct IDirect3DCubeTexture9 **Texture);
    ILboolean ilutD3D9CubeTexFromFileInMemory(struct IDirect3DDevice9 *Device, void *Lump, ILuint Size, struct IDirect3DCubeTexture9 **Texture);
    ILboolean ilutD3D9CubeTexFromFileHandle(struct IDirect3DDevice9 *Device, ILHANDLE File, struct IDirect3DCubeTexture9 **Texture);
    ILboolean ilutD3D9CubeTexFromResource(struct IDirect3DDevice9 *Device, HMODULE SrcModule, ILconst_string SrcResource, struct IDirect3DCubeTexture9 **Texture);

	ILboolean	ilutD3D9TexFromFile(struct IDirect3DDevice9 *Device, ILconst_string FileName, struct IDirect3DTexture9 **Texture);
	ILboolean	ilutD3D9VolTexFromFile(struct IDirect3DDevice9 *Device, ILconst_string FileName, struct IDirect3DVolumeTexture9 **Texture);
	ILboolean	ilutD3D9TexFromFileInMemory(struct IDirect3DDevice9 *Device, void *Lump, ILuint Size, struct IDirect3DTexture9 **Texture);
	ILboolean	ilutD3D9VolTexFromFileInMemory(struct IDirect3DDevice9 *Device, void *Lump, ILuint Size, struct IDirect3DVolumeTexture9 **Texture);
	ILboolean	ilutD3D9TexFromFileHandle(struct IDirect3DDevice9 *Device, ILHANDLE File, struct IDirect3DTexture9 **Texture);
	ILboolean	ilutD3D9VolTexFromFileHandle(struct IDirect3DDevice9 *Device, ILHANDLE File, struct IDirect3DVolumeTexture9 **Texture);

	// These three are not tested yet.
	ILboolean ilutD3D9TexFromResource(struct IDirect3DDevice9 *Device, HMODULE SrcModule, ILconst_string SrcResource, struct IDirect3DTexture9 **Texture);
	ILboolean ilutD3D9VolTexFromResource(struct IDirect3DDevice9 *Device, HMODULE SrcModule, ILconst_string SrcResource, struct IDirect3DVolumeTexture9 **Texture);
	ILboolean ilutD3D9LoadSurface(struct IDirect3DDevice9 *Device, struct IDirect3DSurface9 *Surface);
  ]])
end

if ILUT_USE_DIRECTX10 then
  ffi.cdef([[
	ID3D10Texture2D* ilutD3D10Texture(ID3D10Device *Device);
	ILboolean ilutD3D10TexFromFile(ID3D10Device *Device, ILconst_string FileName, ID3D10Texture2D **Texture);
	ILboolean ilutD3D10TexFromFileInMemory(ID3D10Device *Device, void *Lump, ILuint Size, ID3D10Texture2D **Texture);
	ILboolean ilutD3D10TexFromResource(ID3D10Device *Device, HMODULE SrcModule, ILconst_string SrcResource, ID3D10Texture2D **Texture);
	ILboolean ilutD3D10TexFromFileHandle(ID3D10Device *Device, ILHANDLE File, ID3D10Texture2D **Texture);
  ]])
end

if ILUT_USE_X11 then
  ffi.cdef([[
	XImage * ilutXCreateImage( Display* );
	Pixmap ilutXCreatePixmap( Display*,Drawable );
	XImage * ilutXLoadImage( Display*,char* );
	Pixmap ilutXLoadPixmap( Display*,Drawable,char* );
  ]])
end

if ILUT_USE_XSHM then
  ffi.cdef([[
	XImage * ilutXShmCreateImage( Display*,XShmSegmentInfo* );
	void ilutXShmDestroyImage( Display*,XImage*,XShmSegmentInfo* );
	Pixmap ilutXShmCreatePixmap( Display*,Drawable,XShmSegmentInfo* );
	void ilutXShmFreePixmap( Display*,Pixmap,XShmSegmentInfo* );
	XImage * ilutXShmLoadImage( Display*,char*,XShmSegmentInfo* );
	Pixmap ilutXShmLoadPixmap( Display*,Drawable,char*,XShmSegmentInfo* );
  ]])
end

return ffi.load("ILUT")