local ffi = require("ffi")
local khr = require("khrplatform")
ffi.cdef([[
enum { GL_GLES_PROTOTYPES = 1 };
enum { GL_ES_VERSION_2_0  = 1 };
typedef khronos_int8_t GLbyte;
typedef khronos_float_t GLclampf;
typedef khronos_int32_t GLfixed;
typedef khronos_int16_t GLshort;
typedef khronos_uint16_t GLushort;
typedef void GLvoid;
typedef struct __GLsync *GLsync;
typedef khronos_int64_t GLint64;
typedef khronos_uint64_t GLuint64;
typedef unsigned int GLenum;
typedef unsigned int GLuint;
typedef char GLchar;
typedef khronos_float_t GLfloat;
typedef khronos_ssize_t GLsizeiptr;
typedef khronos_intptr_t GLintptr;
typedef unsigned int GLbitfield;
typedef int GLint;
typedef unsigned char GLboolean;
typedef int GLsizei;
typedef khronos_uint8_t GLubyte;
enum {
    GL_DEPTH_BUFFER_BIT               = 0x00000100,
    GL_STENCIL_BUFFER_BIT             = 0x00000400,
    GL_COLOR_BUFFER_BIT               = 0x00004000,
    GL_FALSE                          = 0,
    GL_TRUE                           = 1,
    GL_POINTS                         = 0x0000,
    GL_LINES                          = 0x0001,
    GL_LINE_LOOP                      = 0x0002,
    GL_LINE_STRIP                     = 0x0003,
    GL_TRIANGLES                      = 0x0004,
    GL_TRIANGLE_STRIP                 = 0x0005,
    GL_TRIANGLE_FAN                   = 0x0006,
    GL_ZERO                           = 0,
    GL_ONE                            = 1,
    GL_SRC_COLOR                      = 0x0300,
    GL_ONE_MINUS_SRC_COLOR            = 0x0301,
    GL_SRC_ALPHA                      = 0x0302,
    GL_ONE_MINUS_SRC_ALPHA            = 0x0303,
    GL_DST_ALPHA                      = 0x0304,
    GL_ONE_MINUS_DST_ALPHA            = 0x0305,
    GL_DST_COLOR                      = 0x0306,
    GL_ONE_MINUS_DST_COLOR            = 0x0307,
    GL_SRC_ALPHA_SATURATE             = 0x0308,
    GL_FUNC_ADD                       = 0x8006,
    GL_BLEND_EQUATION                 = 0x8009,
    GL_BLEND_EQUATION_RGB             = 0x8009,
    GL_BLEND_EQUATION_ALPHA           = 0x883D,
    GL_FUNC_SUBTRACT                  = 0x800A,
    GL_FUNC_REVERSE_SUBTRACT          = 0x800B,
    GL_BLEND_DST_RGB                  = 0x80C8,
    GL_BLEND_SRC_RGB                  = 0x80C9,
    GL_BLEND_DST_ALPHA                = 0x80CA,
    GL_BLEND_SRC_ALPHA                = 0x80CB,
    GL_CONSTANT_COLOR                 = 0x8001,
    GL_ONE_MINUS_CONSTANT_COLOR       = 0x8002,
    GL_CONSTANT_ALPHA                 = 0x8003,
    GL_ONE_MINUS_CONSTANT_ALPHA       = 0x8004,
    GL_BLEND_COLOR                    = 0x8005,
    GL_ARRAY_BUFFER                   = 0x8892,
    GL_ELEMENT_ARRAY_BUFFER           = 0x8893,
    GL_ARRAY_BUFFER_BINDING           = 0x8894,
    GL_ELEMENT_ARRAY_BUFFER_BINDING   = 0x8895,
    GL_STREAM_DRAW                    = 0x88E0,
    GL_STATIC_DRAW                    = 0x88E4,
    GL_DYNAMIC_DRAW                   = 0x88E8,
    GL_BUFFER_SIZE                    = 0x8764,
    GL_BUFFER_USAGE                   = 0x8765,
    GL_CURRENT_VERTEX_ATTRIB          = 0x8626,
    GL_FRONT                          = 0x0404,
    GL_BACK                           = 0x0405,
    GL_FRONT_AND_BACK                 = 0x0408,
    GL_TEXTURE_2D                     = 0x0DE1,
    GL_CULL_FACE                      = 0x0B44,
    GL_BLEND                          = 0x0BE2,
    GL_DITHER                         = 0x0BD0,
    GL_STENCIL_TEST                   = 0x0B90,
    GL_DEPTH_TEST                     = 0x0B71,
    GL_SCISSOR_TEST                   = 0x0C11,
    GL_POLYGON_OFFSET_FILL            = 0x8037,
    GL_SAMPLE_ALPHA_TO_COVERAGE       = 0x809E,
    GL_SAMPLE_COVERAGE                = 0x80A0,
    GL_NO_ERROR                       = 0,
    GL_INVALID_ENUM                   = 0x0500,
    GL_INVALID_VALUE                  = 0x0501,
    GL_INVALID_OPERATION              = 0x0502,
    GL_OUT_OF_MEMORY                  = 0x0505,
    GL_CW                             = 0x0900,
    GL_CCW                            = 0x0901,
    GL_LINE_WIDTH                     = 0x0B21,
    GL_ALIASED_POINT_SIZE_RANGE       = 0x846D,
    GL_ALIASED_LINE_WIDTH_RANGE       = 0x846E,
    GL_CULL_FACE_MODE                 = 0x0B45,
    GL_FRONT_FACE                     = 0x0B46,
    GL_DEPTH_RANGE                    = 0x0B70,
    GL_DEPTH_WRITEMASK                = 0x0B72,
    GL_DEPTH_CLEAR_VALUE              = 0x0B73,
    GL_DEPTH_FUNC                     = 0x0B74,
    GL_STENCIL_CLEAR_VALUE            = 0x0B91,
    GL_STENCIL_FUNC                   = 0x0B92,
    GL_STENCIL_FAIL                   = 0x0B94,
    GL_STENCIL_PASS_DEPTH_FAIL        = 0x0B95,
    GL_STENCIL_PASS_DEPTH_PASS        = 0x0B96,
    GL_STENCIL_REF                    = 0x0B97,
    GL_STENCIL_VALUE_MASK             = 0x0B93,
    GL_STENCIL_WRITEMASK              = 0x0B98,
    GL_STENCIL_BACK_FUNC              = 0x8800,
    GL_STENCIL_BACK_FAIL              = 0x8801,
    GL_STENCIL_BACK_PASS_DEPTH_FAIL   = 0x8802,
    GL_STENCIL_BACK_PASS_DEPTH_PASS   = 0x8803,
    GL_STENCIL_BACK_REF               = 0x8CA3,
    GL_STENCIL_BACK_VALUE_MASK        = 0x8CA4,
    GL_STENCIL_BACK_WRITEMASK         = 0x8CA5,
    GL_VIEWPORT                       = 0x0BA2,
    GL_SCISSOR_BOX                    = 0x0C10,
    GL_COLOR_CLEAR_VALUE              = 0x0C22,
    GL_COLOR_WRITEMASK                = 0x0C23,
    GL_UNPACK_ALIGNMENT               = 0x0CF5,
    GL_PACK_ALIGNMENT                 = 0x0D05,
    GL_MAX_TEXTURE_SIZE               = 0x0D33,
    GL_MAX_VIEWPORT_DIMS              = 0x0D3A,
    GL_SUBPIXEL_BITS                  = 0x0D50,
    GL_RED_BITS                       = 0x0D52,
    GL_GREEN_BITS                     = 0x0D53,
    GL_BLUE_BITS                      = 0x0D54,
    GL_ALPHA_BITS                     = 0x0D55,
    GL_DEPTH_BITS                     = 0x0D56,
    GL_STENCIL_BITS                   = 0x0D57,
    GL_POLYGON_OFFSET_UNITS           = 0x2A00,
    GL_POLYGON_OFFSET_FACTOR          = 0x8038,
    GL_TEXTURE_BINDING_2D             = 0x8069,
    GL_SAMPLE_BUFFERS                 = 0x80A8,
    GL_SAMPLES                        = 0x80A9,
    GL_SAMPLE_COVERAGE_VALUE          = 0x80AA,
    GL_SAMPLE_COVERAGE_INVERT         = 0x80AB,
    GL_NUM_COMPRESSED_TEXTURE_FORMATS = 0x86A2,
    GL_COMPRESSED_TEXTURE_FORMATS     = 0x86A3,
    GL_DONT_CARE                      = 0x1100,
    GL_FASTEST                        = 0x1101,
    GL_NICEST                         = 0x1102,
    GL_GENERATE_MIPMAP_HINT           = 0x8192,
    GL_BYTE                           = 0x1400,
    GL_UNSIGNED_BYTE                  = 0x1401,
    GL_SHORT                          = 0x1402,
    GL_UNSIGNED_SHORT                 = 0x1403,
    GL_INT                            = 0x1404,
    GL_UNSIGNED_INT                   = 0x1405,
    GL_FLOAT                          = 0x1406,
    GL_FIXED                          = 0x140C,
    GL_DEPTH_COMPONENT                = 0x1902,
    GL_ALPHA                          = 0x1906,
    GL_RGB                            = 0x1907,
    GL_RGBA                           = 0x1908,
    GL_LUMINANCE                      = 0x1909,
    GL_LUMINANCE_ALPHA                = 0x190A,
    GL_UNSIGNED_SHORT_4_4_4_4         = 0x8033,
    GL_UNSIGNED_SHORT_5_5_5_1         = 0x8034,
    GL_UNSIGNED_SHORT_5_6_5           = 0x8363,
    GL_FRAGMENT_SHADER                = 0x8B30,
    GL_VERTEX_SHADER                  = 0x8B31,
    GL_MAX_VERTEX_ATTRIBS             = 0x8869,
    GL_MAX_VERTEX_UNIFORM_VECTORS     = 0x8DFB,
    GL_MAX_VARYING_VECTORS            = 0x8DFC,
    GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D,
    GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C,
    GL_MAX_TEXTURE_IMAGE_UNITS        = 0x8872,
    GL_MAX_FRAGMENT_UNIFORM_VECTORS   = 0x8DFD,
    GL_SHADER_TYPE                    = 0x8B4F,
    GL_DELETE_STATUS                  = 0x8B80,
    GL_LINK_STATUS                    = 0x8B82,
    GL_VALIDATE_STATUS                = 0x8B83,
    GL_ATTACHED_SHADERS               = 0x8B85,
    GL_ACTIVE_UNIFORMS                = 0x8B86,
    GL_ACTIVE_UNIFORM_MAX_LENGTH      = 0x8B87,
    GL_ACTIVE_ATTRIBUTES              = 0x8B89,
    GL_ACTIVE_ATTRIBUTE_MAX_LENGTH    = 0x8B8A,
    GL_SHADING_LANGUAGE_VERSION       = 0x8B8C,
    GL_CURRENT_PROGRAM                = 0x8B8D,
    GL_NEVER                          = 0x0200,
    GL_LESS                           = 0x0201,
    GL_EQUAL                          = 0x0202,
    GL_LEQUAL                         = 0x0203,
    GL_GREATER                        = 0x0204,
    GL_NOTEQUAL                       = 0x0205,
    GL_GEQUAL                         = 0x0206,
    GL_ALWAYS                         = 0x0207,
    GL_KEEP                           = 0x1E00,
    GL_REPLACE                        = 0x1E01,
    GL_INCR                           = 0x1E02,
    GL_DECR                           = 0x1E03,
    GL_INVERT                         = 0x150A,
    GL_INCR_WRAP                      = 0x8507,
    GL_DECR_WRAP                      = 0x8508,
    GL_VENDOR                         = 0x1F00,
    GL_RENDERER                       = 0x1F01,
    GL_VERSION                        = 0x1F02,
    GL_EXTENSIONS                     = 0x1F03,
    GL_NEAREST                        = 0x2600,
    GL_LINEAR                         = 0x2601,
    GL_NEAREST_MIPMAP_NEAREST         = 0x2700,
    GL_LINEAR_MIPMAP_NEAREST          = 0x2701,
    GL_NEAREST_MIPMAP_LINEAR          = 0x2702,
    GL_LINEAR_MIPMAP_LINEAR           = 0x2703,
    GL_TEXTURE_MAG_FILTER             = 0x2800,
    GL_TEXTURE_MIN_FILTER             = 0x2801,
    GL_TEXTURE_WRAP_S                 = 0x2802,
    GL_TEXTURE_WRAP_T                 = 0x2803,
    GL_TEXTURE                        = 0x1702,
    GL_TEXTURE_CUBE_MAP               = 0x8513,
    GL_TEXTURE_BINDING_CUBE_MAP       = 0x8514,
    GL_TEXTURE_CUBE_MAP_POSITIVE_X    = 0x8515,
    GL_TEXTURE_CUBE_MAP_NEGATIVE_X    = 0x8516,
    GL_TEXTURE_CUBE_MAP_POSITIVE_Y    = 0x8517,
    GL_TEXTURE_CUBE_MAP_NEGATIVE_Y    = 0x8518,
    GL_TEXTURE_CUBE_MAP_POSITIVE_Z    = 0x8519,
    GL_TEXTURE_CUBE_MAP_NEGATIVE_Z    = 0x851A,
    GL_MAX_CUBE_MAP_TEXTURE_SIZE      = 0x851C,
    GL_TEXTURE0                       = 0x84C0,
    GL_TEXTURE1                       = 0x84C1,
    GL_TEXTURE2                       = 0x84C2,
    GL_TEXTURE3                       = 0x84C3,
    GL_TEXTURE4                       = 0x84C4,
    GL_TEXTURE5                       = 0x84C5,
    GL_TEXTURE6                       = 0x84C6,
    GL_TEXTURE7                       = 0x84C7,
    GL_TEXTURE8                       = 0x84C8,
    GL_TEXTURE9                       = 0x84C9,
    GL_TEXTURE10                      = 0x84CA,
    GL_TEXTURE11                      = 0x84CB,
    GL_TEXTURE12                      = 0x84CC,
    GL_TEXTURE13                      = 0x84CD,
    GL_TEXTURE14                      = 0x84CE,
    GL_TEXTURE15                      = 0x84CF,
    GL_TEXTURE16                      = 0x84D0,
    GL_TEXTURE17                      = 0x84D1,
    GL_TEXTURE18                      = 0x84D2,
    GL_TEXTURE19                      = 0x84D3,
    GL_TEXTURE20                      = 0x84D4,
    GL_TEXTURE21                      = 0x84D5,
    GL_TEXTURE22                      = 0x84D6,
    GL_TEXTURE23                      = 0x84D7,
    GL_TEXTURE24                      = 0x84D8,
    GL_TEXTURE25                      = 0x84D9,
    GL_TEXTURE26                      = 0x84DA,
    GL_TEXTURE27                      = 0x84DB,
    GL_TEXTURE28                      = 0x84DC,
    GL_TEXTURE29                      = 0x84DD,
    GL_TEXTURE30                      = 0x84DE,
    GL_TEXTURE31                      = 0x84DF,
    GL_ACTIVE_TEXTURE                 = 0x84E0,
    GL_REPEAT                         = 0x2901,
    GL_CLAMP_TO_EDGE                  = 0x812F,
    GL_MIRRORED_REPEAT                = 0x8370,
    GL_FLOAT_VEC2                     = 0x8B50,
    GL_FLOAT_VEC3                     = 0x8B51,
    GL_FLOAT_VEC4                     = 0x8B52,
    GL_INT_VEC2                       = 0x8B53,
    GL_INT_VEC3                       = 0x8B54,
    GL_INT_VEC4                       = 0x8B55,
    GL_BOOL                           = 0x8B56,
    GL_BOOL_VEC2                      = 0x8B57,
    GL_BOOL_VEC3                      = 0x8B58,
    GL_BOOL_VEC4                      = 0x8B59,
    GL_FLOAT_MAT2                     = 0x8B5A,
    GL_FLOAT_MAT3                     = 0x8B5B,
    GL_FLOAT_MAT4                     = 0x8B5C,
    GL_SAMPLER_2D                     = 0x8B5E,
    GL_SAMPLER_CUBE                   = 0x8B60,
    GL_VERTEX_ATTRIB_ARRAY_ENABLED    = 0x8622,
    GL_VERTEX_ATTRIB_ARRAY_SIZE       = 0x8623,
    GL_VERTEX_ATTRIB_ARRAY_STRIDE     = 0x8624,
    GL_VERTEX_ATTRIB_ARRAY_TYPE       = 0x8625,
    GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A,
    GL_VERTEX_ATTRIB_ARRAY_POINTER    = 0x8645,
    GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F,
    GL_IMPLEMENTATION_COLOR_READ_TYPE = 0x8B9A,
    GL_IMPLEMENTATION_COLOR_READ_FORMAT = 0x8B9B,
    GL_COMPILE_STATUS                 = 0x8B81,
    GL_INFO_LOG_LENGTH                = 0x8B84,
    GL_SHADER_SOURCE_LENGTH           = 0x8B88,
    GL_SHADER_COMPILER                = 0x8DFA,
    GL_SHADER_BINARY_FORMATS          = 0x8DF8,
    GL_NUM_SHADER_BINARY_FORMATS      = 0x8DF9,
    GL_LOW_FLOAT                      = 0x8DF0,
    GL_MEDIUM_FLOAT                   = 0x8DF1,
    GL_HIGH_FLOAT                     = 0x8DF2,
    GL_LOW_INT                        = 0x8DF3,
    GL_MEDIUM_INT                     = 0x8DF4,
    GL_HIGH_INT                       = 0x8DF5,
    GL_FRAMEBUFFER                    = 0x8D40,
    GL_RENDERBUFFER                   = 0x8D41,
    GL_RGBA4                          = 0x8056,
    GL_RGB5_A1                        = 0x8057,
    GL_RGB565                         = 0x8D62,
    GL_DEPTH_COMPONENT16              = 0x81A5,
    GL_STENCIL_INDEX8                 = 0x8D48,
    GL_RENDERBUFFER_WIDTH             = 0x8D42,
    GL_RENDERBUFFER_HEIGHT            = 0x8D43,
    GL_RENDERBUFFER_INTERNAL_FORMAT   = 0x8D44,
    GL_RENDERBUFFER_RED_SIZE          = 0x8D50,
    GL_RENDERBUFFER_GREEN_SIZE        = 0x8D51,
    GL_RENDERBUFFER_BLUE_SIZE         = 0x8D52,
    GL_RENDERBUFFER_ALPHA_SIZE        = 0x8D53,
    GL_RENDERBUFFER_DEPTH_SIZE        = 0x8D54,
    GL_RENDERBUFFER_STENCIL_SIZE      = 0x8D55,
    GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0,
    GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1,
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2,
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3,
    GL_COLOR_ATTACHMENT0              = 0x8CE0,
    GL_DEPTH_ATTACHMENT               = 0x8D00,
    GL_STENCIL_ATTACHMENT             = 0x8D20,
    GL_NONE                           = 0,
    GL_FRAMEBUFFER_COMPLETE           = 0x8CD5,
    GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6,
    GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7,
    GL_FRAMEBUFFER_INCOMPLETE_DIMENSIONS = 0x8CD9,
    GL_FRAMEBUFFER_UNSUPPORTED        = 0x8CDD,
    GL_FRAMEBUFFER_BINDING            = 0x8CA6,
    GL_RENDERBUFFER_BINDING           = 0x8CA7,
    GL_MAX_RENDERBUFFER_SIZE          = 0x84E8,
    GL_INVALID_FRAMEBUFFER_OPERATION  = 0x0506
};
typedef void (*PFNGLACTIVETEXTUREPROC) (GLenum texture);
typedef void (*PFNGLATTACHSHADERPROC) (GLuint program, GLuint shader);
typedef void (*PFNGLBINDATTRIBLOCATIONPROC) (GLuint program, GLuint index, const GLchar *name);
typedef void (*PFNGLBINDBUFFERPROC) (GLenum target, GLuint buffer);
typedef void (*PFNGLBINDFRAMEBUFFERPROC) (GLenum target, GLuint framebuffer);
typedef void (*PFNGLBINDRENDERBUFFERPROC) (GLenum target, GLuint renderbuffer);
typedef void (*PFNGLBINDTEXTUREPROC) (GLenum target, GLuint texture);
typedef void (*PFNGLBLENDCOLORPROC) (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
typedef void (*PFNGLBLENDEQUATIONPROC) (GLenum mode);
typedef void (*PFNGLBLENDEQUATIONSEPARATEPROC) (GLenum modeRGB, GLenum modeAlpha);
typedef void (*PFNGLBLENDFUNCPROC) (GLenum sfactor, GLenum dfactor);
typedef void (*PFNGLBLENDFUNCSEPARATEPROC) (GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha);
typedef void (*PFNGLBUFFERDATAPROC) (GLenum target, GLsizeiptr size, const void *data, GLenum usage);
typedef void (*PFNGLBUFFERSUBDATAPROC) (GLenum target, GLintptr offset, GLsizeiptr size, const void *data);
typedef GLenum (*PFNGLCHECKFRAMEBUFFERSTATUSPROC) (GLenum target);
typedef void (*PFNGLCLEARPROC) (GLbitfield mask);
typedef void (*PFNGLCLEARCOLORPROC) (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
typedef void (*PFNGLCLEARDEPTHFPROC) (GLfloat d);
typedef void (*PFNGLCLEARSTENCILPROC) (GLint s);
typedef void (*PFNGLCOLORMASKPROC) (GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha);
typedef void (*PFNGLCOMPILESHADERPROC) (GLuint shader);
typedef void (*PFNGLCOMPRESSEDTEXIMAGE2DPROC) (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const void *data);
typedef void (*PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *data);
typedef void (*PFNGLCOPYTEXIMAGE2DPROC) (GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
typedef void (*PFNGLCOPYTEXSUBIMAGE2DPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
typedef GLuint (*PFNGLCREATEPROGRAMPROC) (void);
typedef GLuint (*PFNGLCREATESHADERPROC) (GLenum type);
typedef void (*PFNGLCULLFACEPROC) (GLenum mode);
typedef void (*PFNGLDELETEBUFFERSPROC) (GLsizei n, const GLuint *buffers);
typedef void (*PFNGLDELETEFRAMEBUFFERSPROC) (GLsizei n, const GLuint *framebuffers);
typedef void (*PFNGLDELETEPROGRAMPROC) (GLuint program);
typedef void (*PFNGLDELETERENDERBUFFERSPROC) (GLsizei n, const GLuint *renderbuffers);
typedef void (*PFNGLDELETESHADERPROC) (GLuint shader);
typedef void (*PFNGLDELETETEXTURESPROC) (GLsizei n, const GLuint *textures);
typedef void (*PFNGLDEPTHFUNCPROC) (GLenum func);
typedef void (*PFNGLDEPTHMASKPROC) (GLboolean flag);
typedef void (*PFNGLDEPTHRANGEFPROC) (GLfloat n, GLfloat f);
typedef void (*PFNGLDETACHSHADERPROC) (GLuint program, GLuint shader);
typedef void (*PFNGLDISABLEPROC) (GLenum cap);
typedef void (*PFNGLDISABLEVERTEXATTRIBARRAYPROC) (GLuint index);
typedef void (*PFNGLDRAWARRAYSPROC) (GLenum mode, GLint first, GLsizei count);
typedef void (*PFNGLDRAWELEMENTSPROC) (GLenum mode, GLsizei count, GLenum type, const void *indices);
typedef void (*PFNGLENABLEPROC) (GLenum cap);
typedef void (*PFNGLENABLEVERTEXATTRIBARRAYPROC) (GLuint index);
typedef void (*PFNGLFINISHPROC) (void);
typedef void (*PFNGLFLUSHPROC) (void);
typedef void (*PFNGLFRAMEBUFFERRENDERBUFFERPROC) (GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer);
typedef void (*PFNGLFRAMEBUFFERTEXTURE2DPROC) (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
typedef void (*PFNGLFRONTFACEPROC) (GLenum mode);
typedef void (*PFNGLGENBUFFERSPROC) (GLsizei n, GLuint *buffers);
typedef void (*PFNGLGENERATEMIPMAPPROC) (GLenum target);
typedef void (*PFNGLGENFRAMEBUFFERSPROC) (GLsizei n, GLuint *framebuffers);
typedef void (*PFNGLGENRENDERBUFFERSPROC) (GLsizei n, GLuint *renderbuffers);
typedef void (*PFNGLGENTEXTURESPROC) (GLsizei n, GLuint *textures);
typedef void (*PFNGLGETACTIVEATTRIBPROC) (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name);
typedef void (*PFNGLGETACTIVEUNIFORMPROC) (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name);
typedef void (*PFNGLGETATTACHEDSHADERSPROC) (GLuint program, GLsizei maxCount, GLsizei *count, GLuint *shaders);
typedef GLint (*PFNGLGETATTRIBLOCATIONPROC) (GLuint program, const GLchar *name);
typedef void (*PFNGLGETBOOLEANVPROC) (GLenum pname, GLboolean *data);
typedef void (*PFNGLGETBUFFERPARAMETERIVPROC) (GLenum target, GLenum pname, GLint *params);
typedef GLenum (*PFNGLGETERRORPROC) (void);
typedef void (*PFNGLGETFLOATVPROC) (GLenum pname, GLfloat *data);
typedef void (*PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC) (GLenum target, GLenum attachment, GLenum pname, GLint *params);
typedef void (*PFNGLGETINTEGERVPROC) (GLenum pname, GLint *data);
typedef void (*PFNGLGETPROGRAMIVPROC) (GLuint program, GLenum pname, GLint *params);
typedef void (*PFNGLGETPROGRAMINFOLOGPROC) (GLuint program, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
typedef void (*PFNGLGETRENDERBUFFERPARAMETERIVPROC) (GLenum target, GLenum pname, GLint *params);
typedef void (*PFNGLGETSHADERIVPROC) (GLuint shader, GLenum pname, GLint *params);
typedef void (*PFNGLGETSHADERINFOLOGPROC) (GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
typedef void (*PFNGLGETSHADERPRECISIONFORMATPROC) (GLenum shadertype, GLenum precisiontype, GLint *range, GLint *precision);
typedef void (*PFNGLGETSHADERSOURCEPROC) (GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *source);
typedef const GLubyte *(*PFNGLGETSTRINGPROC) (GLenum name);
typedef void (*PFNGLGETTEXPARAMETERFVPROC) (GLenum target, GLenum pname, GLfloat *params);
typedef void (*PFNGLGETTEXPARAMETERIVPROC) (GLenum target, GLenum pname, GLint *params);
typedef void (*PFNGLGETUNIFORMFVPROC) (GLuint program, GLint location, GLfloat *params);
typedef void (*PFNGLGETUNIFORMIVPROC) (GLuint program, GLint location, GLint *params);
typedef GLint (*PFNGLGETUNIFORMLOCATIONPROC) (GLuint program, const GLchar *name);
typedef void (*PFNGLGETVERTEXATTRIBFVPROC) (GLuint index, GLenum pname, GLfloat *params);
typedef void (*PFNGLGETVERTEXATTRIBIVPROC) (GLuint index, GLenum pname, GLint *params);
typedef void (*PFNGLGETVERTEXATTRIBPOINTERVPROC) (GLuint index, GLenum pname, void **pointer);
typedef void (*PFNGLHINTPROC) (GLenum target, GLenum mode);
typedef GLboolean (*PFNGLISBUFFERPROC) (GLuint buffer);
typedef GLboolean (*PFNGLISENABLEDPROC) (GLenum cap);
typedef GLboolean (*PFNGLISFRAMEBUFFERPROC) (GLuint framebuffer);
typedef GLboolean (*PFNGLISPROGRAMPROC) (GLuint program);
typedef GLboolean (*PFNGLISRENDERBUFFERPROC) (GLuint renderbuffer);
typedef GLboolean (*PFNGLISSHADERPROC) (GLuint shader);
typedef GLboolean (*PFNGLISTEXTUREPROC) (GLuint texture);
typedef void (*PFNGLLINEWIDTHPROC) (GLfloat width);
typedef void (*PFNGLLINKPROGRAMPROC) (GLuint program);
typedef void (*PFNGLPIXELSTOREIPROC) (GLenum pname, GLint param);
typedef void (*PFNGLPOLYGONOFFSETPROC) (GLfloat factor, GLfloat units);
typedef void (*PFNGLREADPIXELSPROC) (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, void *pixels);
typedef void (*PFNGLRELEASESHADERCOMPILERPROC) (void);
typedef void (*PFNGLRENDERBUFFERSTORAGEPROC) (GLenum target, GLenum internalformat, GLsizei width, GLsizei height);
typedef void (*PFNGLSAMPLECOVERAGEPROC) (GLfloat value, GLboolean invert);
typedef void (*PFNGLSCISSORPROC) (GLint x, GLint y, GLsizei width, GLsizei height);
typedef void (*PFNGLSHADERBINARYPROC) (GLsizei count, const GLuint *shaders, GLenum binaryFormat, const void *binary, GLsizei length);
typedef void (*PFNGLSHADERSOURCEPROC) (GLuint shader, GLsizei count, const GLchar *const*string, const GLint *length);
typedef void (*PFNGLSTENCILFUNCPROC) (GLenum func, GLint ref, GLuint mask);
typedef void (*PFNGLSTENCILFUNCSEPARATEPROC) (GLenum face, GLenum func, GLint ref, GLuint mask);
typedef void (*PFNGLSTENCILMASKPROC) (GLuint mask);
typedef void (*PFNGLSTENCILMASKSEPARATEPROC) (GLenum face, GLuint mask);
typedef void (*PFNGLSTENCILOPPROC) (GLenum fail, GLenum zfail, GLenum zpass);
typedef void (*PFNGLSTENCILOPSEPARATEPROC) (GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass);
typedef void (*PFNGLTEXIMAGE2DPROC) (GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const void *pixels);
typedef void (*PFNGLTEXPARAMETERFPROC) (GLenum target, GLenum pname, GLfloat param);
typedef void (*PFNGLTEXPARAMETERFVPROC) (GLenum target, GLenum pname, const GLfloat *params);
typedef void (*PFNGLTEXPARAMETERIPROC) (GLenum target, GLenum pname, GLint param);
typedef void (*PFNGLTEXPARAMETERIVPROC) (GLenum target, GLenum pname, const GLint *params);
typedef void (*PFNGLTEXSUBIMAGE2DPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *pixels);
typedef void (*PFNGLUNIFORM1FPROC) (GLint location, GLfloat v0);
typedef void (*PFNGLUNIFORM1FVPROC) (GLint location, GLsizei count, const GLfloat *value);
typedef void (*PFNGLUNIFORM1IPROC) (GLint location, GLint v0);
typedef void (*PFNGLUNIFORM1IVPROC) (GLint location, GLsizei count, const GLint *value);
typedef void (*PFNGLUNIFORM2FPROC) (GLint location, GLfloat v0, GLfloat v1);
typedef void (*PFNGLUNIFORM2FVPROC) (GLint location, GLsizei count, const GLfloat *value);
typedef void (*PFNGLUNIFORM2IPROC) (GLint location, GLint v0, GLint v1);
typedef void (*PFNGLUNIFORM2IVPROC) (GLint location, GLsizei count, const GLint *value);
typedef void (*PFNGLUNIFORM3FPROC) (GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
typedef void (*PFNGLUNIFORM3FVPROC) (GLint location, GLsizei count, const GLfloat *value);
typedef void (*PFNGLUNIFORM3IPROC) (GLint location, GLint v0, GLint v1, GLint v2);
typedef void (*PFNGLUNIFORM3IVPROC) (GLint location, GLsizei count, const GLint *value);
typedef void (*PFNGLUNIFORM4FPROC) (GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
typedef void (*PFNGLUNIFORM4FVPROC) (GLint location, GLsizei count, const GLfloat *value);
typedef void (*PFNGLUNIFORM4IPROC) (GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
typedef void (*PFNGLUNIFORM4IVPROC) (GLint location, GLsizei count, const GLint *value);
typedef void (*PFNGLUNIFORMMATRIX2FVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (*PFNGLUNIFORMMATRIX3FVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (*PFNGLUNIFORMMATRIX4FVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (*PFNGLUSEPROGRAMPROC) (GLuint program);
typedef void (*PFNGLVALIDATEPROGRAMPROC) (GLuint program);
typedef void (*PFNGLVERTEXATTRIB1FPROC) (GLuint index, GLfloat x);
typedef void (*PFNGLVERTEXATTRIB1FVPROC) (GLuint index, const GLfloat *v);
typedef void (*PFNGLVERTEXATTRIB2FPROC) (GLuint index, GLfloat x, GLfloat y);
typedef void (*PFNGLVERTEXATTRIB2FVPROC) (GLuint index, const GLfloat *v);
typedef void (*PFNGLVERTEXATTRIB3FPROC) (GLuint index, GLfloat x, GLfloat y, GLfloat z);
typedef void (*PFNGLVERTEXATTRIB3FVPROC) (GLuint index, const GLfloat *v);
typedef void (*PFNGLVERTEXATTRIB4FPROC) (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
typedef void (*PFNGLVERTEXATTRIB4FVPROC) (GLuint index, const GLfloat *v);
typedef void (*PFNGLVERTEXATTRIBPOINTERPROC) (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const void *pointer);
typedef void (*PFNGLVIEWPORTPROC) (GLint x, GLint y, GLsizei width, GLsizei height);

void glActiveTexture (GLenum texture);
void glAttachShader (GLuint program, GLuint shader);
void glBindAttribLocation (GLuint program, GLuint index, const GLchar *name);
void glBindBuffer (GLenum target, GLuint buffer);
void glBindFramebuffer (GLenum target, GLuint framebuffer);
void glBindRenderbuffer (GLenum target, GLuint renderbuffer);
void glBindTexture (GLenum target, GLuint texture);
void glBlendColor (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
void glBlendEquation (GLenum mode);
void glBlendEquationSeparate (GLenum modeRGB, GLenum modeAlpha);
void glBlendFunc (GLenum sfactor, GLenum dfactor);
void glBlendFuncSeparate (GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha);
void glBufferData (GLenum target, GLsizeiptr size, const void *data, GLenum usage);
void glBufferSubData (GLenum target, GLintptr offset, GLsizeiptr size, const void *data);
GLenum glCheckFramebufferStatus (GLenum target);
void glClear (GLbitfield mask);
void glClearColor (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
void glClearDepthf (GLfloat d);
void glClearStencil (GLint s);
void glColorMask (GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha);
void glCompileShader (GLuint shader);
void glCompressedTexImage2D (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const void *data);
void glCompressedTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *data);
void glCopyTexImage2D (GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
void glCopyTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
GLuint glCreateProgram (void);
GLuint glCreateShader (GLenum type);
void glCullFace (GLenum mode);
void glDeleteBuffers (GLsizei n, const GLuint *buffers);
void glDeleteFramebuffers (GLsizei n, const GLuint *framebuffers);
void glDeleteProgram (GLuint program);
void glDeleteRenderbuffers (GLsizei n, const GLuint *renderbuffers);
void glDeleteShader (GLuint shader);
void glDeleteTextures (GLsizei n, const GLuint *textures);
void glDepthFunc (GLenum func);
void glDepthMask (GLboolean flag);
void glDepthRangef (GLfloat n, GLfloat f);
void glDetachShader (GLuint program, GLuint shader);
void glDisable (GLenum cap);
void glDisableVertexAttribArray (GLuint index);
void glDrawArrays (GLenum mode, GLint first, GLsizei count);
void glDrawElements (GLenum mode, GLsizei count, GLenum type, const void *indices);
void glEnable (GLenum cap);
void glEnableVertexAttribArray (GLuint index);
void glFinish (void);
void glFlush (void);
void glFramebufferRenderbuffer (GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer);
void glFramebufferTexture2D (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
void glFrontFace (GLenum mode);
void glGenBuffers (GLsizei n, GLuint *buffers);
void glGenerateMipmap (GLenum target);
void glGenFramebuffers (GLsizei n, GLuint *framebuffers);
void glGenRenderbuffers (GLsizei n, GLuint *renderbuffers);
void glGenTextures (GLsizei n, GLuint *textures);
void glGetActiveAttrib (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name);
void glGetActiveUniform (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name);
void glGetAttachedShaders (GLuint program, GLsizei maxCount, GLsizei *count, GLuint *shaders);
GLint glGetAttribLocation (GLuint program, const GLchar *name);
void glGetBooleanv (GLenum pname, GLboolean *data);
void glGetBufferParameteriv (GLenum target, GLenum pname, GLint *params);
GLenum glGetError (void);
void glGetFloatv (GLenum pname, GLfloat *data);
void glGetFramebufferAttachmentParameteriv (GLenum target, GLenum attachment, GLenum pname, GLint *params);
void glGetIntegerv (GLenum pname, GLint *data);
void glGetProgramiv (GLuint program, GLenum pname, GLint *params);
void glGetProgramInfoLog (GLuint program, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
void glGetRenderbufferParameteriv (GLenum target, GLenum pname, GLint *params);
void glGetShaderiv (GLuint shader, GLenum pname, GLint *params);
void glGetShaderInfoLog (GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
void glGetShaderPrecisionFormat (GLenum shadertype, GLenum precisiontype, GLint *range, GLint *precision);
void glGetShaderSource (GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *source);
const GLubyte *glGetString (GLenum name);
void glGetTexParameterfv (GLenum target, GLenum pname, GLfloat *params);
void glGetTexParameteriv (GLenum target, GLenum pname, GLint *params);
void glGetUniformfv (GLuint program, GLint location, GLfloat *params);
void glGetUniformiv (GLuint program, GLint location, GLint *params);
GLint glGetUniformLocation (GLuint program, const GLchar *name);
void glGetVertexAttribfv (GLuint index, GLenum pname, GLfloat *params);
void glGetVertexAttribiv (GLuint index, GLenum pname, GLint *params);
void glGetVertexAttribPointerv (GLuint index, GLenum pname, void **pointer);
void glHint (GLenum target, GLenum mode);
GLboolean glIsBuffer (GLuint buffer);
GLboolean glIsEnabled (GLenum cap);
GLboolean glIsFramebuffer (GLuint framebuffer);
GLboolean glIsProgram (GLuint program);
GLboolean glIsRenderbuffer (GLuint renderbuffer);
GLboolean glIsShader (GLuint shader);
GLboolean glIsTexture (GLuint texture);
void glLineWidth (GLfloat width);
void glLinkProgram (GLuint program);
void glPixelStorei (GLenum pname, GLint param);
void glPolygonOffset (GLfloat factor, GLfloat units);
void glReadPixels (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, void *pixels);
void glReleaseShaderCompiler (void);
void glRenderbufferStorage (GLenum target, GLenum internalformat, GLsizei width, GLsizei height);
void glSampleCoverage (GLfloat value, GLboolean invert);
void glScissor (GLint x, GLint y, GLsizei width, GLsizei height);
void glShaderBinary (GLsizei count, const GLuint *shaders, GLenum binaryFormat, const void *binary, GLsizei length);
void glShaderSource (GLuint shader, GLsizei count, const GLchar *const*string, const GLint *length);
void glStencilFunc (GLenum func, GLint ref, GLuint mask);
void glStencilFuncSeparate (GLenum face, GLenum func, GLint ref, GLuint mask);
void glStencilMask (GLuint mask);
void glStencilMaskSeparate (GLenum face, GLuint mask);
void glStencilOp (GLenum fail, GLenum zfail, GLenum zpass);
void glStencilOpSeparate (GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass);
void glTexImage2D (GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const void *pixels);
void glTexParameterf (GLenum target, GLenum pname, GLfloat param);
void glTexParameterfv (GLenum target, GLenum pname, const GLfloat *params);
void glTexParameteri (GLenum target, GLenum pname, GLint param);
void glTexParameteriv (GLenum target, GLenum pname, const GLint *params);
void glTexSubImage2D (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *pixels);
void glUniform1f (GLint location, GLfloat v0);
void glUniform1fv (GLint location, GLsizei count, const GLfloat *value);
void glUniform1i (GLint location, GLint v0);
void glUniform1iv (GLint location, GLsizei count, const GLint *value);
void glUniform2f (GLint location, GLfloat v0, GLfloat v1);
void glUniform2fv (GLint location, GLsizei count, const GLfloat *value);
void glUniform2i (GLint location, GLint v0, GLint v1);
void glUniform2iv (GLint location, GLsizei count, const GLint *value);
void glUniform3f (GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
void glUniform3fv (GLint location, GLsizei count, const GLfloat *value);
void glUniform3i (GLint location, GLint v0, GLint v1, GLint v2);
void glUniform3iv (GLint location, GLsizei count, const GLint *value);
void glUniform4f (GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
void glUniform4fv (GLint location, GLsizei count, const GLfloat *value);
void glUniform4i (GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
void glUniform4iv (GLint location, GLsizei count, const GLint *value);
void glUniformMatrix2fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix3fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix4fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUseProgram (GLuint program);
void glValidateProgram (GLuint program);
void glVertexAttrib1f (GLuint index, GLfloat x);
void glVertexAttrib1fv (GLuint index, const GLfloat *v);
void glVertexAttrib2f (GLuint index, GLfloat x, GLfloat y);
void glVertexAttrib2fv (GLuint index, const GLfloat *v);
void glVertexAttrib3f (GLuint index, GLfloat x, GLfloat y, GLfloat z);
void glVertexAttrib3fv (GLuint index, const GLfloat *v);
void glVertexAttrib4f (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glVertexAttrib4fv (GLuint index, const GLfloat *v);
void glVertexAttribPointer (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const void *pointer);
void glViewport (GLint x, GLint y, GLsizei width, GLsizei height);
]])

return ffi.load("libGLESv2")