UINT64_MAX = 0xffffffffffffffffULL
MAX_COORD = 9.9999999999999998e+149
local ffi = require("ffi")
ffi.cdef([[

/*
** License Applicability. Except to the extent portions of this file are
** made subject to an alternative license as permitted in the SGI Free
** Software License B, Version 1.1 (the "License"), the contents of this
** file are subject only to the provisions of the License. You may not use
** this file except in compliance with the License. You may obtain a copy
** of the License at Silicon Graphics, Inc., attn: Legal Services, 1600
** Amphitheatre Parkway, Mountain View, CA 94043-1351, or at:
** 
** http://oss.sgi.com/projects/FreeB
** 
** Note that, as provided in the License, the Software is distributed on an
** "AS IS" basis, with ALL EXPRESS AND IMPLIED WARRANTIES AND CONDITIONS
** DISCLAIMED, INCLUDING, WITHOUT LIMITATION, ANY IMPLIED WARRANTIES AND
** CONDITIONS OF MERCHANTABILITY, SATISFACTORY QUALITY, FITNESS FOR A
** PARTICULAR PURPOSE, AND NON-INFRINGEMENT.
** 
** Original Code. The Original Code is: OpenGL Sample Implementation,
** Version 1.2.1, released January 26, 2000, developed by Silicon Graphics,
** Inc. The Original Code is Copyright (c) 1991-2000 Silicon Graphics, Inc.
** Copyright in any portions created by third parties is as indicated
** elsewhere herein. All Rights Reserved.
** 
** Additional Notice Provisions: This software was created using the
** OpenGL(R) version 1.2.1 Sample Implementation published by SGI, but has
** not been independently verified as being compliant with the OpenGL(R)
** version 1.2.1 Specification.
*/

/*
 * 2002-Apr-15, Marcus Geelnard:
 *   Changed GLAPIENTRY to APIENTRY.
 */

typedef unsigned int GLenum;
typedef unsigned char GLboolean;
typedef unsigned int GLbitfield;
typedef void GLvoid;
typedef signed char	GLbyte;
typedef short GLshort;
typedef int GLint;
typedef unsigned char GLubyte;
typedef unsigned short GLushort;
typedef unsigned int GLuint;
typedef int GLsizei;
typedef float GLfloat;
typedef float GLclampf;
typedef double GLdouble;
typedef double GLclampd;
typedef void GLhandleARB;
typedef const char* GLcharARB;

enum {
    GLU_EXT_object_space_tess          = 1,
    GLU_EXT_nurbs_tessellator          = 1,

    GLU_FALSE                          = 0,
    GLU_TRUE                           = 1,

    GLU_VERSION_1_1                    = 1,
    GLU_VERSION_1_2                    = 1,
    GLU_VERSION_1_3                    = 1,

    GLU_VERSION                        = 100800,
    GLU_EXTENSIONS                     = 100801,

    GLU_INVALID_ENUM                   = 100900,
    GLU_INVALID_VALUE                  = 100901,
    GLU_OUT_OF_MEMORY                  = 100902,
    GLU_INVALID_OPERATION              = 100904,

    GLU_OUTLINE_POLYGON                = 100240,
    GLU_OUTLINE_PATCH                  = 100241,

    GLU_NURBS_ERROR                    = 100103,
    GLU_ERROR                          = 100103,
    GLU_NURBS_BEGIN                    = 100164,
    GLU_NURBS_BEGIN_EXT                = 100164,
    GLU_NURBS_VERTEX                   = 100165,
    GLU_NURBS_VERTEX_EXT               = 100165,
    GLU_NURBS_NORMAL                   = 100166,
    GLU_NURBS_NORMAL_EXT               = 100166,
    GLU_NURBS_COLOR                    = 100167,
    GLU_NURBS_COLOR_EXT                = 100167,
    GLU_NURBS_TEXTURE_COORD            = 100168,
    GLU_NURBS_TEX_COORD_EXT            = 100168,
    GLU_NURBS_END                      = 100169,
    GLU_NURBS_END_EXT                  = 100169,
    GLU_NURBS_BEGIN_DATA               = 100170,
    GLU_NURBS_BEGIN_DATA_EXT           = 100170,
    GLU_NURBS_VERTEX_DATA              = 100171,
    GLU_NURBS_VERTEX_DATA_EXT          = 100171,
    GLU_NURBS_NORMAL_DATA              = 100172,
    GLU_NURBS_NORMAL_DATA_EXT          = 100172,
    GLU_NURBS_COLOR_DATA               = 100173,
    GLU_NURBS_COLOR_DATA_EXT           = 100173,
    GLU_NURBS_TEXTURE_COORD_DATA       = 100174,
    GLU_NURBS_TEX_COORD_DATA_EXT       = 100174,
    GLU_NURBS_END_DATA                 = 100175,
    GLU_NURBS_END_DATA_EXT             = 100175,

    GLU_NURBS_ERROR1                   = 100251,
    GLU_NURBS_ERROR2                   = 100252,
    GLU_NURBS_ERROR3                   = 100253,
    GLU_NURBS_ERROR4                   = 100254,
    GLU_NURBS_ERROR5                   = 100255,
    GLU_NURBS_ERROR6                   = 100256,
    GLU_NURBS_ERROR7                   = 100257,
    GLU_NURBS_ERROR8                   = 100258,
    GLU_NURBS_ERROR9                   = 100259,
    GLU_NURBS_ERROR10                  = 100260,
    GLU_NURBS_ERROR11                  = 100261,
    GLU_NURBS_ERROR12                  = 100262,
    GLU_NURBS_ERROR13                  = 100263,
    GLU_NURBS_ERROR14                  = 100264,
    GLU_NURBS_ERROR15                  = 100265,
    GLU_NURBS_ERROR16                  = 100266,
    GLU_NURBS_ERROR17                  = 100267,
    GLU_NURBS_ERROR18                  = 100268,
    GLU_NURBS_ERROR19                  = 100269,
    GLU_NURBS_ERROR20                  = 100270,
    GLU_NURBS_ERROR21                  = 100271,
    GLU_NURBS_ERROR22                  = 100272,
    GLU_NURBS_ERROR23                  = 100273,
    GLU_NURBS_ERROR24                  = 100274,
    GLU_NURBS_ERROR25                  = 100275,
    GLU_NURBS_ERROR26                  = 100276,
    GLU_NURBS_ERROR27                  = 100277,
    GLU_NURBS_ERROR28                  = 100278,
    GLU_NURBS_ERROR29                  = 100279,
    GLU_NURBS_ERROR30                  = 100280,
    GLU_NURBS_ERROR31                  = 100281,
    GLU_NURBS_ERROR32                  = 100282,
    GLU_NURBS_ERROR33                  = 100283,
    GLU_NURBS_ERROR34                  = 100284,
    GLU_NURBS_ERROR35                  = 100285,
    GLU_NURBS_ERROR36                  = 100286,
    GLU_NURBS_ERROR37                  = 100287,

    GLU_AUTO_LOAD_MATRIX               = 100200,
    GLU_CULLING                        = 100201,
    GLU_SAMPLING_TOLERANCE             = 100203,
    GLU_DISPLAY_MODE                   = 100204,
    GLU_PARAMETRIC_TOLERANCE           = 100202,
    GLU_SAMPLING_METHOD                = 100205,
    GLU_U_STEP                         = 100206,
    GLU_V_STEP                         = 100207,
    GLU_NURBS_MODE                     = 100160,
    GLU_NURBS_MODE_EXT                 = 100160,
    GLU_NURBS_TESSELLATOR              = 100161,
    GLU_NURBS_TESSELLATOR_EXT          = 100161,
    GLU_NURBS_RENDERER                 = 100162,
    GLU_NURBS_RENDERER_EXT             = 100162,

    GLU_OBJECT_PARAMETRIC_ERROR        = 100208,
    GLU_OBJECT_PARAMETRIC_ERROR_EXT    = 100208,
    GLU_OBJECT_PATH_LENGTH             = 100209,
    GLU_OBJECT_PATH_LENGTH_EXT         = 100209,
    GLU_PATH_LENGTH                    = 100215,
    GLU_PARAMETRIC_ERROR               = 100216,
    GLU_DOMAIN_DISTANCE                = 100217,

    GLU_MAP1_TRIM_2                    = 100210,
    GLU_MAP1_TRIM_3                    = 100211,

    GLU_POINT                          = 100010,
    GLU_LINE                           = 100011,
    GLU_FILL                           = 100012,
    GLU_SILHOUETTE                     = 100013,

    GLU_SMOOTH                         = 100000,
    GLU_FLAT                           = 100001,
    GLU_NONE                           = 100002,

    GLU_OUTSIDE                        = 100020,
    GLU_INSIDE                         = 100021,

    GLU_TESS_BEGIN                     = 100100,
    GLU_BEGIN                          = 100100,
    GLU_TESS_VERTEX                    = 100101,
    GLU_VERTEX                         = 100101,
    GLU_TESS_END                       = 100102,
    GLU_END                            = 100102,
    GLU_TESS_ERROR                     = 100103,
    GLU_TESS_EDGE_FLAG                 = 100104,
    GLU_EDGE_FLAG                      = 100104,
    GLU_TESS_COMBINE                   = 100105,
    GLU_TESS_BEGIN_DATA                = 100106,
    GLU_TESS_VERTEX_DATA               = 100107,
    GLU_TESS_END_DATA                  = 100108,
    GLU_TESS_ERROR_DATA                = 100109,
    GLU_TESS_EDGE_FLAG_DATA            = 100110,
    GLU_TESS_COMBINE_DATA              = 100111,

    GLU_CW                             = 100120,
    GLU_CCW                            = 100121,
    GLU_INTERIOR                       = 100122,
    GLU_EXTERIOR                       = 100123,
    GLU_UNKNOWN                        = 100124,

    GLU_TESS_WINDING_RULE              = 100140,
    GLU_TESS_BOUNDARY_ONLY             = 100141,
    GLU_TESS_TOLERANCE                 = 100142,

    GLU_TESS_ERROR1                    = 100151,
    GLU_TESS_ERROR2                    = 100152,
    GLU_TESS_ERROR3                    = 100153,
    GLU_TESS_ERROR4                    = 100154,
    GLU_TESS_ERROR5                    = 100155,
    GLU_TESS_ERROR6                    = 100156,
    GLU_TESS_ERROR7                    = 100157,
    GLU_TESS_ERROR8                    = 100158,
    GLU_TESS_MISSING_BEGIN_POLYGON     = 100151,
    GLU_TESS_MISSING_BEGIN_CONTOUR     = 100152,
    GLU_TESS_MISSING_END_POLYGON       = 100153,
    GLU_TESS_MISSING_END_CONTOUR       = 100154,
    GLU_TESS_COORD_TOO_LARGE           = 100155,
    GLU_TESS_NEED_COMBINE_CALLBACK     = 100156,

    GLU_TESS_WINDING_ODD               = 100130,
    GLU_TESS_WINDING_NONZERO           = 100131,
    GLU_TESS_WINDING_POSITIVE          = 100132,
    GLU_TESS_WINDING_NEGATIVE          = 100133,
    GLU_TESS_WINDING_ABS_GEQ_TWO       = 100134
};

typedef struct GLUnurbs GLUnurbs;
typedef struct GLUquadric GLUquadric;
typedef struct GLUtesselator GLUtesselator;
typedef GLUnurbs GLUnurbsObj;
typedef GLUquadric GLUquadricObj;
typedef GLUtesselator GLUtesselatorObj;
typedef GLUtesselator GLUtriangulatorObj;

/* enum { GLU_TESS_MAX_COORD = 9.9999999999999998e+149 }; */
typedef void (*_GLUfuncptr)();

void gluBeginCurve (GLUnurbs* nurb);
void gluBeginPolygon (GLUtesselator* tess);
void gluBeginSurface (GLUnurbs* nurb);
void gluBeginTrim (GLUnurbs* nurb);
GLint gluBuild1DMipmapLevels (GLenum target, GLint internalFormat, GLsizei width, GLenum format, GLenum type, GLint level, GLint base, GLint max, const void *data);
GLint gluBuild1DMipmaps (GLenum target, GLint internalFormat, GLsizei width, GLenum format, GLenum type, const void *data);
GLint gluBuild2DMipmapLevels (GLenum target, GLint internalFormat, GLsizei width, GLsizei height, GLenum format, GLenum type, GLint level, GLint base, GLint max, const void *data);
GLint gluBuild2DMipmaps (GLenum target, GLint internalFormat, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *data);
GLint gluBuild3DMipmapLevels (GLenum target, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, GLint level, GLint base, GLint max, const void *data);
GLint gluBuild3DMipmaps (GLenum target, GLint internalFormat, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *data);
GLboolean gluCheckExtension (const GLubyte *extName, const GLubyte *extString);
void gluCylinder (GLUquadric* quad, GLdouble base, GLdouble top, GLdouble height, GLint slices, GLint stacks);
void gluDeleteNurbsRenderer (GLUnurbs* nurb);
void gluDeleteQuadric (GLUquadric* quad);
void gluDeleteTess (GLUtesselator* tess);
void gluDisk (GLUquadric* quad, GLdouble inner, GLdouble outer, GLint slices, GLint loops);
void gluEndCurve (GLUnurbs* nurb);
void gluEndPolygon (GLUtesselator* tess);
void gluEndSurface (GLUnurbs* nurb);
void gluEndTrim (GLUnurbs* nurb);
const GLubyte * gluErrorString (GLenum error);
void gluGetNurbsProperty (GLUnurbs* nurb, GLenum property, GLfloat* data);
const GLubyte * gluGetString (GLenum name);
void gluGetTessProperty (GLUtesselator* tess, GLenum which, GLdouble* data);
void gluLoadSamplingMatrices (GLUnurbs* nurb, const GLfloat *model, const GLfloat *perspective, const GLint *view);
void gluLookAt (GLdouble eyeX, GLdouble eyeY, GLdouble eyeZ, GLdouble centerX, GLdouble centerY, GLdouble centerZ, GLdouble upX, GLdouble upY, GLdouble upZ);
GLUnurbs* gluNewNurbsRenderer (void);
GLUquadric* gluNewQuadric (void);
GLUtesselator* gluNewTess (void);
void gluNextContour (GLUtesselator* tess, GLenum type);
void gluNurbsCallback (GLUnurbs* nurb, GLenum which, _GLUfuncptr CallBackFunc);
void gluNurbsCallbackData (GLUnurbs* nurb, GLvoid* userData);
void gluNurbsCallbackDataEXT (GLUnurbs* nurb, GLvoid* userData);
void gluNurbsCurve (GLUnurbs* nurb, GLint knotCount, GLfloat *knots, GLint stride, GLfloat *control, GLint order, GLenum type);
void gluNurbsProperty (GLUnurbs* nurb, GLenum property, GLfloat value);
void gluNurbsSurface (GLUnurbs* nurb, GLint sKnotCount, GLfloat* sKnots, GLint tKnotCount, GLfloat* tKnots, GLint sStride, GLint tStride, GLfloat* control, GLint sOrder, GLint tOrder, GLenum type);
void gluOrtho2D (GLdouble left, GLdouble right, GLdouble bottom, GLdouble top);
void gluPartialDisk (GLUquadric* quad, GLdouble inner, GLdouble outer, GLint slices, GLint loops, GLdouble start, GLdouble sweep);
void gluPerspective (GLdouble fovy, GLdouble aspect, GLdouble zNear, GLdouble zFar);
void gluPickMatrix (GLdouble x, GLdouble y, GLdouble delX, GLdouble delY, GLint *viewport);
GLint gluProject (GLdouble objX, GLdouble objY, GLdouble objZ, const GLdouble *model, const GLdouble *proj, const GLint *view, GLdouble* winX, GLdouble* winY, GLdouble* winZ);
void gluPwlCurve (GLUnurbs* nurb, GLint count, GLfloat* data, GLint stride, GLenum type);
void gluQuadricCallback (GLUquadric* quad, GLenum which, _GLUfuncptr CallBackFunc);
void gluQuadricDrawStyle (GLUquadric* quad, GLenum draw);
void gluQuadricNormals (GLUquadric* quad, GLenum normal);
void gluQuadricOrientation (GLUquadric* quad, GLenum orientation);
void gluQuadricTexture (GLUquadric* quad, GLboolean texture);
GLint gluScaleImage (GLenum format, GLsizei wIn, GLsizei hIn, GLenum typeIn, const void *dataIn, GLsizei wOut, GLsizei hOut, GLenum typeOut, GLvoid* dataOut);
void gluSphere (GLUquadric* quad, GLdouble radius, GLint slices, GLint stacks);
void gluTessBeginContour (GLUtesselator* tess);
void gluTessBeginPolygon (GLUtesselator* tess, GLvoid* data);
void gluTessCallback (GLUtesselator* tess, GLenum which, _GLUfuncptr CallBackFunc);
void gluTessEndContour (GLUtesselator* tess);
void gluTessEndPolygon (GLUtesselator* tess);
void gluTessNormal (GLUtesselator* tess, GLdouble valueX, GLdouble valueY, GLdouble valueZ);
void gluTessProperty (GLUtesselator* tess, GLenum which, GLdouble data);
void gluTessVertex (GLUtesselator* tess, GLdouble *location, GLvoid* data);
GLint gluUnProject (GLdouble winX, GLdouble winY, GLdouble winZ, const GLdouble *model, const GLdouble *proj, const GLint *view, GLdouble* objX, GLdouble* objY, GLdouble* objZ);
GLint gluUnProject4 (GLdouble winX, GLdouble winY, GLdouble winZ, GLdouble clipW, const GLdouble *model, const GLdouble *proj, const GLint *view, GLdouble nearVal, GLdouble farVal, GLdouble* objX, GLdouble* objY, GLdouble* objZ, GLdouble* objW);

]])

return ffi.load(ffi.os == "Windows" and "glu" or "GLU")