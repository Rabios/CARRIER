local ffi = require("ffi")
ffi.cdef([[
typedef struct Edge
{
	ILint	yUpper;
	ILfloat	xIntersect, dxPerScan;
	struct	Edge *next;
} Edge;
enum {
    ILU_VERSION_1_8_0 = 1,
    ILU_VERSION       = 180,

    ILU_FILTER         = 0x2600,
    ILU_NEAREST        = 0x2601,
    ILU_LINEAR         = 0x2602,
    ILU_BILINEAR       = 0x2603,
    ILU_SCALE_BOX      = 0x2604,
    ILU_SCALE_TRIANGLE = 0x2605,
    ILU_SCALE_BELL     = 0x2606,
    ILU_SCALE_BSPLINE  = 0x2607,
    ILU_SCALE_LANCZOS3 = 0x2608,
    ILU_SCALE_MITCHELL = 0x2609,

    ILU_INVALID_ENUM      = 0x0501,
    ILU_OUT_OF_MEMORY     = 0x0502,
    ILU_INTERNAL_ERROR    = 0x0504,
    ILU_INVALID_VALUE     = 0x0505,
    ILU_ILLEGAL_OPERATION = 0x0506,
    ILU_INVALID_PARAM     = 0x0509,

    ILU_PLACEMENT          = 0x0700,
    ILU_LOWER_LEFT         = 0x0701,
    ILU_LOWER_RIGHT        = 0x0702,
    ILU_UPPER_LEFT         = 0x0703,
    ILU_UPPER_RIGHT        = 0x0704,
    ILU_CENTER             = 0x0705,
    ILU_CONVOLUTION_MATRIX = 0x0710,

    ILU_ENGLISH            = 0x0800,
    ILU_ARABIC             = 0x0801,
    ILU_DUTCH              = 0x0802,
    ILU_JAPANESE           = 0x0803,
    ILU_SPANISH            = 0x0804,
    ILU_GERMAN             = 0x0805,
    ILU_FRENCH             = 0x0806,
    ILU_ITALIAN            = 0x0807,

    ILU_FILTER_BLUR         = 0x0803,
    ILU_FILTER_GAUSSIAN_3x3 = 0x0804,
    ILU_FILTER_GAUSSIAN_5X5 = 0x0805,
    ILU_FILTER_EMBOSS1      = 0x0807,
    ILU_FILTER_EMBOSS2      = 0x0808,
    ILU_FILTER_LAPLACIAN1   = 0x080A,
    ILU_FILTER_LAPLACIAN2   = 0x080B,
    ILU_FILTER_LAPLACIAN3   = 0x080C,
    ILU_FILTER_LAPLACIAN4   = 0x080D,
    ILU_FILTER_SHARPEN1     = 0x080E,
    ILU_FILTER_SHARPEN2     = 0x080F,
    ILU_FILTER_SHARPEN3     = 0x0810
};

typedef struct ILinfo
{
	ILuint  Id;         // the image's id
	ILubyte *Data;      // the image's data
	ILuint  Width;      // the image's width
	ILuint  Height;     // the image's height
	ILuint  Depth;      // the image's depth
	ILubyte Bpp;        // bytes per pixel (not bits) of the image
	ILuint  SizeOfData; // the total size of the data (in bytes)
	ILenum  Format;     // image format (in IL enum style)
	ILenum  Type;       // image type (in IL enum style)
	ILenum  Origin;     // origin of the image
	ILubyte *Palette;   // the image's palette
	ILenum  PalType;    // palette type
	ILuint  PalSize;    // palette size
	ILenum  CubeFlags;  // flags for what cube map sides are present
	ILuint  NumNext;    // number of images following
	ILuint  NumMips;    // number of mipmaps
	ILuint  NumLayers;  // number of layers
} ILinfo;

typedef struct ILpointf {
	ILfloat x;
	ILfloat y;
} ILpointf;

typedef struct ILpointi {
	ILint x;
	ILint y;
} ILpointi;

ILboolean      iluAlienify(void);
ILboolean      iluBlurAvg(ILuint Iter);
ILboolean      iluBlurGaussian(ILuint Iter);
ILboolean      iluBuildMipmaps(void);
ILuint         iluColoursUsed(void);
ILboolean      iluCompareImage(ILuint Comp);
ILboolean      iluContrast(ILfloat Contrast);
ILboolean      iluCrop(ILuint XOff, ILuint YOff, ILuint ZOff, ILuint Width, ILuint Height, ILuint Depth);
void           iluDeleteImage(ILuint Id); // Deprecated
ILboolean      iluEdgeDetectE(void);
ILboolean      iluEdgeDetectP(void);
ILboolean      iluEdgeDetectS(void);
ILboolean      iluEmboss(void);
ILboolean      iluEnlargeCanvas(ILuint Width, ILuint Height, ILuint Depth);
ILboolean      iluEnlargeImage(ILfloat XDim, ILfloat YDim, ILfloat ZDim);
ILboolean      iluEqualize(void);
ILboolean      iluEqualize2(void);
ILconst_string iluErrorString(ILenum Error);
ILboolean      iluConvolution(ILint *matrix, ILint scale, ILint bias);
ILboolean      iluFlipImage(void);
ILboolean      iluGammaCorrect(ILfloat Gamma);
ILuint         iluGenImage(void); // Deprecated
void           iluGetImageInfo(ILinfo *Info);
ILint          iluGetInteger(ILenum Mode);
void           iluGetIntegerv(ILenum Mode, ILint *Param);
ILstring 	   iluGetString(ILenum StringName);
void           iluImageParameter(ILenum PName, ILenum Param);
void           iluInit(void);
ILboolean      iluInvertAlpha(void);
ILuint         iluLoadImage(ILconst_string FileName);
ILboolean      iluMirror(void);
ILboolean      iluNegative(void);
ILboolean      iluNoisify(ILclampf Tolerance);
ILboolean      iluPixelize(ILuint PixSize);
void           iluRegionfv(ILpointf *Points, ILuint n);
void           iluRegioniv(ILpointi *Points, ILuint n);
ILboolean      iluReplaceColour(ILubyte Red, ILubyte Green, ILubyte Blue, ILfloat Tolerance);
ILboolean      iluRotate(ILfloat Angle);
ILboolean      iluRotate3D(ILfloat x, ILfloat y, ILfloat z, ILfloat Angle);
ILboolean      iluSaturate1f(ILfloat Saturation);
ILboolean      iluSaturate4f(ILfloat r, ILfloat g, ILfloat b, ILfloat Saturation);
ILboolean      iluScale(ILuint Width, ILuint Height, ILuint Depth);
ILboolean      iluScaleAlpha(ILfloat scale);
ILboolean      iluScaleColours(ILfloat r, ILfloat g, ILfloat b);
ILboolean      iluSepia(void);
ILboolean      iluSetLanguage(ILenum Language);
ILboolean      iluSharpen(ILfloat Factor, ILuint Iter);
ILboolean      iluSwapColours(void);
ILboolean      iluWave(ILfloat Angle);
]])

local ILU = ffi.load("ILU")
local _I = {
  iluColorsUsed   = ILU.iluSwapColours,
  iluReplaceColor = ILU.iluReplaceColour,
  iluScaleColor   = ILU.iluScaleColour,
}

setmetatable(_I, {
  __index = function(table, key)
    return ILU[key]
  end
})

return _I