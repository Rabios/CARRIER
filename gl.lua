local ffi = require("ffi")
UINT64_MAX = 0xffffffffffffffffULL

ffi.cdef([[

// gl.h
/*
 * Mesa 3-D graphics library
 * Version:  7.6
 *
 * Copyright (C) 1999-2006  Brian Paul   All Rights Reserved.
 * Copyright (C) 2009  VMware, Inc.  All Rights Reserved.
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included
 * in all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS
 * OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.  IN NO EVENT SHALL
 * BRIAN PAUL BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN
 * AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN
 * CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
 */


enum {
    GL_VERSION_1_1      = 1,
    GL_VERSION_1_2      = 1,
    GL_VERSION_1_3      = 1,
    GL_ARB_imaging      = 1,
    GL_GLEXT_PROTOTYPES = 1
};

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
typedef int GLclampx;

enum {
    GL_FALSE = 0x0,
    GL_TRUE  = 0x1
};

enum {
    GL_BYTE            = 0x1400,
    GL_UNSIGNED_BYTE   = 0x1401,
    GL_SHORT           = 0x1402,
    GL_UNSIGNED_SHORT  = 0x1403,
    GL_INT             = 0x1404,
    GL_UNSIGNED_INT    = 0x1405,
    GL_FLOAT           = 0x1406,
    GL_2_BYTES         = 0x1407,
    GL_3_BYTES         = 0x1408,
    GL_4_BYTES         = 0x1409,
    GL_DOUBLE          = 0x140A
};

enum {
    GL_POINTS			 = 0x0000,
    GL_LINES			 = 0x0001,
    GL_LINE_LOOP		 = 0x0002,
    GL_LINE_STRIP		 = 0x0003,
    GL_TRIANGLES		 = 0x0004,
    GL_TRIANGLE_STRIP	 = 0x0005,
    GL_TRIANGLE_FAN		 = 0x0006,
    GL_QUADS			 = 0x0007,
    GL_QUAD_STRIP		 = 0x0008,
    GL_POLYGON			 = 0x0009
};

enum {
    GL_VERTEX_ARRAY				    = 0x8074,
    GL_NORMAL_ARRAY				    = 0x8075,
    GL_COLOR_ARRAY				    = 0x8076,
    GL_INDEX_ARRAY				    = 0x8077,
    GL_TEXTURE_COORD_ARRAY			= 0x8078,
    GL_EDGE_FLAG_ARRAY			    = 0x8079,
    GL_VERTEX_ARRAY_SIZE			= 0x807A,
    GL_VERTEX_ARRAY_TYPE			= 0x807B,
    GL_VERTEX_ARRAY_STRIDE			= 0x807C,
    GL_NORMAL_ARRAY_TYPE			= 0x807E,
    GL_NORMAL_ARRAY_STRIDE			= 0x807F,
    GL_COLOR_ARRAY_SIZE			    = 0x8081,
    GL_COLOR_ARRAY_TYPE			    = 0x8082,
    GL_COLOR_ARRAY_STRIDE			= 0x8083,
    GL_INDEX_ARRAY_TYPE			    = 0x8085,
    GL_INDEX_ARRAY_STRIDE			= 0x8086,
    GL_TEXTURE_COORD_ARRAY_SIZE		= 0x8088,
    GL_TEXTURE_COORD_ARRAY_TYPE		= 0x8089,
    GL_TEXTURE_COORD_ARRAY_STRIDE   = 0x808A,
    GL_EDGE_FLAG_ARRAY_STRIDE		= 0x808C,
    GL_VERTEX_ARRAY_POINTER			= 0x808E,
    GL_NORMAL_ARRAY_POINTER			= 0x808F,
    GL_COLOR_ARRAY_POINTER			= 0x8090,
    GL_INDEX_ARRAY_POINTER			= 0x8091,
    GL_TEXTURE_COORD_ARRAY_POINTER	= 0x8092,
    GL_EDGE_FLAG_ARRAY_POINTER		= 0x8093,
    GL_V2F					        = 0x2A20,
    GL_V3F					        = 0x2A21,
    GL_C4UB_V2F				        = 0x2A22,
    GL_C4UB_V3F				        = 0x2A23,
    GL_C3F_V3F				        = 0x2A24,
    GL_N3F_V3F				        = 0x2A25,
    GL_C4F_N3F_V3F				    = 0x2A26,
    GL_T2F_V3F				        = 0x2A27,
    GL_T4F_V4F				        = 0x2A28,
    GL_T2F_C4UB_V3F				    = 0x2A29,
    GL_T2F_C3F_V3F				    = 0x2A2A,
    GL_T2F_N3F_V3F				    = 0x2A2B,
    GL_T2F_C4F_N3F_V3F			    = 0x2A2C,
    GL_T4F_C4F_N3F_V4F			    = 0x2A2D
};

enum {
    GL_MATRIX_MODE				= 0x0BA0,
    GL_MODELVIEW				= 0x1700,
    GL_PROJECTION				= 0x1701,
    GL_TEXTURE				    = 0x1702,
};

enum {
    GL_POINT_SMOOTH				= 0x0B10,
    GL_POINT_SIZE				= 0x0B11,
    GL_POINT_SIZE_GRANULARITY   = 0x0B13,
    GL_POINT_SIZE_RANGE			= 0x0B12
};

enum {
    GL_LINE_SMOOTH				= 0x0B20,
    GL_LINE_STIPPLE				= 0x0B24,
    GL_LINE_STIPPLE_PATTERN		= 0x0B25,
    GL_LINE_STIPPLE_REPEAT		= 0x0B26,
    GL_LINE_WIDTH				= 0x0B21,
    GL_LINE_WIDTH_GRANULARITY	= 0x0B23,
    GL_LINE_WIDTH_RANGE			= 0x0B22
};

enum {
    GL_POINT				    = 0x1B00,
    GL_LINE					    = 0x1B01,
    GL_FILL					    = 0x1B02,
    GL_CW					    = 0x0900,
    GL_CCW					    = 0x0901,
    GL_FRONT				    = 0x0404,
    GL_BACK					    = 0x0405,
    GL_POLYGON_MODE				= 0x0B40,
    GL_POLYGON_SMOOTH			= 0x0B41,
    GL_POLYGON_STIPPLE		    = 0x0B42,
    GL_EDGE_FLAG				= 0x0B43,
    GL_CULL_FACE				= 0x0B44,
    GL_CULL_FACE_MODE			= 0x0B45,
    GL_FRONT_FACE				= 0x0B46,
    GL_POLYGON_OFFSET_FACTOR	= 0x8038,
    GL_POLYGON_OFFSET_UNITS		= 0x2A00,
    GL_POLYGON_OFFSET_POINT		= 0x2A01,
    GL_POLYGON_OFFSET_LINE		= 0x2A02,
    GL_POLYGON_OFFSET_FILL		= 0x8037
};

enum {
    GL_COMPILE				= 0x1300,
    GL_COMPILE_AND_EXECUTE	= 0x1301,
    GL_LIST_BASE			= 0x0B32,
    GL_LIST_INDEX			= 0x0B33,
    GL_LIST_MODE			= 0x0B30
};

enum {
    GL_NEVER				= 0x0200,
    GL_LESS					= 0x0201,
    GL_EQUAL				= 0x0202,
    GL_LEQUAL				= 0x0203,
    GL_GREATER				= 0x0204,
    GL_NOTEQUAL				= 0x0205,
    GL_GEQUAL				= 0x0206,
    GL_ALWAYS				= 0x0207,
    GL_DEPTH_TEST			= 0x0B71,
    GL_DEPTH_BITS			= 0x0D56,
    GL_DEPTH_CLEAR_VALUE	= 0x0B73,
    GL_DEPTH_FUNC			= 0x0B74,
    GL_DEPTH_RANGE			= 0x0B70,
    GL_DEPTH_WRITEMASK		= 0x0B72,
    GL_DEPTH_COMPONENT		= 0x1902
};

enum {
    GL_LIGHTING				     = 0x0B50,
    GL_LIGHT0				     = 0x4000,
    GL_LIGHT1				     = 0x4001,
    GL_LIGHT2				     = 0x4002,
    GL_LIGHT3			         = 0x4003,
    GL_LIGHT4				     = 0x4004,
    GL_LIGHT5				     = 0x4005,
    GL_LIGHT6				     = 0x4006,
    GL_LIGHT7				     = 0x4007,
    GL_SPOT_EXPONENT		     = 0x1205,
    GL_SPOT_CUTOFF				 = 0x1206,
    GL_CONSTANT_ATTENUATION		 = 0x1207,
    GL_LINEAR_ATTENUATION		 = 0x1208,
    GL_QUADRATIC_ATTENUATION	 = 0x1209,
    GL_AMBIENT				     = 0x1200,
    GL_DIFFUSE				     = 0x1201,
    GL_SPECULAR				     = 0x1202,
    GL_SHININESS				 = 0x1601,
    GL_EMISSION			 	     = 0x1600,
    GL_POSITION				     = 0x1203,
    GL_SPOT_DIRECTION			 = 0x1204,
    GL_AMBIENT_AND_DIFFUSE		 = 0x1602,
    GL_COLOR_INDEXES			 = 0x1603,
    GL_LIGHT_MODEL_TWO_SIDE		 = 0x0B52,
    GL_LIGHT_MODEL_LOCAL_VIEWER	 = 0x0B51,
    GL_LIGHT_MODEL_AMBIENT		 = 0x0B53,
    GL_SHADE_MODEL				 = 0x0B54,
    GL_FLAT					     = 0x1D00,
    GL_SMOOTH				     = 0x1D01,
    GL_COLOR_MATERIAL			 = 0x0B57,
    GL_COLOR_MATERIAL_FACE		 = 0x0B55,
    GL_COLOR_MATERIAL_PARAMETER	 = 0x0B56,
    GL_NORMALIZE				 = 0x0BA1
};

enum {
    GL_CLIP_PLANE0				= 0x3000,
    GL_CLIP_PLANE1				= 0x3001,
    GL_CLIP_PLANE2				= 0x3002,
    GL_CLIP_PLANE3				= 0x3003,
    GL_CLIP_PLANE4				= 0x3004,
    GL_CLIP_PLANE5				= 0x3005
};

enum {
    GL_ACCUM_RED_BITS		= 0x0D58,
    GL_ACCUM_GREEN_BITS		= 0x0D59,
    GL_ACCUM_BLUE_BITS		= 0x0D5A,
    GL_ACCUM_ALPHA_BITS		= 0x0D5B,
    GL_ACCUM_CLEAR_VALUE	= 0x0B80,
    GL_ACCUM				= 0x0100,
    GL_ADD					= 0x0104,
    GL_LOAD					= 0x0101,
    GL_MULT					= 0x0103,
    GL_RETURN				= 0x0102
};

enum {
    GL_ALPHA_TEST				= 0x0BC0,
    GL_ALPHA_TEST_REF			= 0x0BC2,
    GL_ALPHA_TEST_FUNC			= 0x0BC1
};

enum {
    GL_BLEND				 = 0x0BE2,
    GL_BLEND_SRC			 = 0x0BE1,
    GL_BLEND_DST			 = 0x0BE0,
    GL_ZERO					 = 0x0,
    GL_ONE					 = 0x1,
    GL_SRC_COLOR			 = 0x0300,
    GL_ONE_MINUS_SRC_COLOR	 = 0x0301,
    GL_SRC_ALPHA			 = 0x0302,
    GL_ONE_MINUS_SRC_ALPHA	 = 0x0303,
    GL_DST_ALPHA			 = 0x0304,
    GL_ONE_MINUS_DST_ALPHA	 = 0x0305,
    GL_DST_COLOR			 = 0x0306,
    GL_ONE_MINUS_DST_COLOR	 = 0x0307,
    GL_SRC_ALPHA_SATURATE	 = 0x0308
};

enum {
    GL_FEEDBACK				= 0x1C01,
    GL_RENDER				= 0x1C00,
    GL_SELECT				= 0x1C02
};

enum {
    GL_2D					    = 0x0600,
    GL_3D					    = 0x0601,
    GL_3D_COLOR				    = 0x0602,
    GL_3D_COLOR_TEXTURE			= 0x0603,
    GL_4D_COLOR_TEXTURE			= 0x0604,
    GL_POINT_TOKEN				= 0x0701,
    GL_LINE_TOKEN				= 0x0702,
    GL_LINE_RESET_TOKEN			= 0x0707,
    GL_POLYGON_TOKEN			= 0x0703,
    GL_BITMAP_TOKEN				= 0x0704,
    GL_DRAW_PIXEL_TOKEN			= 0x0705,
    GL_COPY_PIXEL_TOKEN			= 0x0706,
    GL_PASS_THROUGH_TOKEN		= 0x0700,
    GL_FEEDBACK_BUFFER_POINTER	= 0x0DF0,
    GL_FEEDBACK_BUFFER_SIZE		= 0x0DF1,
    GL_FEEDBACK_BUFFER_TYPE		= 0x0DF2
};

enum {
    GL_SELECTION_BUFFER_POINTER		= 0x0DF3,
    GL_SELECTION_BUFFER_SIZE		= 0x0DF4
};

enum {
    GL_FOG				    = 0x0B60,
    GL_FOG_MODE				= 0x0B65,
    GL_FOG_DENSITY			= 0x0B62,
    GL_FOG_COLOR			= 0x0B66,
    GL_FOG_INDEX			= 0x0B61,
    GL_FOG_START			= 0x0B63,
    GL_FOG_END				= 0x0B64,
    GL_LINEAR				= 0x2601,
    GL_EXP					= 0x0800,
    GL_EXP2					= 0x0801
};

enum {
    GL_LOGIC_OP				= 0x0BF1,
    GL_INDEX_LOGIC_OP		= 0x0BF1,
    GL_COLOR_LOGIC_OP		= 0x0BF2,
    GL_LOGIC_OP_MODE		= 0x0BF0,
    GL_CLEAR				= 0x1500,
    GL_SET					= 0x150F,
    GL_COPY					= 0x1503,
    GL_COPY_INVERTED		= 0x150C,
    GL_NOOP					= 0x1505,
    GL_INVERT				= 0x150A,
    GL_AND					= 0x1501,
    GL_NAND					= 0x150E,
    GL_OR					= 0x1507,
    GL_NOR					= 0x1508,
    GL_XOR					= 0x1506,
    GL_EQUIV				= 0x1509,
    GL_AND_REVERSE			= 0x1502,
    GL_AND_INVERTED			= 0x1504,
    GL_OR_REVERSE			= 0x150B,
    GL_OR_INVERTED			= 0x150D
};

enum {
    GL_STENCIL_BITS				= 0x0D57,
    GL_STENCIL_TEST				= 0x0B90,
    GL_STENCIL_CLEAR_VALUE		= 0x0B91,
    GL_STENCIL_FUNC				= 0x0B92,
    GL_STENCIL_VALUE_MASK		= 0x0B93,
    GL_STENCIL_FAIL				= 0x0B94,
    GL_STENCIL_PASS_DEPTH_FAIL	= 0x0B95,
    GL_STENCIL_PASS_DEPTH_PASS	= 0x0B96,
    GL_STENCIL_REF				= 0x0B97,
    GL_STENCIL_WRITEMASK		= 0x0B98,
    GL_STENCIL_INDEX			= 0x1901,
    GL_KEEP					    = 0x1E00,
    GL_REPLACE				    = 0x1E01,
    GL_INCR					    = 0x1E02,
    GL_DECR					    = 0x1E03
};

enum {
    GL_NONE					= 0x0,
    GL_LEFT					= 0x0406,
    GL_RIGHT				= 0x0407,
    GL_FRONT_AND_BACK		= 0x0408
};

enum {
    GL_FRONT_LEFT			= 0x0400,
    GL_FRONT_RIGHT			= 0x0401,
    GL_BACK_LEFT			= 0x0402,
    GL_BACK_RIGHT			= 0x0403,
    GL_AUX0					= 0x0409,
    GL_AUX1					= 0x040A,
    GL_AUX2					= 0x040B,
    GL_AUX3					= 0x040C,
    GL_COLOR_INDEX			= 0x1900,
    GL_RED					= 0x1903,
    GL_GREEN				= 0x1904,
    GL_BLUE					= 0x1905,
    GL_ALPHA				= 0x1906,
    GL_LUMINANCE			= 0x1909,
    GL_LUMINANCE_ALPHA		= 0x190A,
    GL_ALPHA_BITS			= 0x0D55,
    GL_RED_BITS				= 0x0D52,
    GL_GREEN_BITS			= 0x0D53,
    GL_BLUE_BITS			= 0x0D54,
    GL_INDEX_BITS			= 0x0D51,
    GL_SUBPIXEL_BITS		= 0x0D50,
    GL_AUX_BUFFERS			= 0x0C00,
    GL_READ_BUFFER			= 0x0C02,
    GL_DRAW_BUFFER			= 0x0C01,
    GL_DOUBLEBUFFER			= 0x0C32,
    GL_STEREO				= 0x0C33,
    GL_BITMAP				= 0x1A00,
    GL_COLOR				= 0x1800,
    GL_DEPTH				= 0x1801,
    GL_STENCIL				= 0x1802,
    GL_DITHER				= 0x0BD0,
    GL_RGB					= 0x1907,
    GL_RGBA					= 0x1908
};

enum {
    GL_MAX_LIST_NESTING			        = 0x0B31,
    GL_MAX_EVAL_ORDER			        = 0x0D30,
    GL_MAX_LIGHTS				        = 0x0D31,
    GL_MAX_CLIP_PLANES			        = 0x0D32,
    GL_MAX_TEXTURE_SIZE			        = 0x0D33,
    GL_MAX_PIXEL_MAP_TABLE			    = 0x0D34,
    GL_MAX_ATTRIB_STACK_DEPTH	        = 0x0D35,
    GL_MAX_MODELVIEW_STACK_DEPTH		= 0x0D36,
    GL_MAX_NAME_STACK_DEPTH			    = 0x0D37,
    GL_MAX_PROJECTION_STACK_DEPTH		= 0x0D38,
    GL_MAX_TEXTURE_STACK_DEPTH		    = 0x0D39,
    GL_MAX_VIEWPORT_DIMS			    = 0x0D3A,
    GL_MAX_CLIENT_ATTRIB_STACK_DEPTH	= 0x0D3B
};

enum {
    GL_ATTRIB_STACK_DEPTH			    = 0x0BB0,
    GL_CLIENT_ATTRIB_STACK_DEPTH		= 0x0BB1,
    GL_COLOR_CLEAR_VALUE			    = 0x0C22,
    GL_COLOR_WRITEMASK			        = 0x0C23,
    GL_CURRENT_INDEX			        = 0x0B01,
    GL_CURRENT_COLOR			        = 0x0B00,
    GL_CURRENT_NORMAL			        = 0x0B02,
    GL_CURRENT_RASTER_COLOR			    = 0x0B04,
    GL_CURRENT_RASTER_DISTANCE		    = 0x0B09,
    GL_CURRENT_RASTER_INDEX			    = 0x0B05,
    GL_CURRENT_RASTER_POSITION		    = 0x0B07,
    GL_CURRENT_RASTER_TEXTURE_COORDS	= 0x0B06,
    GL_CURRENT_RASTER_POSITION_VALID	= 0x0B08,
    GL_CURRENT_TEXTURE_COORDS		    = 0x0B03,
    GL_INDEX_CLEAR_VALUE			    = 0x0C20,
    GL_INDEX_MODE				        = 0x0C30,
    GL_INDEX_WRITEMASK			        = 0x0C21,
    GL_MODELVIEW_MATRIX			        = 0x0BA6,
    GL_MODELVIEW_STACK_DEPTH		    = 0x0BA3,
    GL_NAME_STACK_DEPTH			        = 0x0D70,
    GL_PROJECTION_MATRIX			    = 0x0BA7,
    GL_PROJECTION_STACK_DEPTH		    = 0x0BA4,
    GL_RENDER_MODE				        = 0x0C40,
    GL_RGBA_MODE				        = 0x0C31,
    GL_TEXTURE_MATRIX			        = 0x0BA8,
    GL_TEXTURE_STACK_DEPTH			    = 0x0BA5,
    GL_VIEWPORT				            = 0x0BA2
};

enum {
    GL_AUTO_NORMAL				= 0x0D80,
    GL_MAP1_COLOR_4				= 0x0D90,
    GL_MAP1_INDEX				= 0x0D91,
    GL_MAP1_NORMAL				= 0x0D92,
    GL_MAP1_TEXTURE_COORD_1		= 0x0D93,
    GL_MAP1_TEXTURE_COORD_2		= 0x0D94,
    GL_MAP1_TEXTURE_COORD_3		= 0x0D95,
    GL_MAP1_TEXTURE_COORD_4		= 0x0D96,
    GL_MAP1_VERTEX_3			= 0x0D97,
    GL_MAP1_VERTEX_4			= 0x0D98,
    GL_MAP2_COLOR_4				= 0x0DB0,
    GL_MAP2_INDEX				= 0x0DB1,
    GL_MAP2_NORMAL				= 0x0DB2,
    GL_MAP2_TEXTURE_COORD_1		= 0x0DB3,
    GL_MAP2_TEXTURE_COORD_2		= 0x0DB4,
    GL_MAP2_TEXTURE_COORD_3		= 0x0DB5,
    GL_MAP2_TEXTURE_COORD_4		= 0x0DB6,
    GL_MAP2_VERTEX_3			= 0x0DB7,
    GL_MAP2_VERTEX_4			= 0x0DB8,
    GL_MAP1_GRID_DOMAIN			= 0x0DD0,
    GL_MAP1_GRID_SEGMENTS		= 0x0DD1,
    GL_MAP2_GRID_DOMAIN			= 0x0DD2,
    GL_MAP2_GRID_SEGMENTS		= 0x0DD3,
    GL_COEFF				    = 0x0A00,
    GL_ORDER				    = 0x0A01,
    GL_DOMAIN				    = 0x0A02
};

enum {
    GL_PERSPECTIVE_CORRECTION_HINT		= 0x0C50,
    GL_POINT_SMOOTH_HINT			    = 0x0C51,
    GL_LINE_SMOOTH_HINT			        = 0x0C52,
    GL_POLYGON_SMOOTH_HINT			    = 0x0C53,
    GL_FOG_HINT				            = 0x0C54,
    GL_DONT_CARE				        = 0x1100,
    GL_FASTEST				            = 0x1101,
    GL_NICEST				            = 0x1102
};

enum {
    GL_SCISSOR_BOX				= 0x0C10,
    GL_SCISSOR_TEST				= 0x0C11
};

enum {
    GL_MAP_COLOR				= 0x0D10,
    GL_MAP_STENCIL				= 0x0D11,
    GL_INDEX_SHIFT				= 0x0D12,
    GL_INDEX_OFFSET				= 0x0D13,
    GL_RED_SCALE				= 0x0D14,
    GL_RED_BIAS				    = 0x0D15,
    GL_GREEN_SCALE				= 0x0D18,
    GL_GREEN_BIAS				= 0x0D19,
    GL_BLUE_SCALE				= 0x0D1A,
    GL_BLUE_BIAS				= 0x0D1B,
    GL_ALPHA_SCALE				= 0x0D1C,
    GL_ALPHA_BIAS				= 0x0D1D,
    GL_DEPTH_SCALE				= 0x0D1E,
    GL_DEPTH_BIAS				= 0x0D1F,
    GL_PIXEL_MAP_S_TO_S_SIZE	= 0x0CB1,
    GL_PIXEL_MAP_I_TO_I_SIZE	= 0x0CB0,
    GL_PIXEL_MAP_I_TO_R_SIZE	= 0x0CB2,
    GL_PIXEL_MAP_I_TO_G_SIZE	= 0x0CB3,
    GL_PIXEL_MAP_I_TO_B_SIZE	= 0x0CB4,
    GL_PIXEL_MAP_I_TO_A_SIZE	= 0x0CB5,
    GL_PIXEL_MAP_R_TO_R_SIZE	= 0x0CB6,
    GL_PIXEL_MAP_G_TO_G_SIZE	= 0x0CB7,
    GL_PIXEL_MAP_B_TO_B_SIZE	= 0x0CB8,
    GL_PIXEL_MAP_A_TO_A_SIZE	= 0x0CB9,
    GL_PIXEL_MAP_S_TO_S			= 0x0C71,
    GL_PIXEL_MAP_I_TO_I			= 0x0C70,
    GL_PIXEL_MAP_I_TO_R			= 0x0C72,
    GL_PIXEL_MAP_I_TO_G			= 0x0C73,
    GL_PIXEL_MAP_I_TO_B			= 0x0C74,
    GL_PIXEL_MAP_I_TO_A			= 0x0C75,
    GL_PIXEL_MAP_R_TO_R			= 0x0C76,
    GL_PIXEL_MAP_G_TO_G			= 0x0C77,
    GL_PIXEL_MAP_B_TO_B			= 0x0C78,
    GL_PIXEL_MAP_A_TO_A			= 0x0C79,
    GL_PACK_ALIGNMENT			= 0x0D05,
    GL_PACK_LSB_FIRST			= 0x0D01,
    GL_PACK_ROW_LENGTH			= 0x0D02,
    GL_PACK_SKIP_PIXELS			= 0x0D04,
    GL_PACK_SKIP_ROWS			= 0x0D03,
    GL_PACK_SWAP_BYTES			= 0x0D00,
    GL_UNPACK_ALIGNMENT			= 0x0CF5,
    GL_UNPACK_LSB_FIRST			= 0x0CF1,
    GL_UNPACK_ROW_LENGTH		= 0x0CF2,
    GL_UNPACK_SKIP_PIXELS		= 0x0CF4,
    GL_UNPACK_SKIP_ROWS			= 0x0CF3,
    GL_UNPACK_SWAP_BYTES		= 0x0CF0,
    GL_ZOOM_X				    = 0x0D16,
    GL_ZOOM_Y				    = 0x0D17
};

enum {
    GL_TEXTURE_ENV				= 0x2300,
    GL_TEXTURE_ENV_MODE			= 0x2200,
    GL_TEXTURE_1D				= 0x0DE0,
    GL_TEXTURE_2D				= 0x0DE1,
    GL_TEXTURE_WRAP_S			= 0x2802,
    GL_TEXTURE_WRAP_T			= 0x2803,
    GL_TEXTURE_MAG_FILTER		= 0x2800,
    GL_TEXTURE_MIN_FILTER		= 0x2801,
    GL_TEXTURE_ENV_COLOR		= 0x2201,
    GL_TEXTURE_GEN_S			= 0x0C60,
    GL_TEXTURE_GEN_T			= 0x0C61,
    GL_TEXTURE_GEN_R			= 0x0C62,
    GL_TEXTURE_GEN_Q			= 0x0C63,
    GL_TEXTURE_GEN_MODE			= 0x2500,
    GL_TEXTURE_BORDER_COLOR		= 0x1004,
    GL_TEXTURE_WIDTH			= 0x1000,
    GL_TEXTURE_HEIGHT			= 0x1001,
    GL_TEXTURE_BORDER			= 0x1005,
    GL_TEXTURE_COMPONENTS		= 0x1003,
    GL_TEXTURE_RED_SIZE			= 0x805C,
    GL_TEXTURE_GREEN_SIZE		= 0x805D,
    GL_TEXTURE_BLUE_SIZE		= 0x805E,
    GL_TEXTURE_ALPHA_SIZE		= 0x805F,
    GL_TEXTURE_LUMINANCE_SIZE	= 0x8060,
    GL_TEXTURE_INTENSITY_SIZE	= 0x8061,
    GL_NEAREST_MIPMAP_NEAREST	= 0x2700,
    GL_NEAREST_MIPMAP_LINEAR	= 0x2702,
    GL_LINEAR_MIPMAP_NEAREST	= 0x2701,
    GL_LINEAR_MIPMAP_LINEAR		= 0x2703,
    GL_OBJECT_LINEAR			= 0x2401,
    GL_OBJECT_PLANE				= 0x2501,
    GL_EYE_LINEAR				= 0x2400,
    GL_EYE_PLANE				= 0x2502,
    GL_SPHERE_MAP				= 0x2402,
    GL_DECAL				    = 0x2101,
    GL_MODULATE				    = 0x2100,
    GL_NEAREST				    = 0x2600,
    GL_REPEAT			        = 0x2901,
    GL_CLAMP				    = 0x2900,
    GL_S					    = 0x2000,
    GL_T					    = 0x2001,
    GL_R					    = 0x2002,
    GL_Q					    = 0x2003
};

enum {
    GL_VENDOR				= 0x1F00,
    GL_RENDERER				= 0x1F01,
    GL_VERSION				= 0x1F02,
    GL_EXTENSIONS			= 0x1F03
};

enum {
    GL_NO_ERROR 				= 0x0,
    GL_INVALID_ENUM				= 0x0500,
    GL_INVALID_VALUE			= 0x0501,
    GL_INVALID_OPERATION		= 0x0502,
    GL_STACK_OVERFLOW			= 0x0503,
    GL_STACK_UNDERFLOW			= 0x0504,
    GL_OUT_OF_MEMORY			= 0x0505,
};

enum {
    GL_CURRENT_BIT			= 0x00000001,
    GL_POINT_BIT			= 0x00000002,
    GL_LINE_BIT				= 0x00000004,
    GL_POLYGON_BIT			= 0x00000008,
    GL_POLYGON_STIPPLE_BIT	= 0x00000010,
    GL_PIXEL_MODE_BIT		= 0x00000020,
    GL_LIGHTING_BIT			= 0x00000040,
    GL_FOG_BIT				= 0x00000080,
    GL_DEPTH_BUFFER_BIT		= 0x00000100,
    GL_ACCUM_BUFFER_BIT		= 0x00000200,
    GL_STENCIL_BUFFER_BIT	= 0x00000400,
    GL_VIEWPORT_BIT			= 0x00000800,
    GL_TRANSFORM_BIT		= 0x00001000,
    GL_ENABLE_BIT			= 0x00002000,
    GL_COLOR_BUFFER_BIT		= 0x00004000,
    GL_HINT_BIT				= 0x00008000,
    GL_EVAL_BIT				= 0x00010000,
    GL_LIST_BIT				= 0x00020000,
    GL_TEXTURE_BIT			= 0x00040000,
    GL_SCISSOR_BIT			= 0x00080000,
    GL_ALL_ATTRIB_BITS		= 0x000FFFFF
};

enum {
    GL_PROXY_TEXTURE_1D			= 0x8063,
    GL_PROXY_TEXTURE_2D			= 0x8064,
    GL_TEXTURE_PRIORITY			= 0x8066,
    GL_TEXTURE_RESIDENT			= 0x8067,
    GL_TEXTURE_BINDING_1D		= 0x8068,
    GL_TEXTURE_BINDING_2D		= 0x8069,
    GL_TEXTURE_INTERNAL_FORMAT	= 0x1003,
    GL_ALPHA4				    = 0x803B,
    GL_ALPHA8				    = 0x803C,
    GL_ALPHA12				    = 0x803D,
    GL_ALPHA16				    = 0x803E,
    GL_LUMINANCE4				= 0x803F,
    GL_LUMINANCE8				= 0x8040,
    GL_LUMINANCE12				= 0x8041,
    GL_LUMINANCE16				= 0x8042,
    GL_LUMINANCE4_ALPHA4		= 0x8043,
    GL_LUMINANCE6_ALPHA2		= 0x8044,
    GL_LUMINANCE8_ALPHA8		= 0x8045,
    GL_LUMINANCE12_ALPHA4		= 0x8046,
    GL_LUMINANCE12_ALPHA12		= 0x8047,
    GL_LUMINANCE16_ALPHA16		= 0x8048,
    GL_INTENSITY				= 0x8049,
    GL_INTENSITY4				= 0x804A,
    GL_INTENSITY8				= 0x804B,
    GL_INTENSITY12				= 0x804C,
    GL_INTENSITY16				= 0x804D,
    GL_R3_G3_B2				    = 0x2A10,
    GL_RGB4					    = 0x804F,
    GL_RGB5				        = 0x8050,
    GL_RGB8					    = 0x8051,
    GL_RGB10				    = 0x8052,
    GL_RGB12				    = 0x8053,
    GL_RGB16				    = 0x8054,
    GL_RGBA2				    = 0x8055,
    GL_RGBA4				    = 0x8056,
    GL_RGB5_A1				    = 0x8057,
    GL_RGBA8				    = 0x8058,
    GL_RGB10_A2				    = 0x8059,
    GL_RGBA12				    = 0x805A,
    GL_RGBA16				    = 0x805B,
    GL_CLIENT_PIXEL_STORE_BIT	= 0x00000001,
    GL_CLIENT_VERTEX_ARRAY_BIT	= 0x00000002,
    GL_ALL_CLIENT_ATTRIB_BITS 	= 0xFFFFFFFF,
    GL_CLIENT_ALL_ATTRIB_BITS 	= 0xFFFFFFFF
};

void glClearIndex( GLfloat c );
void glClearColor( GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha );
void glClear( GLbitfield mask );
void glIndexMask( GLuint mask );
void glColorMask( GLboolean red, GLboolean green, GLboolean blue, GLboolean alpha );
void glAlphaFunc( GLenum func, GLclampf ref );
void glBlendFunc( GLenum sfactor, GLenum dfactor );
void glLogicOp( GLenum opcode );
void glCullFace( GLenum mode );
void glFrontFace( GLenum mode );
void glPointSize( GLfloat size );
void glLineWidth( GLfloat width );
void glLineStipple( GLint factor, GLushort pattern );
void glPolygonMode( GLenum face, GLenum mode );
void glPolygonOffset( GLfloat factor, GLfloat units );
void glPolygonStipple( const GLubyte *mask );
void glGetPolygonStipple( GLubyte *mask );
void glEdgeFlag( GLboolean flag );
void glEdgeFlagv( const GLboolean *flag );
void glScissor( GLint x, GLint y, GLsizei width, GLsizei height);
void glClipPlane( GLenum plane, const GLdouble *equation );
void glGetClipPlane( GLenum plane, GLdouble *equation );
void glDrawBuffer( GLenum mode );
void glReadBuffer( GLenum mode );
void glEnable( GLenum cap );
void glDisable( GLenum cap );
GLboolean glIsEnabled( GLenum cap );
void glEnableClientState( GLenum cap );  /* 1.1 */
void glDisableClientState( GLenum cap );  /* 1.1 */
void glGetBooleanv( GLenum pname, GLboolean *params );
void glGetDoublev( GLenum pname, GLdouble *params );
void glGetFloatv( GLenum pname, GLfloat *params );
void glGetIntegerv( GLenum pname, GLint *params );
void glPushAttrib( GLbitfield mask );
void glPopAttrib( void );
void glPushClientAttrib( GLbitfield mask );  /* 1.1 */
void glPopClientAttrib( void );  /* 1.1 */
GLint  glRenderMode( GLenum mode );
GLenum  glGetError( void );
const GLubyte *  glGetString( GLenum name );
void glFinish( void );
void glFlush( void );
void glHint( GLenum target, GLenum mode );
void glClearDepth( GLclampd depth );
void glDepthFunc( GLenum func );
void glDepthMask( GLboolean flag );
void glDepthRange( GLclampd near_val, GLclampd far_val );
void glClearAccum( GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha );
void glAccum( GLenum op, GLfloat value );
void glMatrixMode( GLenum mode );
void glOrtho( GLdouble left, GLdouble right,
                                 GLdouble bottom, GLdouble top,
                                 GLdouble near_val, GLdouble far_val );
void glFrustum( GLdouble left, GLdouble right,
                                   GLdouble bottom, GLdouble top,
                                   GLdouble near_val, GLdouble far_val );
void glViewport( GLint x, GLint y,
                                    GLsizei width, GLsizei height );
void glPushMatrix( void );
void glPopMatrix( void );
void glLoadIdentity( void );
void glLoadMatrixd( const GLdouble *m );
void glLoadMatrixf( const GLfloat *m );
void glMultMatrixd( const GLdouble *m );
void glMultMatrixf( const GLfloat *m );
void glRotated( GLdouble angle,
                                   GLdouble x, GLdouble y, GLdouble z );
void glRotatef( GLfloat angle,
                                   GLfloat x, GLfloat y, GLfloat z );
void glScaled( GLdouble x, GLdouble y, GLdouble z );
void glScalef( GLfloat x, GLfloat y, GLfloat z );
void glTranslated( GLdouble x, GLdouble y, GLdouble z );
void glTranslatef( GLfloat x, GLfloat y, GLfloat z );
GLboolean  glIsList( GLuint list );
void glDeleteLists( GLuint list, GLsizei range );
GLuint  glGenLists( GLsizei range );
void glNewList( GLuint list, GLenum mode );
void glEndList( void );
void glCallList( GLuint list );
void glCallLists( GLsizei n, GLenum type,
                                     const GLvoid *lists );
void glListBase( GLuint base );
void glBegin( GLenum mode );
void glEnd( void );
void glVertex2d( GLdouble x, GLdouble y );
void glVertex2f( GLfloat x, GLfloat y );
void glVertex2i( GLint x, GLint y );
void glVertex2s( GLshort x, GLshort y );
void glVertex3d( GLdouble x, GLdouble y, GLdouble z );
void glVertex3f( GLfloat x, GLfloat y, GLfloat z );
void glVertex3i( GLint x, GLint y, GLint z );
void glVertex3s( GLshort x, GLshort y, GLshort z );
void glVertex4d( GLdouble x, GLdouble y, GLdouble z, GLdouble w );
void glVertex4f( GLfloat x, GLfloat y, GLfloat z, GLfloat w );
void glVertex4i( GLint x, GLint y, GLint z, GLint w );
void glVertex4s( GLshort x, GLshort y, GLshort z, GLshort w );
void glVertex2dv( const GLdouble *v );
void glVertex2fv( const GLfloat *v );
void glVertex2iv( const GLint *v );
void glVertex2sv( const GLshort *v );
void glVertex3dv( const GLdouble *v );
void glVertex3fv( const GLfloat *v );
void glVertex3iv( const GLint *v );
void glVertex3sv( const GLshort *v );
void glVertex4dv( const GLdouble *v );
void glVertex4fv( const GLfloat *v );
void glVertex4iv( const GLint *v );
void glVertex4sv( const GLshort *v );
void glNormal3b( GLbyte nx, GLbyte ny, GLbyte nz );
void glNormal3d( GLdouble nx, GLdouble ny, GLdouble nz );
void glNormal3f( GLfloat nx, GLfloat ny, GLfloat nz );
void glNormal3i( GLint nx, GLint ny, GLint nz );
void glNormal3s( GLshort nx, GLshort ny, GLshort nz );
void glNormal3bv( const GLbyte *v );
void glNormal3dv( const GLdouble *v );
void glNormal3fv( const GLfloat *v );
void glNormal3iv( const GLint *v );
void glNormal3sv( const GLshort *v );
void glIndexd( GLdouble c );
void glIndexf( GLfloat c );
void glIndexi( GLint c );
void glIndexs( GLshort c );
void glIndexub( GLubyte c );  /* 1.1 */
void glIndexdv( const GLdouble *c );
void glIndexfv( const GLfloat *c );
void glIndexiv( const GLint *c );
void glIndexsv( const GLshort *c );
void glIndexubv( const GLubyte *c );  /* 1.1 */
void glColor3b( GLbyte red, GLbyte green, GLbyte blue );
void glColor3d( GLdouble red, GLdouble green, GLdouble blue );
void glColor3f( GLfloat red, GLfloat green, GLfloat blue );
void glColor3i( GLint red, GLint green, GLint blue );
void glColor3s( GLshort red, GLshort green, GLshort blue );
void glColor3ub( GLubyte red, GLubyte green, GLubyte blue );
void glColor3ui( GLuint red, GLuint green, GLuint blue );
void glColor3us( GLushort red, GLushort green, GLushort blue );
void glColor4b( GLbyte red, GLbyte green,
                                   GLbyte blue, GLbyte alpha );
void glColor4d( GLdouble red, GLdouble green,
                                   GLdouble blue, GLdouble alpha );
void glColor4f( GLfloat red, GLfloat green,
                                   GLfloat blue, GLfloat alpha );
void glColor4i( GLint red, GLint green,
                                   GLint blue, GLint alpha );
void glColor4s( GLshort red, GLshort green,
                                   GLshort blue, GLshort alpha );
void glColor4ub( GLubyte red, GLubyte green,
                                    GLubyte blue, GLubyte alpha );
void glColor4ui( GLuint red, GLuint green,
                                    GLuint blue, GLuint alpha );
void glColor4us( GLushort red, GLushort green,
                                    GLushort blue, GLushort alpha );
void glColor3bv( const GLbyte *v );
void glColor3dv( const GLdouble *v );
void glColor3fv( const GLfloat *v );
void glColor3iv( const GLint *v );
void glColor3sv( const GLshort *v );
void glColor3ubv( const GLubyte *v );
void glColor3uiv( const GLuint *v );
void glColor3usv( const GLushort *v );
void glColor4bv( const GLbyte *v );
void glColor4dv( const GLdouble *v );
void glColor4fv( const GLfloat *v );
void glColor4iv( const GLint *v );
void glColor4sv( const GLshort *v );
void glColor4ubv( const GLubyte *v );
void glColor4uiv( const GLuint *v );
void glColor4usv( const GLushort *v );
void glTexCoord1d( GLdouble s );
void glTexCoord1f( GLfloat s );
void glTexCoord1i( GLint s );
void glTexCoord1s( GLshort s );
void glTexCoord2d( GLdouble s, GLdouble t );
void glTexCoord2f( GLfloat s, GLfloat t );
void glTexCoord2i( GLint s, GLint t );
void glTexCoord2s( GLshort s, GLshort t );
void glTexCoord3d( GLdouble s, GLdouble t, GLdouble r );
void glTexCoord3f( GLfloat s, GLfloat t, GLfloat r );
void glTexCoord3i( GLint s, GLint t, GLint r );
void glTexCoord3s( GLshort s, GLshort t, GLshort r );
void glTexCoord4d( GLdouble s, GLdouble t, GLdouble r, GLdouble q );
void glTexCoord4f( GLfloat s, GLfloat t, GLfloat r, GLfloat q );
void glTexCoord4i( GLint s, GLint t, GLint r, GLint q );
void glTexCoord4s( GLshort s, GLshort t, GLshort r, GLshort q );
void glTexCoord1dv( const GLdouble *v );
void glTexCoord1fv( const GLfloat *v );
void glTexCoord1iv( const GLint *v );
void glTexCoord1sv( const GLshort *v );
void glTexCoord2dv( const GLdouble *v );
void glTexCoord2fv( const GLfloat *v );
void glTexCoord2iv( const GLint *v );
void glTexCoord2sv( const GLshort *v );
void glTexCoord3dv( const GLdouble *v );
void glTexCoord3fv( const GLfloat *v );
void glTexCoord3iv( const GLint *v );
void glTexCoord3sv( const GLshort *v );
void glTexCoord4dv( const GLdouble *v );
void glTexCoord4fv( const GLfloat *v );
void glTexCoord4iv( const GLint *v );
void glTexCoord4sv( const GLshort *v );
void glRasterPos2d( GLdouble x, GLdouble y );
void glRasterPos2f( GLfloat x, GLfloat y );
void glRasterPos2i( GLint x, GLint y );
void glRasterPos2s( GLshort x, GLshort y );
void glRasterPos3d( GLdouble x, GLdouble y, GLdouble z );
void glRasterPos3f( GLfloat x, GLfloat y, GLfloat z );
void glRasterPos3i( GLint x, GLint y, GLint z );
void glRasterPos3s( GLshort x, GLshort y, GLshort z );
void glRasterPos4d( GLdouble x, GLdouble y, GLdouble z, GLdouble w );
void glRasterPos4f( GLfloat x, GLfloat y, GLfloat z, GLfloat w );
void glRasterPos4i( GLint x, GLint y, GLint z, GLint w );
void glRasterPos4s( GLshort x, GLshort y, GLshort z, GLshort w );
void glRasterPos2dv( const GLdouble *v );
void glRasterPos2fv( const GLfloat *v );
void glRasterPos2iv( const GLint *v );
void glRasterPos2sv( const GLshort *v );
void glRasterPos3dv( const GLdouble *v );
void glRasterPos3fv( const GLfloat *v );
void glRasterPos3iv( const GLint *v );
void glRasterPos3sv( const GLshort *v );
void glRasterPos4dv( const GLdouble *v );
void glRasterPos4fv( const GLfloat *v );
void glRasterPos4iv( const GLint *v );
void glRasterPos4sv( const GLshort *v );
void glRectd( GLdouble x1, GLdouble y1, GLdouble x2, GLdouble y2 );
void glRectf( GLfloat x1, GLfloat y1, GLfloat x2, GLfloat y2 );
void glRecti( GLint x1, GLint y1, GLint x2, GLint y2 );
void glRects( GLshort x1, GLshort y1, GLshort x2, GLshort y2 );
void glRectdv( const GLdouble *v1, const GLdouble *v2 );
void glRectfv( const GLfloat *v1, const GLfloat *v2 );
void glRectiv( const GLint *v1, const GLint *v2 );
void glRectsv( const GLshort *v1, const GLshort *v2 );
void glVertexPointer( GLint size, GLenum type,
                                       GLsizei stride, const GLvoid *ptr );
void glNormalPointer( GLenum type, GLsizei stride,
                                       const GLvoid *ptr );
void glColorPointer( GLint size, GLenum type,
                                      GLsizei stride, const GLvoid *ptr );
void glIndexPointer( GLenum type, GLsizei stride,
                                      const GLvoid *ptr );
void glTexCoordPointer( GLint size, GLenum type,
                                         GLsizei stride, const GLvoid *ptr );
void glEdgeFlagPointer( GLsizei stride, const GLvoid *ptr );
void glGetPointerv( GLenum pname, GLvoid **params );
void glArrayElement( GLint i );
void glDrawArrays( GLenum mode, GLint first, GLsizei count );
void glDrawElements( GLenum mode, GLsizei count,
                                      GLenum type, const GLvoid *indices );
void glInterleavedArrays( GLenum format, GLsizei stride,
                                           const GLvoid *pointer );

void glShadeModel( GLenum mode );
void glLightf( GLenum light, GLenum pname, GLfloat param );
void glLighti( GLenum light, GLenum pname, GLint param );
void glLightfv( GLenum light, GLenum pname,
                                 const GLfloat *params );
void glLightiv( GLenum light, GLenum pname,
                                 const GLint *params );
void glGetLightfv( GLenum light, GLenum pname,
                                    GLfloat *params );
void glGetLightiv( GLenum light, GLenum pname,
                                    GLint *params );
void glLightModelf( GLenum pname, GLfloat param );
void glLightModeli( GLenum pname, GLint param );
void glLightModelfv( GLenum pname, const GLfloat *params );
void glLightModeliv( GLenum pname, const GLint *params );
void glMaterialf( GLenum face, GLenum pname, GLfloat param );
void glMateriali( GLenum face, GLenum pname, GLint param );
void glMaterialfv( GLenum face, GLenum pname, const GLfloat *params );
void glMaterialiv( GLenum face, GLenum pname, const GLint *params );
void glGetMaterialfv( GLenum face, GLenum pname, GLfloat *params );
void glGetMaterialiv( GLenum face, GLenum pname, GLint *params );
void glColorMaterial( GLenum face, GLenum mode );
void glPixelZoom( GLfloat xfactor, GLfloat yfactor );
void glPixelStoref( GLenum pname, GLfloat param );
void glPixelStorei( GLenum pname, GLint param );
void glPixelTransferf( GLenum pname, GLfloat param );
void glPixelTransferi( GLenum pname, GLint param );
void glPixelMapfv( GLenum map, GLsizei mapsize,
                                    const GLfloat *values );
void glPixelMapuiv( GLenum map, GLsizei mapsize,
                                     const GLuint *values );
void glPixelMapusv( GLenum map, GLsizei mapsize,
                                     const GLushort *values );
void glGetPixelMapfv( GLenum map, GLfloat *values );
void glGetPixelMapuiv( GLenum map, GLuint *values );
void glGetPixelMapusv( GLenum map, GLushort *values );
void glBitmap( GLsizei width, GLsizei height,
                                GLfloat xorig, GLfloat yorig,
                                GLfloat xmove, GLfloat ymove,
                                const GLubyte *bitmap );
void glReadPixels( GLint x, GLint y,
                                    GLsizei width, GLsizei height,
                                    GLenum format, GLenum type,
                                    GLvoid *pixels );
void glDrawPixels( GLsizei width, GLsizei height,
                                    GLenum format, GLenum type,
                                    const GLvoid *pixels );
void glCopyPixels( GLint x, GLint y,
                                    GLsizei width, GLsizei height,
                                    GLenum type );
void glStencilFunc( GLenum func, GLint ref, GLuint mask );
void glStencilMask( GLuint mask );
void glStencilOp( GLenum fail, GLenum zfail, GLenum zpass );
void glClearStencil( GLint s );
void glTexGend( GLenum coord, GLenum pname, GLdouble param );
void glTexGenf( GLenum coord, GLenum pname, GLfloat param );
void glTexGeni( GLenum coord, GLenum pname, GLint param );
void glTexGendv( GLenum coord, GLenum pname, const GLdouble *params );
void glTexGenfv( GLenum coord, GLenum pname, const GLfloat *params );
void glTexGeniv( GLenum coord, GLenum pname, const GLint *params );
void glGetTexGendv( GLenum coord, GLenum pname, GLdouble *params );
void glGetTexGenfv( GLenum coord, GLenum pname, GLfloat *params );
void glGetTexGeniv( GLenum coord, GLenum pname, GLint *params );
void glTexEnvf( GLenum target, GLenum pname, GLfloat param );
void glTexEnvi( GLenum target, GLenum pname, GLint param );
void glTexEnvfv( GLenum target, GLenum pname, const GLfloat *params );
void glTexEnviv( GLenum target, GLenum pname, const GLint *params );
void glGetTexEnvfv( GLenum target, GLenum pname, GLfloat *params );
void glGetTexEnviv( GLenum target, GLenum pname, GLint *params );
void glTexParameterf( GLenum target, GLenum pname, GLfloat param );
void glTexParameteri( GLenum target, GLenum pname, GLint param );
void glTexParameterfv( GLenum target, GLenum pname,
                                          const GLfloat *params );
void glTexParameteriv( GLenum target, GLenum pname,
                                          const GLint *params );
void glGetTexParameterfv( GLenum target,
                                           GLenum pname, GLfloat *params);
void glGetTexParameteriv( GLenum target,
                                           GLenum pname, GLint *params );
void glGetTexLevelParameterfv( GLenum target, GLint level,
                                                GLenum pname, GLfloat *params );
void glGetTexLevelParameteriv( GLenum target, GLint level,
                                                GLenum pname, GLint *params );
void glTexImage1D( GLenum target, GLint level,
                                    GLint internalFormat,
                                    GLsizei width, GLint border,
                                    GLenum format, GLenum type,
                                    const GLvoid *pixels );
void glTexImage2D( GLenum target, GLint level,
                                    GLint internalFormat,
                                    GLsizei width, GLsizei height,
                                    GLint border, GLenum format, GLenum type,
                                    const GLvoid *pixels );
void glGetTexImage( GLenum target, GLint level,
                                     GLenum format, GLenum type,
                                     GLvoid *pixels );
void glGenTextures( GLsizei n, GLuint *textures );
void glDeleteTextures( GLsizei n, const GLuint *textures);
void glBindTexture( GLenum target, GLuint texture );
void glPrioritizeTextures( GLsizei n,
                                            const GLuint *textures,
                                            const GLclampf *priorities );
GLboolean  glAreTexturesResident( GLsizei n,
                                                  const GLuint *textures,
                                                  GLboolean *residences );
GLboolean  glIsTexture( GLuint texture );
void glTexSubImage1D( GLenum target, GLint level,
                                       GLint xoffset,
                                       GLsizei width, GLenum format,
                                       GLenum type, const GLvoid *pixels );
void glTexSubImage2D( GLenum target, GLint level,
                                       GLint xoffset, GLint yoffset,
                                       GLsizei width, GLsizei height,
                                       GLenum format, GLenum type,
                                       const GLvoid *pixels );
void glCopyTexImage1D( GLenum target, GLint level,
                                        GLenum internalformat,
                                        GLint x, GLint y,
                                        GLsizei width, GLint border );
void glCopyTexImage2D( GLenum target, GLint level,
                                        GLenum internalformat,
                                        GLint x, GLint y,
                                        GLsizei width, GLsizei height,
                                        GLint border );
void glCopyTexSubImage1D( GLenum target, GLint level,
                                           GLint xoffset, GLint x, GLint y,
                                           GLsizei width );
void glCopyTexSubImage2D( GLenum target, GLint level,
                                           GLint xoffset, GLint yoffset,
                                           GLint x, GLint y,
                                           GLsizei width, GLsizei height );
void glMap1d( GLenum target, GLdouble u1, GLdouble u2,
                               GLint stride,
                               GLint order, const GLdouble *points );
void glMap1f( GLenum target, GLfloat u1, GLfloat u2,
                               GLint stride,
                               GLint order, const GLfloat *points );
void glMap2d( GLenum target,
		     GLdouble u1, GLdouble u2, GLint ustride, GLint uorder,
		     GLdouble v1, GLdouble v2, GLint vstride, GLint vorder,
		     const GLdouble *points );
void glMap2f( GLenum target,
		     GLfloat u1, GLfloat u2, GLint ustride, GLint uorder,
		     GLfloat v1, GLfloat v2, GLint vstride, GLint vorder,
		     const GLfloat *points );
void glGetMapdv( GLenum target, GLenum query, GLdouble *v );
void glGetMapfv( GLenum target, GLenum query, GLfloat *v );
void glGetMapiv( GLenum target, GLenum query, GLint *v );
void glEvalCoord1d( GLdouble u );
void glEvalCoord1f( GLfloat u );
void glEvalCoord1dv( const GLdouble *u );
void glEvalCoord1fv( const GLfloat *u );
void glEvalCoord2d( GLdouble u, GLdouble v );
void glEvalCoord2f( GLfloat u, GLfloat v );
void glEvalCoord2dv( const GLdouble *u );
void glEvalCoord2fv( const GLfloat *u );
void glMapGrid1d( GLint un, GLdouble u1, GLdouble u2 );
void glMapGrid1f( GLint un, GLfloat u1, GLfloat u2 );
void glMapGrid2d( GLint un, GLdouble u1, GLdouble u2,
                                   GLint vn, GLdouble v1, GLdouble v2 );
void glMapGrid2f( GLint un, GLfloat u1, GLfloat u2,
                                   GLint vn, GLfloat v1, GLfloat v2 );
void glEvalPoint1( GLint i );
void glEvalPoint2( GLint i, GLint j );
void glEvalMesh1( GLenum mode, GLint i1, GLint i2 );
void glEvalMesh2( GLenum mode, GLint i1, GLint i2, GLint j1, GLint j2 );
void glFogf( GLenum pname, GLfloat param );
void glFogi( GLenum pname, GLint param );
void glFogfv( GLenum pname, const GLfloat *params );
void glFogiv( GLenum pname, const GLint *params );
void glFeedbackBuffer( GLsizei size, GLenum type, GLfloat *buffer );
void glPassThrough( GLfloat token );
void glSelectBuffer( GLsizei size, GLuint *buffer );
void glInitNames( void );
void glLoadName( GLuint name );
void glPushName( GLuint name );
void glPopName( void );

enum {
    GL_RESCALE_NORMAL			        = 0x803A,
    GL_CLAMP_TO_EDGE			        = 0x812F,
    GL_MAX_ELEMENTS_VERTICES		    = 0x80E8,
    GL_MAX_ELEMENTS_INDICES			    = 0x80E9,
    GL_BGR					            = 0x80E0,
    GL_BGRA					            = 0x80E1,
    GL_UNSIGNED_BYTE_3_3_2			    = 0x8032,
    GL_UNSIGNED_BYTE_2_3_3_REV		    = 0x8362,
    GL_UNSIGNED_SHORT_5_6_5			    = 0x8363,
    GL_UNSIGNED_SHORT_5_6_5_REV		    = 0x8364,
    GL_UNSIGNED_SHORT_4_4_4_4		    = 0x8033,
    GL_UNSIGNED_SHORT_4_4_4_4_REV		= 0x8365,
    GL_UNSIGNED_SHORT_5_5_5_1		    = 0x8034,
    GL_UNSIGNED_SHORT_1_5_5_5_REV		= 0x8366,
    GL_UNSIGNED_INT_8_8_8_8			    = 0x8035,
    GL_UNSIGNED_INT_8_8_8_8_REV		    = 0x8367,
    GL_UNSIGNED_INT_10_10_10_2		    = 0x8036,
    GL_UNSIGNED_INT_2_10_10_10_REV		= 0x8368,
    GL_LIGHT_MODEL_COLOR_CONTROL		= 0x81F8,
    GL_SINGLE_COLOR				        = 0x81F9,
    GL_SEPARATE_SPECULAR_COLOR		    = 0x81FA,
    GL_TEXTURE_MIN_LOD			        = 0x813A,
    GL_TEXTURE_MAX_LOD			        = 0x813B,
    GL_TEXTURE_BASE_LEVEL			    = 0x813C,
    GL_TEXTURE_MAX_LEVEL			    = 0x813D,
    GL_SMOOTH_POINT_SIZE_RANGE		    = 0x0B12,
    GL_SMOOTH_POINT_SIZE_GRANULARITY	= 0x0B13,
    GL_SMOOTH_LINE_WIDTH_RANGE		    = 0x0B22,
    GL_SMOOTH_LINE_WIDTH_GRANULARITY	= 0x0B23,
    GL_ALIASED_POINT_SIZE_RANGE		    = 0x846D,
    GL_ALIASED_LINE_WIDTH_RANGE		    = 0x846E,
    GL_PACK_SKIP_IMAGES			        = 0x806B,
    GL_PACK_IMAGE_HEIGHT			    = 0x806C,
    GL_UNPACK_SKIP_IMAGES			    = 0x806D,
    GL_UNPACK_IMAGE_HEIGHT			    = 0x806E,
    GL_TEXTURE_3D				        = 0x806F,
    GL_PROXY_TEXTURE_3D			        = 0x8070,
    GL_TEXTURE_DEPTH			        = 0x8071,
    GL_TEXTURE_WRAP_R			        = 0x8072,
    GL_MAX_3D_TEXTURE_SIZE			    = 0x8073,
    GL_TEXTURE_BINDING_3D			    = 0x806A
};

void glDrawRangeElements( GLenum mode, GLuint start,
	GLuint end, GLsizei count, GLenum type, const GLvoid *indices );
void glTexImage3D( GLenum target, GLint level,
                                      GLint internalFormat,
                                      GLsizei width, GLsizei height,
                                      GLsizei depth, GLint border,
                                      GLenum format, GLenum type,
                                      const GLvoid *pixels );
void glTexSubImage3D( GLenum target, GLint level,
                                         GLint xoffset, GLint yoffset,
                                         GLint zoffset, GLsizei width,
                                         GLsizei height, GLsizei depth,
                                         GLenum format,
                                         GLenum type, const GLvoid *pixels);
void glCopyTexSubImage3D( GLenum target, GLint level,
                                             GLint xoffset, GLint yoffset,
                                             GLint zoffset, GLint x,
                                             GLint y, GLsizei width,
                                             GLsizei height );
typedef void (* PFNGLDRAWRANGEELEMENTSPROC) (GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const GLvoid *indices);
typedef void (* PFNGLTEXIMAGE3DPROC) (GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const GLvoid *pixels);
typedef void (* PFNGLTEXSUBIMAGE3DPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const GLvoid *pixels);
typedef void (* PFNGLCOPYTEXSUBIMAGE3DPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);

enum {
    GL_CONSTANT_COLOR			            = 0x8001,
    GL_ONE_MINUS_CONSTANT_COLOR		        = 0x8002,
    GL_CONSTANT_ALPHA			            = 0x8003,
    GL_ONE_MINUS_CONSTANT_ALPHA		        = 0x8004,
    GL_COLOR_TABLE				            = 0x80D0,
    GL_POST_CONVOLUTION_COLOR_TABLE		    = 0x80D1,
    GL_POST_COLOR_MATRIX_COLOR_TABLE	    = 0x80D2,
    GL_PROXY_COLOR_TABLE			        = 0x80D3,
    GL_PROXY_POST_CONVOLUTION_COLOR_TABLE	= 0x80D4,
    GL_PROXY_POST_COLOR_MATRIX_COLOR_TABLE	= 0x80D5,
    GL_COLOR_TABLE_SCALE			        = 0x80D6,
    GL_COLOR_TABLE_BIAS			            = 0x80D7,
    GL_COLOR_TABLE_FORMAT			        = 0x80D8,
    GL_COLOR_TABLE_WIDTH			        = 0x80D9,
    GL_COLOR_TABLE_RED_SIZE			        = 0x80DA,
    GL_COLOR_TABLE_GREEN_SIZE		        = 0x80DB,
    GL_COLOR_TABLE_BLUE_SIZE		        = 0x80DC,
    GL_COLOR_TABLE_ALPHA_SIZE		        = 0x80DD,
    GL_COLOR_TABLE_LUMINANCE_SIZE		    = 0x80DE,
    GL_COLOR_TABLE_INTENSITY_SIZE		    = 0x80DF,
    GL_CONVOLUTION_1D			            = 0x8010,
    GL_CONVOLUTION_2D			            = 0x8011,
    GL_SEPARABLE_2D				            = 0x8012,
    GL_CONVOLUTION_BORDER_MODE		        = 0x8013,
    GL_CONVOLUTION_FILTER_SCALE		        = 0x8014,
    GL_CONVOLUTION_FILTER_BIAS		        = 0x8015,
    GL_REDUCE				                = 0x8016,
    GL_CONVOLUTION_FORMAT			        = 0x8017,
    GL_CONVOLUTION_WIDTH			        = 0x8018,
    GL_CONVOLUTION_HEIGHT			        = 0x8019,
    GL_MAX_CONVOLUTION_WIDTH		        = 0x801A,
    GL_MAX_CONVOLUTION_HEIGHT		        = 0x801B,
    GL_POST_CONVOLUTION_RED_SCALE		    = 0x801C,
    GL_POST_CONVOLUTION_GREEN_SCALE		    = 0x801D,
    GL_POST_CONVOLUTION_BLUE_SCALE		    = 0x801E,
    GL_POST_CONVOLUTION_ALPHA_SCALE		    = 0x801F,
    GL_POST_CONVOLUTION_RED_BIAS		    = 0x8020,
    GL_POST_CONVOLUTION_GREEN_BIAS		    = 0x8021,
    GL_POST_CONVOLUTION_BLUE_BIAS		    = 0x8022,
    GL_POST_CONVOLUTION_ALPHA_BIAS		    = 0x8023,
    GL_CONSTANT_BORDER			            = 0x8151,
    GL_REPLICATE_BORDER			            = 0x8153,
    GL_CONVOLUTION_BORDER_COLOR		        = 0x8154,
    GL_COLOR_MATRIX				            = 0x80B1,
    GL_COLOR_MATRIX_STACK_DEPTH		        = 0x80B2,
    GL_MAX_COLOR_MATRIX_STACK_DEPTH		    = 0x80B3,
    GL_POST_COLOR_MATRIX_RED_SCALE		    = 0x80B4,
    GL_POST_COLOR_MATRIX_GREEN_SCALE	    = 0x80B5,
    GL_POST_COLOR_MATRIX_BLUE_SCALE		    = 0x80B6,
    GL_POST_COLOR_MATRIX_ALPHA_SCALE	    = 0x80B7,
    GL_POST_COLOR_MATRIX_RED_BIAS		    = 0x80B8,
    GL_POST_COLOR_MATRIX_GREEN_BIAS		    = 0x80B9,
    GL_POST_COLOR_MATRIX_BLUE_BIAS		    = 0x80BA,
    GL_POST_COLOR_MATRIX_ALPHA_BIAS		    = 0x80BB,
    GL_HISTOGRAM				            = 0x8024,
    GL_PROXY_HISTOGRAM			            = 0x8025,
    GL_HISTOGRAM_WIDTH			            = 0x8026,
    GL_HISTOGRAM_FORMAT			            = 0x8027,
    GL_HISTOGRAM_RED_SIZE			        = 0x8028,
    GL_HISTOGRAM_GREEN_SIZE			        = 0x8029,
    GL_HISTOGRAM_BLUE_SIZE			        = 0x802A,
    GL_HISTOGRAM_ALPHA_SIZE			        = 0x802B,
    GL_HISTOGRAM_LUMINANCE_SIZE		        = 0x802C,
    GL_HISTOGRAM_SINK			            = 0x802D,
    GL_MINMAX				                = 0x802E,
    GL_MINMAX_FORMAT			            = 0x802F,
    GL_MINMAX_SINK				            = 0x8030,
    GL_TABLE_TOO_LARGE			            = 0x8031,
    GL_BLEND_EQUATION			            = 0x8009,
    GL_MIN					                = 0x8007,
    GL_MAX					                = 0x8008,
    GL_FUNC_ADD				                = 0x8006,
    GL_FUNC_SUBTRACT			            = 0x800A,
    GL_FUNC_REVERSE_SUBTRACT		        = 0x800B,
    GL_BLEND_COLOR				            = 0x8005
};

void glColorTable( GLenum target, GLenum internalformat,
                                    GLsizei width, GLenum format,
                                    GLenum type, const GLvoid *table );
void glColorSubTable( GLenum target,
                                       GLsizei start, GLsizei count,
                                       GLenum format, GLenum type,
                                       const GLvoid *data );
void glColorTableParameteriv(GLenum target, GLenum pname,
                                              const GLint *params);
void glColorTableParameterfv(GLenum target, GLenum pname,
                                              const GLfloat *params);
void glCopyColorSubTable( GLenum target, GLsizei start,
                                           GLint x, GLint y, GLsizei width );
void glCopyColorTable( GLenum target, GLenum internalformat,
                                        GLint x, GLint y, GLsizei width );
void glGetColorTable( GLenum target, GLenum format,
                                       GLenum type, GLvoid *table );
void glGetColorTableParameterfv( GLenum target, GLenum pname,
                                                  GLfloat *params );
void glGetColorTableParameteriv( GLenum target, GLenum pname,
                                                  GLint *params );
void glBlendEquation( GLenum mode );
void glBlendColor( GLclampf red, GLclampf green,
                                    GLclampf blue, GLclampf alpha );
void glHistogram( GLenum target, GLsizei width,
				   GLenum internalformat, GLboolean sink );
void glResetHistogram( GLenum target );
void glGetHistogram( GLenum target, GLboolean reset,
				      GLenum format, GLenum type,
				      GLvoid *values );
void glGetHistogramParameterfv( GLenum target, GLenum pname,
						 GLfloat *params );
void glGetHistogramParameteriv( GLenum target, GLenum pname,
						 GLint *params );
void glMinmax( GLenum target, GLenum internalformat,
				GLboolean sink );
void glResetMinmax( GLenum target );
void glGetMinmax( GLenum target, GLboolean reset,
                                   GLenum format, GLenum types,
                                   GLvoid *values );
void glGetMinmaxParameterfv( GLenum target, GLenum pname,
					      GLfloat *params );
void glGetMinmaxParameteriv( GLenum target, GLenum pname,
					      GLint *params );
void glConvolutionFilter1D( GLenum target,
	GLenum internalformat, GLsizei width, GLenum format, GLenum type,
	const GLvoid *image );
void glConvolutionFilter2D( GLenum target,
	GLenum internalformat, GLsizei width, GLsizei height, GLenum format,
	GLenum type, const GLvoid *image );
void glConvolutionParameterf( GLenum target, GLenum pname,
	GLfloat params );
void glConvolutionParameterfv( GLenum target, GLenum pname,
	const GLfloat *params );
void glConvolutionParameteri( GLenum target, GLenum pname,
	GLint params );
void glConvolutionParameteriv( GLenum target, GLenum pname,
	const GLint *params );
void glCopyConvolutionFilter1D( GLenum target,
	GLenum internalformat, GLint x, GLint y, GLsizei width );
void glCopyConvolutionFilter2D( GLenum target,
	GLenum internalformat, GLint x, GLint y, GLsizei width,
	GLsizei height);
void glGetConvolutionFilter( GLenum target, GLenum format,
	GLenum type, GLvoid *image );
void glGetConvolutionParameterfv( GLenum target, GLenum pname,
	GLfloat *params );
void glGetConvolutionParameteriv( GLenum target, GLenum pname,
	GLint *params );
void glSeparableFilter2D( GLenum target,
	GLenum internalformat, GLsizei width, GLsizei height, GLenum format,
	GLenum type, const GLvoid *row, const GLvoid *column );
void glGetSeparableFilter( GLenum target, GLenum format,
	GLenum type, GLvoid *row, GLvoid *column, GLvoid *span );
typedef void (* PFNGLBLENDCOLORPROC) (GLclampf red, GLclampf green, GLclampf blue, GLclampf alpha);
typedef void (* PFNGLBLENDEQUATIONPROC) (GLenum mode);

enum {
    GL_TEXTURE0				    = 0x84C0,
    GL_TEXTURE1				    = 0x84C1,
    GL_TEXTURE2				    = 0x84C2,
    GL_TEXTURE3				    = 0x84C3,
    GL_TEXTURE4				    = 0x84C4,
    GL_TEXTURE5				    = 0x84C5,
    GL_TEXTURE6				    = 0x84C6,
    GL_TEXTURE7				    = 0x84C7,
    GL_TEXTURE8				    = 0x84C8,
    GL_TEXTURE9				    = 0x84C9,
    GL_TEXTURE10				= 0x84CA,
    GL_TEXTURE11				= 0x84CB,
    GL_TEXTURE12				= 0x84CC,
    GL_TEXTURE13				= 0x84CD,
    GL_TEXTURE14				= 0x84CE,
    GL_TEXTURE15				= 0x84CF,
    GL_TEXTURE16				= 0x84D0,
    GL_TEXTURE17				= 0x84D1,
    GL_TEXTURE18				= 0x84D2,
    GL_TEXTURE19				= 0x84D3,
    GL_TEXTURE20				= 0x84D4,
    GL_TEXTURE21				= 0x84D5,
    GL_TEXTURE22				= 0x84D6,
    GL_TEXTURE23				= 0x84D7,
    GL_TEXTURE24				= 0x84D8,
    GL_TEXTURE25				= 0x84D9,
    GL_TEXTURE26				= 0x84DA,
    GL_TEXTURE27				= 0x84DB,
    GL_TEXTURE28				= 0x84DC,
    GL_TEXTURE29				= 0x84DD,
    GL_TEXTURE30				= 0x84DE,
    GL_TEXTURE31				= 0x84DF,
    GL_ACTIVE_TEXTURE			= 0x84E0,
    GL_CLIENT_ACTIVE_TEXTURE	= 0x84E1,
    GL_MAX_TEXTURE_UNITS		= 0x84E2
};

enum {
    GL_NORMAL_MAP				        = 0x8511,
    GL_REFLECTION_MAP			        = 0x8512,
    GL_TEXTURE_CUBE_MAP			        = 0x8513,
    GL_TEXTURE_BINDING_CUBE_MAP		    = 0x8514,
    GL_TEXTURE_CUBE_MAP_POSITIVE_X		= 0x8515,
    GL_TEXTURE_CUBE_MAP_NEGATIVE_X		= 0x8516,
    GL_TEXTURE_CUBE_MAP_POSITIVE_Y		= 0x8517,
    GL_TEXTURE_CUBE_MAP_NEGATIVE_Y		= 0x8518,
    GL_TEXTURE_CUBE_MAP_POSITIVE_Z		= 0x8519,
    GL_TEXTURE_CUBE_MAP_NEGATIVE_Z		= 0x851A,
    GL_PROXY_TEXTURE_CUBE_MAP		    = 0x851B,
    GL_MAX_CUBE_MAP_TEXTURE_SIZE		= 0x851C
};

enum {
    GL_COMPRESSED_ALPHA			        = 0x84E9,
    GL_COMPRESSED_LUMINANCE			    = 0x84EA,
    GL_COMPRESSED_LUMINANCE_ALPHA		= 0x84EB,
    GL_COMPRESSED_INTENSITY			    = 0x84EC,
    GL_COMPRESSED_RGB			        = 0x84ED,
    GL_COMPRESSED_RGBA			        = 0x84EE,
    GL_TEXTURE_COMPRESSION_HINT		    = 0x84EF,
    GL_TEXTURE_COMPRESSED_IMAGE_SIZE	= 0x86A0,
    GL_TEXTURE_COMPRESSED			    = 0x86A1,
    GL_NUM_COMPRESSED_TEXTURE_FORMATS	= 0x86A2,
    GL_COMPRESSED_TEXTURE_FORMATS		= 0x86A3
};

enum {
    GL_MULTISAMPLE				= 0x809D,
    GL_SAMPLE_ALPHA_TO_COVERAGE	= 0x809E,
    GL_SAMPLE_ALPHA_TO_ONE		= 0x809F,
    GL_SAMPLE_COVERAGE			= 0x80A0,
    GL_SAMPLE_BUFFERS			= 0x80A8,
    GL_SAMPLES				    = 0x80A9,
    GL_SAMPLE_COVERAGE_VALUE	= 0x80AA,
    GL_SAMPLE_COVERAGE_INVERT	= 0x80AB,
    GL_MULTISAMPLE_BIT			= 0x20000000
};

enum {
    GL_TRANSPOSE_MODELVIEW_MATRIX	= 0x84E3,
    GL_TRANSPOSE_PROJECTION_MATRIX	= 0x84E4,
    GL_TRANSPOSE_TEXTURE_MATRIX		= 0x84E5,
    GL_TRANSPOSE_COLOR_MATRIX		= 0x84E6
};

enum {
    GL_COMBINE				= 0x8570,
    GL_COMBINE_RGB			= 0x8571,
    GL_COMBINE_ALPHA		= 0x8572,
    GL_SOURCE0_RGB			= 0x8580,
    GL_SOURCE1_RGB			= 0x8581,
    GL_SOURCE2_RGB			= 0x8582,
    GL_SOURCE0_ALPHA		= 0x8588,
    GL_SOURCE1_ALPHA		= 0x8589,
    GL_SOURCE2_ALPHA		= 0x858A,
    GL_OPERAND0_RGB			= 0x8590,
    GL_OPERAND1_RGB			= 0x8591,
    GL_OPERAND2_RGB			= 0x8592,
    GL_OPERAND0_ALPHA		= 0x8598,
    GL_OPERAND1_ALPHA		= 0x8599,
    GL_OPERAND2_ALPHA		= 0x859A,
    GL_RGB_SCALE			= 0x8573,
    GL_ADD_SIGNED			= 0x8574,
    GL_INTERPOLATE			= 0x8575,
    GL_SUBTRACT				= 0x84E7,
    GL_CONSTANT				= 0x8576,
    GL_PRIMARY_COLOR		= 0x8577,
    GL_PREVIOUS				= 0x8578
};

enum {
    GL_DOT3_RGB				= 0x86AE,
    GL_DOT3_RGBA			= 0x86AF
};

enum { GL_CLAMP_TO_BORDER = 0x812D };
void glActiveTexture( GLenum texture );
void glClientActiveTexture( GLenum texture );
void glCompressedTexImage1D( GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const GLvoid *data );
void glCompressedTexImage2D( GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const GLvoid *data );
void glCompressedTexImage3D( GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const GLvoid *data );
void glCompressedTexSubImage1D( GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const GLvoid *data );
void glCompressedTexSubImage2D( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const GLvoid *data );
void glCompressedTexSubImage3D( GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const GLvoid *data );
void glGetCompressedTexImage( GLenum target, GLint lod, GLvoid *img );
void glMultiTexCoord1d( GLenum target, GLdouble s );
void glMultiTexCoord1dv( GLenum target, const GLdouble *v );
void glMultiTexCoord1f( GLenum target, GLfloat s );
void glMultiTexCoord1fv( GLenum target, const GLfloat *v );
void glMultiTexCoord1i( GLenum target, GLint s );
void glMultiTexCoord1iv( GLenum target, const GLint *v );
void glMultiTexCoord1s( GLenum target, GLshort s );
void glMultiTexCoord1sv( GLenum target, const GLshort *v );
void glMultiTexCoord2d( GLenum target, GLdouble s, GLdouble t );
void glMultiTexCoord2dv( GLenum target, const GLdouble *v );
void glMultiTexCoord2f( GLenum target, GLfloat s, GLfloat t );
void glMultiTexCoord2fv( GLenum target, const GLfloat *v );
void glMultiTexCoord2i( GLenum target, GLint s, GLint t );
void glMultiTexCoord2iv( GLenum target, const GLint *v );
void glMultiTexCoord2s( GLenum target, GLshort s, GLshort t );
void glMultiTexCoord2sv( GLenum target, const GLshort *v );
void glMultiTexCoord3d( GLenum target, GLdouble s, GLdouble t, GLdouble r );
void glMultiTexCoord3dv( GLenum target, const GLdouble *v );
void glMultiTexCoord3f( GLenum target, GLfloat s, GLfloat t, GLfloat r );
void glMultiTexCoord3fv( GLenum target, const GLfloat *v );
void glMultiTexCoord3i( GLenum target, GLint s, GLint t, GLint r );
void glMultiTexCoord3iv( GLenum target, const GLint *v );
void glMultiTexCoord3s( GLenum target, GLshort s, GLshort t, GLshort r );
void glMultiTexCoord3sv( GLenum target, const GLshort *v );
void glMultiTexCoord4d( GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q );
void glMultiTexCoord4dv( GLenum target, const GLdouble *v );
void glMultiTexCoord4f( GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q );
void glMultiTexCoord4fv( GLenum target, const GLfloat *v );
void glMultiTexCoord4i( GLenum target, GLint s, GLint t, GLint r, GLint q );
void glMultiTexCoord4iv( GLenum target, const GLint *v );
void glMultiTexCoord4s( GLenum target, GLshort s, GLshort t, GLshort r, GLshort q );
void glMultiTexCoord4sv( GLenum target, const GLshort *v );
void glLoadTransposeMatrixd( const GLdouble m[16] );
void glLoadTransposeMatrixf( const GLfloat m[16] );
void glMultTransposeMatrixd( const GLdouble m[16] );
void glMultTransposeMatrixf( const GLfloat m[16] );
void glSampleCoverage( GLclampf value, GLboolean invert );
typedef void (* PFNGLACTIVETEXTUREPROC) (GLenum texture);
typedef void (* PFNGLSAMPLECOVERAGEPROC) (GLclampf value, GLboolean invert);
typedef void (* PFNGLCOMPRESSEDTEXIMAGE3DPROC) (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const GLvoid *data);
typedef void (* PFNGLCOMPRESSEDTEXIMAGE2DPROC) (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const GLvoid *data);
typedef void (* PFNGLCOMPRESSEDTEXIMAGE1DPROC) (GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const GLvoid *data);
typedef void (* PFNGLCOMPRESSEDTEXSUBIMAGE3DPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const GLvoid *data);
typedef void (* PFNGLCOMPRESSEDTEXSUBIMAGE2DPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const GLvoid *data);
typedef void (* PFNGLCOMPRESSEDTEXSUBIMAGE1DPROC) (GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const GLvoid *data);
typedef void (* PFNGLGETCOMPRESSEDTEXIMAGEPROC) (GLenum target, GLint level, GLvoid *img);

enum { GL_ARB_multitexture = 1 };

enum {
    GL_TEXTURE0_ARB				    = 0x84C0,
    GL_TEXTURE1_ARB				    = 0x84C1,
    GL_TEXTURE2_ARB				    = 0x84C2,
    GL_TEXTURE3_ARB				    = 0x84C3,
    GL_TEXTURE4_ARB				    = 0x84C4,
    GL_TEXTURE5_ARB				    = 0x84C5,
    GL_TEXTURE6_ARB				    = 0x84C6,
    GL_TEXTURE7_ARB				    = 0x84C7,
    GL_TEXTURE8_ARB				    = 0x84C8,
    GL_TEXTURE9_ARB				    = 0x84C9,
    GL_TEXTURE10_ARB			    = 0x84CA,
    GL_TEXTURE11_ARB			    = 0x84CB,
    GL_TEXTURE12_ARB			    = 0x84CC,
    GL_TEXTURE13_ARB			    = 0x84CD,
    GL_TEXTURE14_ARB			    = 0x84CE,
    GL_TEXTURE15_ARB			    = 0x84CF,
    GL_TEXTURE16_ARB			    = 0x84D0,
    GL_TEXTURE17_ARB			    = 0x84D1,
    GL_TEXTURE18_ARB			    = 0x84D2,
    GL_TEXTURE19_ARB			    = 0x84D3,
    GL_TEXTURE20_ARB			    = 0x84D4,
    GL_TEXTURE21_ARB			    = 0x84D5,
    GL_TEXTURE22_ARB			    = 0x84D6,
    GL_TEXTURE23_ARB			    = 0x84D7,
    GL_TEXTURE24_ARB			    = 0x84D8,
    GL_TEXTURE25_ARB			    = 0x84D9,
    GL_TEXTURE26_ARB			    = 0x84DA,
    GL_TEXTURE27_ARB			    = 0x84DB,
    GL_TEXTURE28_ARB			    = 0x84DC,
    GL_TEXTURE29_ARB			    = 0x84DD,
    GL_TEXTURE30_ARB			    = 0x84DE,
    GL_TEXTURE31_ARB			    = 0x84DF,
    GL_ACTIVE_TEXTURE_ARB			= 0x84E0,
    GL_CLIENT_ACTIVE_TEXTURE_ARB    = 0x84E1,
    GL_MAX_TEXTURE_UNITS_ARB		= 0x84E2
};

void glActiveTextureARB(GLenum texture);
void glClientActiveTextureARB(GLenum texture);
void glMultiTexCoord1dARB(GLenum target, GLdouble s);
void glMultiTexCoord1dvARB(GLenum target, const GLdouble *v);
void glMultiTexCoord1fARB(GLenum target, GLfloat s);
void glMultiTexCoord1fvARB(GLenum target, const GLfloat *v);
void glMultiTexCoord1iARB(GLenum target, GLint s);
void glMultiTexCoord1ivARB(GLenum target, const GLint *v);
void glMultiTexCoord1sARB(GLenum target, GLshort s);
void glMultiTexCoord1svARB(GLenum target, const GLshort *v);
void glMultiTexCoord2dARB(GLenum target, GLdouble s, GLdouble t);
void glMultiTexCoord2dvARB(GLenum target, const GLdouble *v);
void glMultiTexCoord2fARB(GLenum target, GLfloat s, GLfloat t);
void glMultiTexCoord2fvARB(GLenum target, const GLfloat *v);
void glMultiTexCoord2iARB(GLenum target, GLint s, GLint t);
void glMultiTexCoord2ivARB(GLenum target, const GLint *v);
void glMultiTexCoord2sARB(GLenum target, GLshort s, GLshort t);
void glMultiTexCoord2svARB(GLenum target, const GLshort *v);
void glMultiTexCoord3dARB(GLenum target, GLdouble s, GLdouble t, GLdouble r);
void glMultiTexCoord3dvARB(GLenum target, const GLdouble *v);
void glMultiTexCoord3fARB(GLenum target, GLfloat s, GLfloat t, GLfloat r);
void glMultiTexCoord3fvARB(GLenum target, const GLfloat *v);
void glMultiTexCoord3iARB(GLenum target, GLint s, GLint t, GLint r);
void glMultiTexCoord3ivARB(GLenum target, const GLint *v);
void glMultiTexCoord3sARB(GLenum target, GLshort s, GLshort t, GLshort r);
void glMultiTexCoord3svARB(GLenum target, const GLshort *v);
void glMultiTexCoord4dARB(GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q);
void glMultiTexCoord4dvARB(GLenum target, const GLdouble *v);
void glMultiTexCoord4fARB(GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q);
void glMultiTexCoord4fvARB(GLenum target, const GLfloat *v);
void glMultiTexCoord4iARB(GLenum target, GLint s, GLint t, GLint r, GLint q);
void glMultiTexCoord4ivARB(GLenum target, const GLint *v);
void glMultiTexCoord4sARB(GLenum target, GLshort s, GLshort t, GLshort r, GLshort q);
void glMultiTexCoord4svARB(GLenum target, const GLshort *v);
typedef void (* PFNGLACTIVETEXTUREARBPROC) (GLenum texture);
typedef void (* PFNGLCLIENTACTIVETEXTUREARBPROC) (GLenum texture);
typedef void (* PFNGLMULTITEXCOORD1DARBPROC) (GLenum target, GLdouble s);
typedef void (* PFNGLMULTITEXCOORD1DVARBPROC) (GLenum target, const GLdouble *v);
typedef void (* PFNGLMULTITEXCOORD1FARBPROC) (GLenum target, GLfloat s);
typedef void (* PFNGLMULTITEXCOORD1FVARBPROC) (GLenum target, const GLfloat *v);
typedef void (* PFNGLMULTITEXCOORD1IARBPROC) (GLenum target, GLint s);
typedef void (* PFNGLMULTITEXCOORD1IVARBPROC) (GLenum target, const GLint *v);
typedef void (* PFNGLMULTITEXCOORD1SARBPROC) (GLenum target, GLshort s);
typedef void (* PFNGLMULTITEXCOORD1SVARBPROC) (GLenum target, const GLshort *v);
typedef void (* PFNGLMULTITEXCOORD2DARBPROC) (GLenum target, GLdouble s, GLdouble t);
typedef void (* PFNGLMULTITEXCOORD2DVARBPROC) (GLenum target, const GLdouble *v);
typedef void (* PFNGLMULTITEXCOORD2FARBPROC) (GLenum target, GLfloat s, GLfloat t);
typedef void (* PFNGLMULTITEXCOORD2FVARBPROC) (GLenum target, const GLfloat *v);
typedef void (* PFNGLMULTITEXCOORD2IARBPROC) (GLenum target, GLint s, GLint t);
typedef void (* PFNGLMULTITEXCOORD2IVARBPROC) (GLenum target, const GLint *v);
typedef void (* PFNGLMULTITEXCOORD2SARBPROC) (GLenum target, GLshort s, GLshort t);
typedef void (* PFNGLMULTITEXCOORD2SVARBPROC) (GLenum target, const GLshort *v);
typedef void (* PFNGLMULTITEXCOORD3DARBPROC) (GLenum target, GLdouble s, GLdouble t, GLdouble r);
typedef void (* PFNGLMULTITEXCOORD3DVARBPROC) (GLenum target, const GLdouble *v);
typedef void (* PFNGLMULTITEXCOORD3FARBPROC) (GLenum target, GLfloat s, GLfloat t, GLfloat r);
typedef void (* PFNGLMULTITEXCOORD3FVARBPROC) (GLenum target, const GLfloat *v);
typedef void (* PFNGLMULTITEXCOORD3IARBPROC) (GLenum target, GLint s, GLint t, GLint r);
typedef void (* PFNGLMULTITEXCOORD3IVARBPROC) (GLenum target, const GLint *v);
typedef void (* PFNGLMULTITEXCOORD3SARBPROC) (GLenum target, GLshort s, GLshort t, GLshort r);
typedef void (* PFNGLMULTITEXCOORD3SVARBPROC) (GLenum target, const GLshort *v);
typedef void (* PFNGLMULTITEXCOORD4DARBPROC) (GLenum target, GLdouble s, GLdouble t, GLdouble r, GLdouble q);
typedef void (* PFNGLMULTITEXCOORD4DVARBPROC) (GLenum target, const GLdouble *v);
typedef void (* PFNGLMULTITEXCOORD4FARBPROC) (GLenum target, GLfloat s, GLfloat t, GLfloat r, GLfloat q);
typedef void (* PFNGLMULTITEXCOORD4FVARBPROC) (GLenum target, const GLfloat *v);
typedef void (* PFNGLMULTITEXCOORD4IARBPROC) (GLenum target, GLint s, GLint t, GLint r, GLint q);
typedef void (* PFNGLMULTITEXCOORD4IVARBPROC) (GLenum target, const GLint *v);
typedef void (* PFNGLMULTITEXCOORD4SARBPROC) (GLenum target, GLshort s, GLshort t, GLshort r, GLshort q);
typedef void (* PFNGLMULTITEXCOORD4SVARBPROC) (GLenum target, const GLshort *v);
enum { GL_EXT_texture_array = 1 };
void glFramebufferTextureLayerEXT(GLenum target,
    GLenum attachment, GLuint texture, GLint level, GLint layer);

typedef void (* PFNGLFRAMEBUFFERTEXTURELAYEREXTPROC) (GLenum target,
    GLenum attachment, GLuint texture, GLint level, GLint layer);

enum {
    GL_TEXTURE_1D_ARRAY_EXT                     = 0x8C18,
    GL_PROXY_TEXTURE_1D_ARRAY_EXT               = 0x8C19,
    GL_TEXTURE_2D_ARRAY_EXT                     = 0x8C1A,
    GL_PROXY_TEXTURE_2D_ARRAY_EXT               = 0x8C1B,
    GL_TEXTURE_BINDING_1D_ARRAY_EXT             = 0x8C1C,
    GL_TEXTURE_BINDING_2D_ARRAY_EXT             = 0x8C1D,
    GL_MAX_ARRAY_TEXTURE_LAYERS_EXT             = 0x88FF,
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER_EXT = 0x8CD4
};

enum {
    GL_ATI_blend_equation_separate = 1,
    GL_ALPHA_BLEND_EQUATION_ATI    = 0x883D
};

void glBlendEquationSeparateATI( GLenum modeRGB, GLenum modeA );
typedef void (* PFNGLBLENDEQUATIONSEPARATEATIPROC) (GLenum modeRGB, GLenum modeA);

typedef void* GLeglImageOES;
enum { GL_OES_EGL_image = 1 };
void glEGLImageTargetTexture2DOES (GLenum target, GLeglImageOES image);
void glEGLImageTargetRenderbufferStorageOES (GLenum target, GLeglImageOES image);
typedef void (* PFNGLEGLIMAGETARGETTEXTURE2DOESPROC) (GLenum target, GLeglImageOES image);
typedef void (* PFNGLEGLIMAGETARGETRENDERBUFFERSTORAGEOESPROC) (GLenum target, GLeglImageOES image);

// glcorearb.h
/*
** Copyright (c) 2013-2018 The Khronos Group Inc.
**
** Permission is hereby granted, free of charge, to any person obtaining a
** copy of this software and/or associated documentation files (the
** "Materials"), to deal in the Materials without restriction, including
** without limitation the rights to use, copy, modify, merge, publish,
** distribute, sublicense, and/or sell copies of the Materials, and to
** permit persons to whom the Materials are furnished to do so, subject to
** the following conditions:
**
** The above copyright notice and this permission notice shall be included
** in all copies or substantial portions of the Materials.
**
** THE MATERIALS ARE PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
** EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
** MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
** IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
** CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
** TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
** MATERIALS OR THE USE OR OTHER DEALINGS IN THE MATERIALS.
*/

/* glcorearb.h is for use with OpenGL core profile implementations.
** It should should be placed in the same directory as gl.h and
** included as <GL/glcorearb.h>.
**
** glcorearb.h includes only APIs in the latest OpenGL core profile
** implementation together with APIs in newer ARB extensions which 
** can be supported by the core profile. It does not, and never will
** include functionality removed from the core profile, such as
** fixed-function vertex and fragment processing.
**
** Do not #include both <GL/glcorearb.h> and either of <GL/gl.h> or
** <GL/glext.h> in the same source file.
*/

/* Generated C header for:
 * API: gl
 * Profile: core
 * Versions considered: .*
 * Versions emitted: .*
 * Default extensions included: glcore
 * Additional extensions included: _nomatch_^
 * Extensions removed: _nomatch_^
*/

enum { GL_VERSION_1_4 = 1 };
enum {
    GL_BLEND_DST_RGB                  = 0x80C8,
    GL_BLEND_SRC_RGB                  = 0x80C9,
    GL_BLEND_DST_ALPHA                = 0x80CA,
    GL_BLEND_SRC_ALPHA                = 0x80CB,
    GL_POINT_FADE_THRESHOLD_SIZE      = 0x8128,
    GL_DEPTH_COMPONENT16              = 0x81A5,
    GL_DEPTH_COMPONENT24              = 0x81A6,
    GL_DEPTH_COMPONENT32              = 0x81A7,
    GL_MIRRORED_REPEAT                = 0x8370,
    GL_MAX_TEXTURE_LOD_BIAS           = 0x84FD,
    GL_TEXTURE_LOD_BIAS               = 0x8501,
    GL_INCR_WRAP                      = 0x8507,
    GL_DECR_WRAP                      = 0x8508,
    GL_TEXTURE_DEPTH_SIZE             = 0x884A,
    GL_TEXTURE_COMPARE_MODE           = 0x884C,
    GL_TEXTURE_COMPARE_FUNC           = 0x884D,
};

typedef void (* PFNGLBLENDFUNCSEPARATEPROC) (GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha);
typedef void (* PFNGLMULTIDRAWARRAYSPROC) (GLenum mode, const GLint *first, const GLsizei *count, GLsizei drawcount);
typedef void (* PFNGLMULTIDRAWELEMENTSPROC) (GLenum mode, const GLsizei *count, GLenum type, const void *const*indices, GLsizei drawcount);
typedef void (* PFNGLPOINTPARAMETERFPROC) (GLenum pname, GLfloat param);
typedef void (* PFNGLPOINTPARAMETERFVPROC) (GLenum pname, const GLfloat *params);
typedef void (* PFNGLPOINTPARAMETERIPROC) (GLenum pname, GLint param);
typedef void (* PFNGLPOINTPARAMETERIVPROC) (GLenum pname, const GLint *params);
typedef void (* PFNGLBLENDCOLORPROC) (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
typedef void (* PFNGLBLENDEQUATIONPROC) (GLenum mode);
void glBlendFuncSeparate (GLenum sfactorRGB, GLenum dfactorRGB, GLenum sfactorAlpha, GLenum dfactorAlpha);
void glMultiDrawArrays (GLenum mode, const GLint *first, const GLsizei *count, GLsizei drawcount);
void glMultiDrawElements (GLenum mode, const GLsizei *count, GLenum type, const void *const*indices, GLsizei drawcount);
void glPointParameterf (GLenum pname, GLfloat param);
void glPointParameterfv (GLenum pname, const GLfloat *params);
void glPointParameteri (GLenum pname, GLint param);
void glPointParameteriv (GLenum pname, const GLint *params);
void glBlendColor (GLfloat red, GLfloat green, GLfloat blue, GLfloat alpha);
void glBlendEquation (GLenum mode);

enum { GL_VERSION_1_5 = 1 };
typedef signed long long int GLsizeiptr;
typedef signed long long int GLintptr;
enum {
    GL_BUFFER_SIZE                    = 0x8764,
    GL_BUFFER_USAGE                   = 0x8765,
    GL_QUERY_COUNTER_BITS             = 0x8864,
    GL_CURRENT_QUERY                  = 0x8865,
    GL_QUERY_RESULT                   = 0x8866,
    GL_QUERY_RESULT_AVAILABLE         = 0x8867,
    GL_ARRAY_BUFFER                   = 0x8892,
    GL_ELEMENT_ARRAY_BUFFER           = 0x8893,
    GL_ARRAY_BUFFER_BINDING           = 0x8894,
    GL_ELEMENT_ARRAY_BUFFER_BINDING   = 0x8895,
    GL_VERTEX_ATTRIB_ARRAY_BUFFER_BINDING = 0x889F,
    GL_READ_ONLY                      = 0x88B8,
    GL_WRITE_ONLY                     = 0x88B9,
    GL_READ_WRITE                     = 0x88BA,
    GL_BUFFER_ACCESS                  = 0x88BB,
    GL_BUFFER_MAPPED                  = 0x88BC,
    GL_BUFFER_MAP_POINTER             = 0x88BD,
    GL_STREAM_DRAW                    = 0x88E0,
    GL_STREAM_READ                    = 0x88E1,
    GL_STREAM_COPY                    = 0x88E2,
    GL_STATIC_DRAW                    = 0x88E4,
    GL_STATIC_READ                    = 0x88E5,
    GL_STATIC_COPY                    = 0x88E6,
    GL_DYNAMIC_DRAW                   = 0x88E8,
    GL_DYNAMIC_READ                   = 0x88E9,
    GL_DYNAMIC_COPY                   = 0x88EA,
    GL_SAMPLES_PASSED                 = 0x8914,
    GL_SRC1_ALPHA                     = 0x8589
};

typedef void (* PFNGLGENQUERIESPROC) (GLsizei n, GLuint *ids);
typedef void (* PFNGLDELETEQUERIESPROC) (GLsizei n, const GLuint *ids);
typedef GLboolean (* PFNGLISQUERYPROC) (GLuint id);
typedef void (* PFNGLBEGINQUERYPROC) (GLenum target, GLuint id);
typedef void (* PFNGLENDQUERYPROC) (GLenum target);
typedef void (* PFNGLGETQUERYIVPROC) (GLenum target, GLenum pname, GLint *params);
typedef void (* PFNGLGETQUERYOBJECTIVPROC) (GLuint id, GLenum pname, GLint *params);
typedef void (* PFNGLGETQUERYOBJECTUIVPROC) (GLuint id, GLenum pname, GLuint *params);
typedef void (* PFNGLBINDBUFFERPROC) (GLenum target, GLuint buffer);
typedef void (* PFNGLDELETEBUFFERSPROC) (GLsizei n, const GLuint *buffers);
typedef void (* PFNGLGENBUFFERSPROC) (GLsizei n, GLuint *buffers);
typedef GLboolean (* PFNGLISBUFFERPROC) (GLuint buffer);
typedef void (* PFNGLBUFFERDATAPROC) (GLenum target, GLsizeiptr size, const void *data, GLenum usage);
typedef void (* PFNGLBUFFERSUBDATAPROC) (GLenum target, GLintptr offset, GLsizeiptr size, const void *data);
typedef void (* PFNGLGETBUFFERSUBDATAPROC) (GLenum target, GLintptr offset, GLsizeiptr size, void *data);
typedef void *(* PFNGLMAPBUFFERPROC) (GLenum target, GLenum access);
typedef GLboolean (* PFNGLUNMAPBUFFERPROC) (GLenum target);
typedef void (* PFNGLGETBUFFERPARAMETERIVPROC) (GLenum target, GLenum pname, GLint *params);
typedef void (* PFNGLGETBUFFERPOINTERVPROC) (GLenum target, GLenum pname, void **params);
void glGenQueries (GLsizei n, GLuint *ids);
void glDeleteQueries (GLsizei n, const GLuint *ids);
GLboolean glIsQuery (GLuint id);
void glBeginQuery (GLenum target, GLuint id);
void glEndQuery (GLenum target);
void glGetQueryiv (GLenum target, GLenum pname, GLint *params);
void glGetQueryObjectiv (GLuint id, GLenum pname, GLint *params);
void glGetQueryObjectuiv (GLuint id, GLenum pname, GLuint *params);
void glBindBuffer (GLenum target, GLuint buffer);
void glDeleteBuffers (GLsizei n, const GLuint *buffers);
void glGenBuffers (GLsizei n, GLuint *buffers);
GLboolean glIsBuffer (GLuint buffer);
void glBufferData (GLenum target, GLsizeiptr size, const void *data, GLenum usage);
void glBufferSubData (GLenum target, GLintptr offset, GLsizeiptr size, const void *data);
void glGetBufferSubData (GLenum target, GLintptr offset, GLsizeiptr size, void *data);
void *glMapBuffer (GLenum target, GLenum access);
GLboolean glUnmapBuffer (GLenum target);
void glGetBufferParameteriv (GLenum target, GLenum pname, GLint *params);
void glGetBufferPointerv (GLenum target, GLenum pname, void **params);

enum { GL_VERSION_2_0 = 1 };
typedef char GLchar;
typedef signed short int GLshort;
typedef unsigned short int GLushort;
typedef signed char GLbyte;

enum {
    GL_BLEND_EQUATION_RGB             = 0x8009,
    GL_VERTEX_ATTRIB_ARRAY_ENABLED    = 0x8622,
    GL_VERTEX_ATTRIB_ARRAY_SIZE       = 0x8623,
    GL_VERTEX_ATTRIB_ARRAY_STRIDE     = 0x8624,
    GL_VERTEX_ATTRIB_ARRAY_TYPE       = 0x8625,
    GL_CURRENT_VERTEX_ATTRIB          = 0x8626,
    GL_VERTEX_PROGRAM_POINT_SIZE      = 0x8642,
    GL_VERTEX_ATTRIB_ARRAY_POINTER    = 0x8645,
    GL_STENCIL_BACK_FUNC              = 0x8800,
    GL_STENCIL_BACK_FAIL              = 0x8801,
    GL_STENCIL_BACK_PASS_DEPTH_FAIL   = 0x8802,
    GL_STENCIL_BACK_PASS_DEPTH_PASS   = 0x8803,
    GL_MAX_DRAW_BUFFERS               = 0x8824,
    GL_DRAW_BUFFER0                   = 0x8825,
    GL_DRAW_BUFFER1                   = 0x8826,
    GL_DRAW_BUFFER2                   = 0x8827,
    GL_DRAW_BUFFER3                   = 0x8828,
    GL_DRAW_BUFFER4                   = 0x8829,
    GL_DRAW_BUFFER5                   = 0x882A,
    GL_DRAW_BUFFER6                   = 0x882B,
    GL_DRAW_BUFFER7                   = 0x882C,
    GL_DRAW_BUFFER8                   = 0x882D,
    GL_DRAW_BUFFER9                   = 0x882E,
    GL_DRAW_BUFFER10                  = 0x882F,
    GL_DRAW_BUFFER11                  = 0x8830,
    GL_DRAW_BUFFER12                  = 0x8831,
    GL_DRAW_BUFFER13                  = 0x8832,
    GL_DRAW_BUFFER14                  = 0x8833,
    GL_DRAW_BUFFER15                  = 0x8834,
    GL_BLEND_EQUATION_ALPHA           = 0x883D,
    GL_MAX_VERTEX_ATTRIBS             = 0x8869,
    GL_VERTEX_ATTRIB_ARRAY_NORMALIZED = 0x886A,
    GL_MAX_TEXTURE_IMAGE_UNITS        = 0x8872,
    GL_FRAGMENT_SHADER                = 0x8B30,
    GL_VERTEX_SHADER                  = 0x8B31,
    GL_MAX_FRAGMENT_UNIFORM_COMPONENTS = 0x8B49,
    GL_MAX_VERTEX_UNIFORM_COMPONENTS  = 0x8B4A,
    GL_MAX_VARYING_FLOATS             = 0x8B4B,
    GL_MAX_VERTEX_TEXTURE_IMAGE_UNITS = 0x8B4C,
    GL_MAX_COMBINED_TEXTURE_IMAGE_UNITS = 0x8B4D,
    GL_SHADER_TYPE                    = 0x8B4F,
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
    GL_SAMPLER_1D                     = 0x8B5D,
    GL_SAMPLER_2D                     = 0x8B5E,
    GL_SAMPLER_3D                     = 0x8B5F,
    GL_SAMPLER_CUBE                   = 0x8B60,
    GL_SAMPLER_1D_SHADOW              = 0x8B61,
    GL_SAMPLER_2D_SHADOW              = 0x8B62,
    GL_DELETE_STATUS                  = 0x8B80,
    GL_COMPILE_STATUS                 = 0x8B81,
    GL_LINK_STATUS                    = 0x8B82,
    GL_VALIDATE_STATUS                = 0x8B83,
    GL_INFO_LOG_LENGTH                = 0x8B84,
    GL_ATTACHED_SHADERS               = 0x8B85,
    GL_ACTIVE_UNIFORMS                = 0x8B86,
    GL_ACTIVE_UNIFORM_MAX_LENGTH      = 0x8B87,
    GL_SHADER_SOURCE_LENGTH           = 0x8B88,
    GL_ACTIVE_ATTRIBUTES              = 0x8B89,
    GL_ACTIVE_ATTRIBUTE_MAX_LENGTH    = 0x8B8A,
    GL_FRAGMENT_SHADER_DERIVATIVE_HINT = 0x8B8B,
    GL_SHADING_LANGUAGE_VERSION       = 0x8B8C,
    GL_CURRENT_PROGRAM                = 0x8B8D,
    GL_POINT_SPRITE_COORD_ORIGIN      = 0x8CA0,
    GL_LOWER_LEFT                     = 0x8CA1,
    GL_UPPER_LEFT                     = 0x8CA2,
    GL_STENCIL_BACK_REF               = 0x8CA3,
    GL_STENCIL_BACK_VALUE_MASK        = 0x8CA4,
    GL_STENCIL_BACK_WRITEMASK         = 0x8CA5
};

typedef void (* PFNGLBLENDEQUATIONSEPARATEPROC) (GLenum modeRGB, GLenum modeAlpha);
typedef void (* PFNGLDRAWBUFFERSPROC) (GLsizei n, const GLenum *bufs);
typedef void (* PFNGLSTENCILOPSEPARATEPROC) (GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass);
typedef void (* PFNGLSTENCILFUNCSEPARATEPROC) (GLenum face, GLenum func, GLint ref, GLuint mask);
typedef void (* PFNGLSTENCILMASKSEPARATEPROC) (GLenum face, GLuint mask);
typedef void (* PFNGLATTACHSHADERPROC) (GLuint program, GLuint shader);
typedef void (* PFNGLBINDATTRIBLOCATIONPROC) (GLuint program, GLuint index, const GLchar *name);
typedef void (* PFNGLCOMPILESHADERPROC) (GLuint shader);
typedef GLuint (* PFNGLCREATEPROGRAMPROC) (void);
typedef GLuint (* PFNGLCREATESHADERPROC) (GLenum type);
typedef void (* PFNGLDELETEPROGRAMPROC) (GLuint program);
typedef void (* PFNGLDELETESHADERPROC) (GLuint shader);
typedef void (* PFNGLDETACHSHADERPROC) (GLuint program, GLuint shader);
typedef void (* PFNGLDISABLEVERTEXATTRIBARRAYPROC) (GLuint index);
typedef void (* PFNGLENABLEVERTEXATTRIBARRAYPROC) (GLuint index);
typedef void (* PFNGLGETACTIVEATTRIBPROC) (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name);
typedef void (* PFNGLGETACTIVEUNIFORMPROC) (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name);
typedef void (* PFNGLGETATTACHEDSHADERSPROC) (GLuint program, GLsizei maxCount, GLsizei *count, GLuint *shaders);
typedef GLint (* PFNGLGETATTRIBLOCATIONPROC) (GLuint program, const GLchar *name);
typedef void (* PFNGLGETPROGRAMIVPROC) (GLuint program, GLenum pname, GLint *params);
typedef void (* PFNGLGETPROGRAMINFOLOGPROC) (GLuint program, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
typedef void (* PFNGLGETSHADERIVPROC) (GLuint shader, GLenum pname, GLint *params);
typedef void (* PFNGLGETSHADERINFOLOGPROC) (GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
typedef void (* PFNGLGETSHADERSOURCEPROC) (GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *source);
typedef GLint (* PFNGLGETUNIFORMLOCATIONPROC) (GLuint program, const GLchar *name);
typedef void (* PFNGLGETUNIFORMFVPROC) (GLuint program, GLint location, GLfloat *params);
typedef void (* PFNGLGETUNIFORMIVPROC) (GLuint program, GLint location, GLint *params);
typedef void (* PFNGLGETVERTEXATTRIBDVPROC) (GLuint index, GLenum pname, GLdouble *params);
typedef void (* PFNGLGETVERTEXATTRIBFVPROC) (GLuint index, GLenum pname, GLfloat *params);
typedef void (* PFNGLGETVERTEXATTRIBIVPROC) (GLuint index, GLenum pname, GLint *params);
typedef void (* PFNGLGETVERTEXATTRIBPOINTERVPROC) (GLuint index, GLenum pname, void **pointer);
typedef GLboolean (* PFNGLISPROGRAMPROC) (GLuint program);
typedef GLboolean (* PFNGLISSHADERPROC) (GLuint shader);
typedef void (* PFNGLLINKPROGRAMPROC) (GLuint program);
typedef void (* PFNGLSHADERSOURCEPROC) (GLuint shader, GLsizei count, const GLchar *const*string, const GLint *length);
typedef void (* PFNGLUSEPROGRAMPROC) (GLuint program);
typedef void (* PFNGLUNIFORM1FPROC) (GLint location, GLfloat v0);
typedef void (* PFNGLUNIFORM2FPROC) (GLint location, GLfloat v0, GLfloat v1);
typedef void (* PFNGLUNIFORM3FPROC) (GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
typedef void (* PFNGLUNIFORM4FPROC) (GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
typedef void (* PFNGLUNIFORM1IPROC) (GLint location, GLint v0);
typedef void (* PFNGLUNIFORM2IPROC) (GLint location, GLint v0, GLint v1);
typedef void (* PFNGLUNIFORM3IPROC) (GLint location, GLint v0, GLint v1, GLint v2);
typedef void (* PFNGLUNIFORM4IPROC) (GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
typedef void (* PFNGLUNIFORM1FVPROC) (GLint location, GLsizei count, const GLfloat *value);
typedef void (* PFNGLUNIFORM2FVPROC) (GLint location, GLsizei count, const GLfloat *value);
typedef void (* PFNGLUNIFORM3FVPROC) (GLint location, GLsizei count, const GLfloat *value);
typedef void (* PFNGLUNIFORM4FVPROC) (GLint location, GLsizei count, const GLfloat *value);
typedef void (* PFNGLUNIFORM1IVPROC) (GLint location, GLsizei count, const GLint *value);
typedef void (* PFNGLUNIFORM2IVPROC) (GLint location, GLsizei count, const GLint *value);
typedef void (* PFNGLUNIFORM3IVPROC) (GLint location, GLsizei count, const GLint *value);
typedef void (* PFNGLUNIFORM4IVPROC) (GLint location, GLsizei count, const GLint *value);
typedef void (* PFNGLUNIFORMMATRIX2FVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLUNIFORMMATRIX3FVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLUNIFORMMATRIX4FVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLVALIDATEPROGRAMPROC) (GLuint program);
typedef void (* PFNGLVERTEXATTRIB1DPROC) (GLuint index, GLdouble x);
typedef void (* PFNGLVERTEXATTRIB1DVPROC) (GLuint index, const GLdouble *v);
typedef void (* PFNGLVERTEXATTRIB1FPROC) (GLuint index, GLfloat x);
typedef void (* PFNGLVERTEXATTRIB1FVPROC) (GLuint index, const GLfloat *v);
typedef void (* PFNGLVERTEXATTRIB1SPROC) (GLuint index, GLshort x);
typedef void (* PFNGLVERTEXATTRIB1SVPROC) (GLuint index, const GLshort *v);
typedef void (* PFNGLVERTEXATTRIB2DPROC) (GLuint index, GLdouble x, GLdouble y);
typedef void (* PFNGLVERTEXATTRIB2DVPROC) (GLuint index, const GLdouble *v);
typedef void (* PFNGLVERTEXATTRIB2FPROC) (GLuint index, GLfloat x, GLfloat y);
typedef void (* PFNGLVERTEXATTRIB2FVPROC) (GLuint index, const GLfloat *v);
typedef void (* PFNGLVERTEXATTRIB2SPROC) (GLuint index, GLshort x, GLshort y);
typedef void (* PFNGLVERTEXATTRIB2SVPROC) (GLuint index, const GLshort *v);
typedef void (* PFNGLVERTEXATTRIB3DPROC) (GLuint index, GLdouble x, GLdouble y, GLdouble z);
typedef void (* PFNGLVERTEXATTRIB3DVPROC) (GLuint index, const GLdouble *v);
typedef void (* PFNGLVERTEXATTRIB3FPROC) (GLuint index, GLfloat x, GLfloat y, GLfloat z);
typedef void (* PFNGLVERTEXATTRIB3FVPROC) (GLuint index, const GLfloat *v);
typedef void (* PFNGLVERTEXATTRIB3SPROC) (GLuint index, GLshort x, GLshort y, GLshort z);
typedef void (* PFNGLVERTEXATTRIB3SVPROC) (GLuint index, const GLshort *v);
typedef void (* PFNGLVERTEXATTRIB4NBVPROC) (GLuint index, const GLbyte *v);
typedef void (* PFNGLVERTEXATTRIB4NIVPROC) (GLuint index, const GLint *v);
typedef void (* PFNGLVERTEXATTRIB4NSVPROC) (GLuint index, const GLshort *v);
typedef void (* PFNGLVERTEXATTRIB4NUBPROC) (GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w);
typedef void (* PFNGLVERTEXATTRIB4NUBVPROC) (GLuint index, const GLubyte *v);
typedef void (* PFNGLVERTEXATTRIB4NUIVPROC) (GLuint index, const GLuint *v);
typedef void (* PFNGLVERTEXATTRIB4NUSVPROC) (GLuint index, const GLushort *v);
typedef void (* PFNGLVERTEXATTRIB4BVPROC) (GLuint index, const GLbyte *v);
typedef void (* PFNGLVERTEXATTRIB4DPROC) (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
typedef void (* PFNGLVERTEXATTRIB4DVPROC) (GLuint index, const GLdouble *v);
typedef void (* PFNGLVERTEXATTRIB4FPROC) (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
typedef void (* PFNGLVERTEXATTRIB4FVPROC) (GLuint index, const GLfloat *v);
typedef void (* PFNGLVERTEXATTRIB4IVPROC) (GLuint index, const GLint *v);
typedef void (* PFNGLVERTEXATTRIB4SPROC) (GLuint index, GLshort x, GLshort y, GLshort z, GLshort w);
typedef void (* PFNGLVERTEXATTRIB4SVPROC) (GLuint index, const GLshort *v);
typedef void (* PFNGLVERTEXATTRIB4UBVPROC) (GLuint index, const GLubyte *v);
typedef void (* PFNGLVERTEXATTRIB4UIVPROC) (GLuint index, const GLuint *v);
typedef void (* PFNGLVERTEXATTRIB4USVPROC) (GLuint index, const GLushort *v);
typedef void (* PFNGLVERTEXATTRIBPOINTERPROC) (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const void *pointer);
void glBlendEquationSeparate (GLenum modeRGB, GLenum modeAlpha);
void glDrawBuffers (GLsizei n, const GLenum *bufs);
void glStencilOpSeparate (GLenum face, GLenum sfail, GLenum dpfail, GLenum dppass);
void glStencilFuncSeparate (GLenum face, GLenum func, GLint ref, GLuint mask);
void glStencilMaskSeparate (GLenum face, GLuint mask);
void glAttachShader (GLuint program, GLuint shader);
void glBindAttribLocation (GLuint program, GLuint index, const GLchar *name);
void glCompileShader (GLuint shader);
GLuint glCreateProgram (void);
GLuint glCreateShader (GLenum type);
void glDeleteProgram (GLuint program);
void glDeleteShader (GLuint shader);
void glDetachShader (GLuint program, GLuint shader);
void glDisableVertexAttribArray (GLuint index);
void glEnableVertexAttribArray (GLuint index);
void glGetActiveAttrib (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name);
void glGetActiveUniform (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLint *size, GLenum *type, GLchar *name);
void glGetAttachedShaders (GLuint program, GLsizei maxCount, GLsizei *count, GLuint *shaders);
GLint glGetAttribLocation (GLuint program, const GLchar *name);
void glGetProgramiv (GLuint program, GLenum pname, GLint *params);
void glGetProgramInfoLog (GLuint program, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
void glGetShaderiv (GLuint shader, GLenum pname, GLint *params);
void glGetShaderInfoLog (GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
void glGetShaderSource (GLuint shader, GLsizei bufSize, GLsizei *length, GLchar *source);
GLint glGetUniformLocation (GLuint program, const GLchar *name);
void glGetUniformfv (GLuint program, GLint location, GLfloat *params);
void glGetUniformiv (GLuint program, GLint location, GLint *params);
void glGetVertexAttribdv (GLuint index, GLenum pname, GLdouble *params);
void glGetVertexAttribfv (GLuint index, GLenum pname, GLfloat *params);
void glGetVertexAttribiv (GLuint index, GLenum pname, GLint *params);
void glGetVertexAttribPointerv (GLuint index, GLenum pname, void **pointer);
GLboolean glIsProgram (GLuint program);
GLboolean glIsShader (GLuint shader);
void glLinkProgram (GLuint program);
void glShaderSource (GLuint shader, GLsizei count, const GLchar *const*string, const GLint *length);
void glUseProgram (GLuint program);
void glUniform1f (GLint location, GLfloat v0);
void glUniform2f (GLint location, GLfloat v0, GLfloat v1);
void glUniform3f (GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
void glUniform4f (GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
void glUniform1i (GLint location, GLint v0);
void glUniform2i (GLint location, GLint v0, GLint v1);
void glUniform3i (GLint location, GLint v0, GLint v1, GLint v2);
void glUniform4i (GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
void glUniform1fv (GLint location, GLsizei count, const GLfloat *value);
void glUniform2fv (GLint location, GLsizei count, const GLfloat *value);
void glUniform3fv (GLint location, GLsizei count, const GLfloat *value);
void glUniform4fv (GLint location, GLsizei count, const GLfloat *value);
void glUniform1iv (GLint location, GLsizei count, const GLint *value);
void glUniform2iv (GLint location, GLsizei count, const GLint *value);
void glUniform3iv (GLint location, GLsizei count, const GLint *value);
void glUniform4iv (GLint location, GLsizei count, const GLint *value);
void glUniformMatrix2fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix3fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix4fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glValidateProgram (GLuint program);
void glVertexAttrib1d (GLuint index, GLdouble x);
void glVertexAttrib1dv (GLuint index, const GLdouble *v);
void glVertexAttrib1f (GLuint index, GLfloat x);
void glVertexAttrib1fv (GLuint index, const GLfloat *v);
void glVertexAttrib1s (GLuint index, GLshort x);
void glVertexAttrib1sv (GLuint index, const GLshort *v);
void glVertexAttrib2d (GLuint index, GLdouble x, GLdouble y);
void glVertexAttrib2dv (GLuint index, const GLdouble *v);
void glVertexAttrib2f (GLuint index, GLfloat x, GLfloat y);
void glVertexAttrib2fv (GLuint index, const GLfloat *v);
void glVertexAttrib2s (GLuint index, GLshort x, GLshort y);
void glVertexAttrib2sv (GLuint index, const GLshort *v);
void glVertexAttrib3d (GLuint index, GLdouble x, GLdouble y, GLdouble z);
void glVertexAttrib3dv (GLuint index, const GLdouble *v);
void glVertexAttrib3f (GLuint index, GLfloat x, GLfloat y, GLfloat z);
void glVertexAttrib3fv (GLuint index, const GLfloat *v);
void glVertexAttrib3s (GLuint index, GLshort x, GLshort y, GLshort z);
void glVertexAttrib3sv (GLuint index, const GLshort *v);
void glVertexAttrib4Nbv (GLuint index, const GLbyte *v);
void glVertexAttrib4Niv (GLuint index, const GLint *v);
void glVertexAttrib4Nsv (GLuint index, const GLshort *v);
void glVertexAttrib4Nub (GLuint index, GLubyte x, GLubyte y, GLubyte z, GLubyte w);
void glVertexAttrib4Nubv (GLuint index, const GLubyte *v);
void glVertexAttrib4Nuiv (GLuint index, const GLuint *v);
void glVertexAttrib4Nusv (GLuint index, const GLushort *v);
void glVertexAttrib4bv (GLuint index, const GLbyte *v);
void glVertexAttrib4d (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glVertexAttrib4dv (GLuint index, const GLdouble *v);
void glVertexAttrib4f (GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glVertexAttrib4fv (GLuint index, const GLfloat *v);
void glVertexAttrib4iv (GLuint index, const GLint *v);
void glVertexAttrib4s (GLuint index, GLshort x, GLshort y, GLshort z, GLshort w);
void glVertexAttrib4sv (GLuint index, const GLshort *v);
void glVertexAttrib4ubv (GLuint index, const GLubyte *v);
void glVertexAttrib4uiv (GLuint index, const GLuint *v);
void glVertexAttrib4usv (GLuint index, const GLushort *v);
void glVertexAttribPointer (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, const void *pointer);

enum { GL_VERSION_2_1 = 1 };
enum {
    GL_PIXEL_PACK_BUFFER              = 0x88EB,
    GL_PIXEL_UNPACK_BUFFER            = 0x88EC,
    GL_PIXEL_PACK_BUFFER_BINDING      = 0x88ED,
    GL_PIXEL_UNPACK_BUFFER_BINDING    = 0x88EF,
    GL_FLOAT_MAT2x3                   = 0x8B65,
    GL_FLOAT_MAT2x4                   = 0x8B66,
    GL_FLOAT_MAT3x2                   = 0x8B67,
    GL_FLOAT_MAT3x4                   = 0x8B68,
    GL_FLOAT_MAT4x2                   = 0x8B69,
    GL_FLOAT_MAT4x3                   = 0x8B6A,
    GL_SRGB                           = 0x8C40,
    GL_SRGB8                          = 0x8C41,
    GL_SRGB_ALPHA                     = 0x8C42,
    GL_SRGB8_ALPHA8                   = 0x8C43,
    GL_COMPRESSED_SRGB                = 0x8C48,
    GL_COMPRESSED_SRGB_ALPHA          = 0x8C49
};

typedef void (* PFNGLUNIFORMMATRIX2X3FVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLUNIFORMMATRIX3X2FVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLUNIFORMMATRIX2X4FVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLUNIFORMMATRIX4X2FVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLUNIFORMMATRIX3X4FVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLUNIFORMMATRIX4X3FVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix2x3fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix3x2fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix2x4fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix4x2fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix3x4fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glUniformMatrix4x3fv (GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);

enum { GL_VERSION_3_0 = 1 };
typedef unsigned short int GLhalf;
enum {
    GL_COMPARE_REF_TO_TEXTURE         = 0x884E,
    GL_CLIP_DISTANCE0                 = 0x3000,
    GL_CLIP_DISTANCE1                 = 0x3001,
    GL_CLIP_DISTANCE2                 = 0x3002,
    GL_CLIP_DISTANCE3                 = 0x3003,
    GL_CLIP_DISTANCE4                 = 0x3004,
    GL_CLIP_DISTANCE5                 = 0x3005,
    GL_CLIP_DISTANCE6                 = 0x3006,
    GL_CLIP_DISTANCE7                 = 0x3007,
    GL_MAX_CLIP_DISTANCES             = 0x0D32,
    GL_MAJOR_VERSION                  = 0x821B,
    GL_MINOR_VERSION                  = 0x821C,
    GL_NUM_EXTENSIONS                 = 0x821D,
    GL_CONTEXT_FLAGS                  = 0x821E,
    GL_COMPRESSED_RED                 = 0x8225,
    GL_COMPRESSED_RG                  = 0x8226,
    GL_CONTEXT_FLAG_FORWARD_COMPATIBLE_BIT = 0x00000001,
    GL_RGBA32F                        = 0x8814,
    GL_RGB32F                         = 0x8815,
    GL_RGBA16F                        = 0x881A,
    GL_RGB16F                         = 0x881B,
    GL_VERTEX_ATTRIB_ARRAY_INTEGER    = 0x88FD,
    GL_MAX_ARRAY_TEXTURE_LAYERS       = 0x88FF,
    GL_MIN_PROGRAM_TEXEL_OFFSET       = 0x8904,
    GL_MAX_PROGRAM_TEXEL_OFFSET       = 0x8905,
    GL_CLAMP_READ_COLOR               = 0x891C,
    GL_FIXED_ONLY                     = 0x891D,
    GL_MAX_VARYING_COMPONENTS         = 0x8B4B,
    GL_TEXTURE_1D_ARRAY               = 0x8C18,
    GL_PROXY_TEXTURE_1D_ARRAY         = 0x8C19,
    GL_TEXTURE_2D_ARRAY               = 0x8C1A,
    GL_PROXY_TEXTURE_2D_ARRAY         = 0x8C1B,
    GL_TEXTURE_BINDING_1D_ARRAY       = 0x8C1C,
    GL_TEXTURE_BINDING_2D_ARRAY       = 0x8C1D,
    GL_R11F_G11F_B10F                 = 0x8C3A,
    GL_UNSIGNED_INT_10F_11F_11F_REV   = 0x8C3B,
    GL_RGB9_E5                        = 0x8C3D,
    GL_UNSIGNED_INT_5_9_9_9_REV       = 0x8C3E,
    GL_TEXTURE_SHARED_SIZE            = 0x8C3F,
    GL_TRANSFORM_FEEDBACK_VARYING_MAX_LENGTH = 0x8C76,
    GL_TRANSFORM_FEEDBACK_BUFFER_MODE = 0x8C7F,
    GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_COMPONENTS = 0x8C80,
    GL_TRANSFORM_FEEDBACK_VARYINGS    = 0x8C83,
    GL_TRANSFORM_FEEDBACK_BUFFER_START = 0x8C84,
    GL_TRANSFORM_FEEDBACK_BUFFER_SIZE = 0x8C85,
    GL_PRIMITIVES_GENERATED           = 0x8C87,
    GL_TRANSFORM_FEEDBACK_PRIMITIVES_WRITTEN = 0x8C88,
    GL_RASTERIZER_DISCARD             = 0x8C89,
    GL_MAX_TRANSFORM_FEEDBACK_INTERLEAVED_COMPONENTS = 0x8C8A,
    GL_MAX_TRANSFORM_FEEDBACK_SEPARATE_ATTRIBS = 0x8C8B,
    GL_INTERLEAVED_ATTRIBS            = 0x8C8C,
    GL_SEPARATE_ATTRIBS               = 0x8C8D,
    GL_TRANSFORM_FEEDBACK_BUFFER      = 0x8C8E,
    GL_TRANSFORM_FEEDBACK_BUFFER_BINDING = 0x8C8F,
    GL_RGBA32UI                       = 0x8D70,
    GL_RGB32UI                        = 0x8D71,
    GL_RGBA16UI                       = 0x8D76,
    GL_RGB16UI                        = 0x8D77,
    GL_RGBA8UI                        = 0x8D7C,
    GL_RGB8UI                         = 0x8D7D,
    GL_RGBA32I                        = 0x8D82,
    GL_RGB32I                         = 0x8D83,
    GL_RGBA16I                        = 0x8D88,
    GL_RGB16I                         = 0x8D89,
    GL_RGBA8I                         = 0x8D8E,
    GL_RGB8I                          = 0x8D8F,
    GL_RED_INTEGER                    = 0x8D94,
    GL_GREEN_INTEGER                  = 0x8D95,
    GL_BLUE_INTEGER                   = 0x8D96,
    GL_RGB_INTEGER                    = 0x8D98,
    GL_RGBA_INTEGER                   = 0x8D99,
    GL_BGR_INTEGER                    = 0x8D9A,
    GL_BGRA_INTEGER                   = 0x8D9B,
    GL_SAMPLER_1D_ARRAY               = 0x8DC0,
    GL_SAMPLER_2D_ARRAY               = 0x8DC1,
    GL_SAMPLER_1D_ARRAY_SHADOW        = 0x8DC3,
    GL_SAMPLER_2D_ARRAY_SHADOW        = 0x8DC4,
    GL_SAMPLER_CUBE_SHADOW            = 0x8DC5,
    GL_UNSIGNED_INT_VEC2              = 0x8DC6,
    GL_UNSIGNED_INT_VEC3              = 0x8DC7,
    GL_UNSIGNED_INT_VEC4              = 0x8DC8,
    GL_INT_SAMPLER_1D                 = 0x8DC9,
    GL_INT_SAMPLER_2D                 = 0x8DCA,
    GL_INT_SAMPLER_3D                 = 0x8DCB,
    GL_INT_SAMPLER_CUBE               = 0x8DCC,
    GL_INT_SAMPLER_1D_ARRAY           = 0x8DCE,
    GL_INT_SAMPLER_2D_ARRAY           = 0x8DCF,
    GL_UNSIGNED_INT_SAMPLER_1D        = 0x8DD1,
    GL_UNSIGNED_INT_SAMPLER_2D        = 0x8DD2,
    GL_UNSIGNED_INT_SAMPLER_3D        = 0x8DD3,
    GL_UNSIGNED_INT_SAMPLER_CUBE      = 0x8DD4,
    GL_UNSIGNED_INT_SAMPLER_1D_ARRAY  = 0x8DD6,
    GL_UNSIGNED_INT_SAMPLER_2D_ARRAY  = 0x8DD7,
    GL_QUERY_WAIT                     = 0x8E13,
    GL_QUERY_NO_WAIT                  = 0x8E14,
    GL_QUERY_BY_REGION_WAIT           = 0x8E15,
    GL_QUERY_BY_REGION_NO_WAIT        = 0x8E16,
    GL_BUFFER_ACCESS_FLAGS            = 0x911F,
    GL_BUFFER_MAP_LENGTH              = 0x9120,
    GL_BUFFER_MAP_OFFSET              = 0x9121,
    GL_DEPTH_COMPONENT32F             = 0x8CAC,
    GL_DEPTH32F_STENCIL8              = 0x8CAD,
    GL_FLOAT_32_UNSIGNED_INT_24_8_REV = 0x8DAD,
    GL_INVALID_FRAMEBUFFER_OPERATION  = 0x0506,
    GL_FRAMEBUFFER_ATTACHMENT_COLOR_ENCODING = 0x8210,
    GL_FRAMEBUFFER_ATTACHMENT_COMPONENT_TYPE = 0x8211,
    GL_FRAMEBUFFER_ATTACHMENT_RED_SIZE = 0x8212,
    GL_FRAMEBUFFER_ATTACHMENT_GREEN_SIZE = 0x8213,
    GL_FRAMEBUFFER_ATTACHMENT_BLUE_SIZE = 0x8214,
    GL_FRAMEBUFFER_ATTACHMENT_ALPHA_SIZE = 0x8215,
    GL_FRAMEBUFFER_ATTACHMENT_DEPTH_SIZE = 0x8216,
    GL_FRAMEBUFFER_ATTACHMENT_STENCIL_SIZE = 0x8217,
    GL_FRAMEBUFFER_DEFAULT            = 0x8218,
    GL_FRAMEBUFFER_UNDEFINED          = 0x8219,
    GL_DEPTH_STENCIL_ATTACHMENT       = 0x821A,
    GL_MAX_RENDERBUFFER_SIZE          = 0x84E8,
    GL_DEPTH_STENCIL                  = 0x84F9,
    GL_UNSIGNED_INT_24_8              = 0x84FA,
    GL_DEPTH24_STENCIL8               = 0x88F0,
    GL_TEXTURE_STENCIL_SIZE           = 0x88F1,
    GL_TEXTURE_RED_TYPE               = 0x8C10,
    GL_TEXTURE_GREEN_TYPE             = 0x8C11,
    GL_TEXTURE_BLUE_TYPE              = 0x8C12,
    GL_TEXTURE_ALPHA_TYPE             = 0x8C13,
    GL_TEXTURE_DEPTH_TYPE             = 0x8C16,
    GL_UNSIGNED_NORMALIZED            = 0x8C17,
    GL_FRAMEBUFFER_BINDING            = 0x8CA6,
    GL_DRAW_FRAMEBUFFER_BINDING       = 0x8CA6,
    GL_RENDERBUFFER_BINDING           = 0x8CA7,
    GL_READ_FRAMEBUFFER               = 0x8CA8,
    GL_DRAW_FRAMEBUFFER               = 0x8CA9,
    GL_READ_FRAMEBUFFER_BINDING       = 0x8CAA,
    GL_RENDERBUFFER_SAMPLES           = 0x8CAB,
    GL_FRAMEBUFFER_ATTACHMENT_OBJECT_TYPE = 0x8CD0,
    GL_FRAMEBUFFER_ATTACHMENT_OBJECT_NAME = 0x8CD1,
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LEVEL = 0x8CD2,
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_CUBE_MAP_FACE = 0x8CD3,
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_LAYER = 0x8CD4,
    GL_FRAMEBUFFER_COMPLETE           = 0x8CD5,
    GL_FRAMEBUFFER_INCOMPLETE_ATTACHMENT = 0x8CD6,
    GL_FRAMEBUFFER_INCOMPLETE_MISSING_ATTACHMENT = 0x8CD7,
    GL_FRAMEBUFFER_INCOMPLETE_DRAW_BUFFER = 0x8CDB,
    GL_FRAMEBUFFER_INCOMPLETE_READ_BUFFER = 0x8CDC,
    GL_FRAMEBUFFER_UNSUPPORTED        = 0x8CDD,
    GL_MAX_COLOR_ATTACHMENTS          = 0x8CDF,
    GL_COLOR_ATTACHMENT0              = 0x8CE0,
    GL_COLOR_ATTACHMENT1              = 0x8CE1,
    GL_COLOR_ATTACHMENT2              = 0x8CE2,
    GL_COLOR_ATTACHMENT3              = 0x8CE3,
    GL_COLOR_ATTACHMENT4              = 0x8CE4,
    GL_COLOR_ATTACHMENT5              = 0x8CE5,
    GL_COLOR_ATTACHMENT6              = 0x8CE6,
    GL_COLOR_ATTACHMENT7              = 0x8CE7,
    GL_COLOR_ATTACHMENT8              = 0x8CE8,
    GL_COLOR_ATTACHMENT9              = 0x8CE9,
    GL_COLOR_ATTACHMENT10             = 0x8CEA,
    GL_COLOR_ATTACHMENT11             = 0x8CEB,
    GL_COLOR_ATTACHMENT12             = 0x8CEC,
    GL_COLOR_ATTACHMENT13             = 0x8CED,
    GL_COLOR_ATTACHMENT14             = 0x8CEE,
    GL_COLOR_ATTACHMENT15             = 0x8CEF,
    GL_COLOR_ATTACHMENT16             = 0x8CF0,
    GL_COLOR_ATTACHMENT17             = 0x8CF1,
    GL_COLOR_ATTACHMENT18             = 0x8CF2,
    GL_COLOR_ATTACHMENT19             = 0x8CF3,
    GL_COLOR_ATTACHMENT20             = 0x8CF4,
    GL_COLOR_ATTACHMENT21             = 0x8CF5,
    GL_COLOR_ATTACHMENT22             = 0x8CF6,
    GL_COLOR_ATTACHMENT23             = 0x8CF7,
    GL_COLOR_ATTACHMENT24             = 0x8CF8,
    GL_COLOR_ATTACHMENT25             = 0x8CF9,
    GL_COLOR_ATTACHMENT26             = 0x8CFA,
    GL_COLOR_ATTACHMENT27             = 0x8CFB,
    GL_COLOR_ATTACHMENT28             = 0x8CFC,
    GL_COLOR_ATTACHMENT29             = 0x8CFD,
    GL_COLOR_ATTACHMENT30             = 0x8CFE,
    GL_COLOR_ATTACHMENT31             = 0x8CFF,
    GL_DEPTH_ATTACHMENT               = 0x8D00,
    GL_STENCIL_ATTACHMENT             = 0x8D20,
    GL_FRAMEBUFFER                    = 0x8D40,
    GL_RENDERBUFFER                   = 0x8D41,
    GL_RENDERBUFFER_WIDTH             = 0x8D42,
    GL_RENDERBUFFER_HEIGHT            = 0x8D43,
    GL_RENDERBUFFER_INTERNAL_FORMAT   = 0x8D44,
    GL_STENCIL_INDEX1                 = 0x8D46,
    GL_STENCIL_INDEX4                 = 0x8D47,
    GL_STENCIL_INDEX8                 = 0x8D48,
    GL_STENCIL_INDEX16                = 0x8D49,
    GL_RENDERBUFFER_RED_SIZE          = 0x8D50,
    GL_RENDERBUFFER_GREEN_SIZE        = 0x8D51,
    GL_RENDERBUFFER_BLUE_SIZE         = 0x8D52,
    GL_RENDERBUFFER_ALPHA_SIZE        = 0x8D53,
    GL_RENDERBUFFER_DEPTH_SIZE        = 0x8D54,
    GL_RENDERBUFFER_STENCIL_SIZE      = 0x8D55,
    GL_FRAMEBUFFER_INCOMPLETE_MULTISAMPLE = 0x8D56,
    GL_MAX_SAMPLES                    = 0x8D57,
    GL_FRAMEBUFFER_SRGB               = 0x8DB9,
    GL_HALF_FLOAT                     = 0x140B,
    GL_MAP_READ_BIT                   = 0x0001,
    GL_MAP_WRITE_BIT                  = 0x0002,
    GL_MAP_INVALIDATE_RANGE_BIT       = 0x0004,
    GL_MAP_INVALIDATE_BUFFER_BIT      = 0x0008,
    GL_MAP_FLUSH_EXPLICIT_BIT         = 0x0010,
    GL_MAP_UNSYNCHRONIZED_BIT         = 0x0020,
    GL_COMPRESSED_RED_RGTC1           = 0x8DBB,
    GL_COMPRESSED_SIGNED_RED_RGTC1    = 0x8DBC,
    GL_COMPRESSED_RG_RGTC2            = 0x8DBD,
    GL_COMPRESSED_SIGNED_RG_RGTC2     = 0x8DBE,
    GL_RG                             = 0x8227,
    GL_RG_INTEGER                     = 0x8228,
    GL_R8                             = 0x8229,
    GL_R16                            = 0x822A,
    GL_RG8                            = 0x822B,
    GL_RG16                           = 0x822C,
    GL_R16F                           = 0x822D,
    GL_R32F                           = 0x822E,
    GL_RG16F                          = 0x822F,
    GL_RG32F                          = 0x8230,
    GL_R8I                            = 0x8231,
    GL_R8UI                           = 0x8232,
    GL_R16I                           = 0x8233,
    GL_R16UI                          = 0x8234,
    GL_R32I                           = 0x8235,
    GL_R32UI                          = 0x8236,
    GL_RG8I                           = 0x8237,
    GL_RG8UI                          = 0x8238,
    GL_RG16I                          = 0x8239,
    GL_RG16UI                         = 0x823A,
    GL_RG32I                          = 0x823B,
    GL_RG32UI                         = 0x823C,
    GL_VERTEX_ARRAY_BINDING           = 0x85B5
};

typedef void (* PFNGLCOLORMASKIPROC) (GLuint index, GLboolean r, GLboolean g, GLboolean b, GLboolean a);
typedef void (* PFNGLGETBOOLEANI_VPROC) (GLenum target, GLuint index, GLboolean *data);
typedef void (* PFNGLGETINTEGERI_VPROC) (GLenum target, GLuint index, GLint *data);
typedef void (* PFNGLENABLEIPROC) (GLenum target, GLuint index);
typedef void (* PFNGLDISABLEIPROC) (GLenum target, GLuint index);
typedef GLboolean (* PFNGLISENABLEDIPROC) (GLenum target, GLuint index);
typedef void (* PFNGLBEGINTRANSFORMFEEDBACKPROC) (GLenum primitiveMode);
typedef void (* PFNGLENDTRANSFORMFEEDBACKPROC) (void);
typedef void (* PFNGLBINDBUFFERRANGEPROC) (GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size);
typedef void (* PFNGLBINDBUFFERBASEPROC) (GLenum target, GLuint index, GLuint buffer);
typedef void (* PFNGLTRANSFORMFEEDBACKVARYINGSPROC) (GLuint program, GLsizei count, const GLchar *const*varyings, GLenum bufferMode);
typedef void (* PFNGLGETTRANSFORMFEEDBACKVARYINGPROC) (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLsizei *size, GLenum *type, GLchar *name);
typedef void (* PFNGLCLAMPCOLORPROC) (GLenum target, GLenum clamp);
typedef void (* PFNGLBEGINCONDITIONALRENDERPROC) (GLuint id, GLenum mode);
typedef void (* PFNGLENDCONDITIONALRENDERPROC) (void);
typedef void (* PFNGLVERTEXATTRIBIPOINTERPROC) (GLuint index, GLint size, GLenum type, GLsizei stride, const void *pointer);
typedef void (* PFNGLGETVERTEXATTRIBIIVPROC) (GLuint index, GLenum pname, GLint *params);
typedef void (* PFNGLGETVERTEXATTRIBIUIVPROC) (GLuint index, GLenum pname, GLuint *params);
typedef void (* PFNGLVERTEXATTRIBI1IPROC) (GLuint index, GLint x);
typedef void (* PFNGLVERTEXATTRIBI2IPROC) (GLuint index, GLint x, GLint y);
typedef void (* PFNGLVERTEXATTRIBI3IPROC) (GLuint index, GLint x, GLint y, GLint z);
typedef void (* PFNGLVERTEXATTRIBI4IPROC) (GLuint index, GLint x, GLint y, GLint z, GLint w);
typedef void (* PFNGLVERTEXATTRIBI1UIPROC) (GLuint index, GLuint x);
typedef void (* PFNGLVERTEXATTRIBI2UIPROC) (GLuint index, GLuint x, GLuint y);
typedef void (* PFNGLVERTEXATTRIBI3UIPROC) (GLuint index, GLuint x, GLuint y, GLuint z);
typedef void (* PFNGLVERTEXATTRIBI4UIPROC) (GLuint index, GLuint x, GLuint y, GLuint z, GLuint w);
typedef void (* PFNGLVERTEXATTRIBI1IVPROC) (GLuint index, const GLint *v);
typedef void (* PFNGLVERTEXATTRIBI2IVPROC) (GLuint index, const GLint *v);
typedef void (* PFNGLVERTEXATTRIBI3IVPROC) (GLuint index, const GLint *v);
typedef void (* PFNGLVERTEXATTRIBI4IVPROC) (GLuint index, const GLint *v);
typedef void (* PFNGLVERTEXATTRIBI1UIVPROC) (GLuint index, const GLuint *v);
typedef void (* PFNGLVERTEXATTRIBI2UIVPROC) (GLuint index, const GLuint *v);
typedef void (* PFNGLVERTEXATTRIBI3UIVPROC) (GLuint index, const GLuint *v);
typedef void (* PFNGLVERTEXATTRIBI4UIVPROC) (GLuint index, const GLuint *v);
typedef void (* PFNGLVERTEXATTRIBI4BVPROC) (GLuint index, const GLbyte *v);
typedef void (* PFNGLVERTEXATTRIBI4SVPROC) (GLuint index, const GLshort *v);
typedef void (* PFNGLVERTEXATTRIBI4UBVPROC) (GLuint index, const GLubyte *v);
typedef void (* PFNGLVERTEXATTRIBI4USVPROC) (GLuint index, const GLushort *v);
typedef void (* PFNGLGETUNIFORMUIVPROC) (GLuint program, GLint location, GLuint *params);
typedef void (* PFNGLBINDFRAGDATALOCATIONPROC) (GLuint program, GLuint color, const GLchar *name);
typedef GLint (* PFNGLGETFRAGDATALOCATIONPROC) (GLuint program, const GLchar *name);
typedef void (* PFNGLUNIFORM1UIPROC) (GLint location, GLuint v0);
typedef void (* PFNGLUNIFORM2UIPROC) (GLint location, GLuint v0, GLuint v1);
typedef void (* PFNGLUNIFORM3UIPROC) (GLint location, GLuint v0, GLuint v1, GLuint v2);
typedef void (* PFNGLUNIFORM4UIPROC) (GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3);
typedef void (* PFNGLUNIFORM1UIVPROC) (GLint location, GLsizei count, const GLuint *value);
typedef void (* PFNGLUNIFORM2UIVPROC) (GLint location, GLsizei count, const GLuint *value);
typedef void (* PFNGLUNIFORM3UIVPROC) (GLint location, GLsizei count, const GLuint *value);
typedef void (* PFNGLUNIFORM4UIVPROC) (GLint location, GLsizei count, const GLuint *value);
typedef void (* PFNGLTEXPARAMETERIIVPROC) (GLenum target, GLenum pname, const GLint *params);
typedef void (* PFNGLTEXPARAMETERIUIVPROC) (GLenum target, GLenum pname, const GLuint *params);
typedef void (* PFNGLGETTEXPARAMETERIIVPROC) (GLenum target, GLenum pname, GLint *params);
typedef void (* PFNGLGETTEXPARAMETERIUIVPROC) (GLenum target, GLenum pname, GLuint *params);
typedef void (* PFNGLCLEARBUFFERIVPROC) (GLenum buffer, GLint drawbuffer, const GLint *value);
typedef void (* PFNGLCLEARBUFFERUIVPROC) (GLenum buffer, GLint drawbuffer, const GLuint *value);
typedef void (* PFNGLCLEARBUFFERFVPROC) (GLenum buffer, GLint drawbuffer, const GLfloat *value);
typedef void (* PFNGLCLEARBUFFERFIPROC) (GLenum buffer, GLint drawbuffer, GLfloat depth, GLint stencil);
typedef const GLubyte *(* PFNGLGETSTRINGIPROC) (GLenum name, GLuint index);
typedef GLboolean (* PFNGLISRENDERBUFFERPROC) (GLuint renderbuffer);
typedef void (* PFNGLBINDRENDERBUFFERPROC) (GLenum target, GLuint renderbuffer);
typedef void (* PFNGLDELETERENDERBUFFERSPROC) (GLsizei n, const GLuint *renderbuffers);
typedef void (* PFNGLGENRENDERBUFFERSPROC) (GLsizei n, GLuint *renderbuffers);
typedef void (* PFNGLRENDERBUFFERSTORAGEPROC) (GLenum target, GLenum internalformat, GLsizei width, GLsizei height);
typedef void (* PFNGLGETRENDERBUFFERPARAMETERIVPROC) (GLenum target, GLenum pname, GLint *params);
typedef GLboolean (* PFNGLISFRAMEBUFFERPROC) (GLuint framebuffer);
typedef void (* PFNGLBINDFRAMEBUFFERPROC) (GLenum target, GLuint framebuffer);
typedef void (* PFNGLDELETEFRAMEBUFFERSPROC) (GLsizei n, const GLuint *framebuffers);
typedef void (* PFNGLGENFRAMEBUFFERSPROC) (GLsizei n, GLuint *framebuffers);
typedef GLenum (* PFNGLCHECKFRAMEBUFFERSTATUSPROC) (GLenum target);
typedef void (* PFNGLFRAMEBUFFERTEXTURE1DPROC) (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
typedef void (* PFNGLFRAMEBUFFERTEXTURE2DPROC) (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
typedef void (* PFNGLFRAMEBUFFERTEXTURE3DPROC) (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset);
typedef void (* PFNGLFRAMEBUFFERRENDERBUFFERPROC) (GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer);
typedef void (* PFNGLGETFRAMEBUFFERATTACHMENTPARAMETERIVPROC) (GLenum target, GLenum attachment, GLenum pname, GLint *params);
typedef void (* PFNGLGENERATEMIPMAPPROC) (GLenum target);
typedef void (* PFNGLBLITFRAMEBUFFERPROC) (GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter);
typedef void (* PFNGLRENDERBUFFERSTORAGEMULTISAMPLEPROC) (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
typedef void (* PFNGLFRAMEBUFFERTEXTURELAYERPROC) (GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer);
typedef void *(* PFNGLMAPBUFFERRANGEPROC) (GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access);
typedef void (* PFNGLFLUSHMAPPEDBUFFERRANGEPROC) (GLenum target, GLintptr offset, GLsizeiptr length);
typedef void (* PFNGLBINDVERTEXARRAYPROC) (GLuint array);
typedef void (* PFNGLDELETEVERTEXARRAYSPROC) (GLsizei n, const GLuint *arrays);
typedef void (* PFNGLGENVERTEXARRAYSPROC) (GLsizei n, GLuint *arrays);
typedef GLboolean (* PFNGLISVERTEXARRAYPROC) (GLuint array);
void glColorMaski (GLuint index, GLboolean r, GLboolean g, GLboolean b, GLboolean a);
void glGetBooleani_v (GLenum target, GLuint index, GLboolean *data);
void glGetIntegeri_v (GLenum target, GLuint index, GLint *data);
void glEnablei (GLenum target, GLuint index);
void glDisablei (GLenum target, GLuint index);
GLboolean glIsEnabledi (GLenum target, GLuint index);
void glBeginTransformFeedback (GLenum primitiveMode);
void glEndTransformFeedback (void);
void glBindBufferRange (GLenum target, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size);
void glBindBufferBase (GLenum target, GLuint index, GLuint buffer);
void glTransformFeedbackVaryings (GLuint program, GLsizei count, const GLchar *const*varyings, GLenum bufferMode);
void glGetTransformFeedbackVarying (GLuint program, GLuint index, GLsizei bufSize, GLsizei *length, GLsizei *size, GLenum *type, GLchar *name);
void glClampColor (GLenum target, GLenum clamp);
void glBeginConditionalRender (GLuint id, GLenum mode);
void glEndConditionalRender (void);
void glVertexAttribIPointer (GLuint index, GLint size, GLenum type, GLsizei stride, const void *pointer);
void glGetVertexAttribIiv (GLuint index, GLenum pname, GLint *params);
void glGetVertexAttribIuiv (GLuint index, GLenum pname, GLuint *params);
void glVertexAttribI1i (GLuint index, GLint x);
void glVertexAttribI2i (GLuint index, GLint x, GLint y);
void glVertexAttribI3i (GLuint index, GLint x, GLint y, GLint z);
void glVertexAttribI4i (GLuint index, GLint x, GLint y, GLint z, GLint w);
void glVertexAttribI1ui (GLuint index, GLuint x);
void glVertexAttribI2ui (GLuint index, GLuint x, GLuint y);
void glVertexAttribI3ui (GLuint index, GLuint x, GLuint y, GLuint z);
void glVertexAttribI4ui (GLuint index, GLuint x, GLuint y, GLuint z, GLuint w);
void glVertexAttribI1iv (GLuint index, const GLint *v);
void glVertexAttribI2iv (GLuint index, const GLint *v);
void glVertexAttribI3iv (GLuint index, const GLint *v);
void glVertexAttribI4iv (GLuint index, const GLint *v);
void glVertexAttribI1uiv (GLuint index, const GLuint *v);
void glVertexAttribI2uiv (GLuint index, const GLuint *v);
void glVertexAttribI3uiv (GLuint index, const GLuint *v);
void glVertexAttribI4uiv (GLuint index, const GLuint *v);
void glVertexAttribI4bv (GLuint index, const GLbyte *v);
void glVertexAttribI4sv (GLuint index, const GLshort *v);
void glVertexAttribI4ubv (GLuint index, const GLubyte *v);
void glVertexAttribI4usv (GLuint index, const GLushort *v);
void glGetUniformuiv (GLuint program, GLint location, GLuint *params);
void glBindFragDataLocation (GLuint program, GLuint color, const GLchar *name);
GLint glGetFragDataLocation (GLuint program, const GLchar *name);
void glUniform1ui (GLint location, GLuint v0);
void glUniform2ui (GLint location, GLuint v0, GLuint v1);
void glUniform3ui (GLint location, GLuint v0, GLuint v1, GLuint v2);
void glUniform4ui (GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3);
void glUniform1uiv (GLint location, GLsizei count, const GLuint *value);
void glUniform2uiv (GLint location, GLsizei count, const GLuint *value);
void glUniform3uiv (GLint location, GLsizei count, const GLuint *value);
void glUniform4uiv (GLint location, GLsizei count, const GLuint *value);
void glTexParameterIiv (GLenum target, GLenum pname, const GLint *params);
void glTexParameterIuiv (GLenum target, GLenum pname, const GLuint *params);
void glGetTexParameterIiv (GLenum target, GLenum pname, GLint *params);
void glGetTexParameterIuiv (GLenum target, GLenum pname, GLuint *params);
void glClearBufferiv (GLenum buffer, GLint drawbuffer, const GLint *value);
void glClearBufferuiv (GLenum buffer, GLint drawbuffer, const GLuint *value);
void glClearBufferfv (GLenum buffer, GLint drawbuffer, const GLfloat *value);
void glClearBufferfi (GLenum buffer, GLint drawbuffer, GLfloat depth, GLint stencil);
const GLubyte *glGetStringi (GLenum name, GLuint index);
GLboolean glIsRenderbuffer (GLuint renderbuffer);
void glBindRenderbuffer (GLenum target, GLuint renderbuffer);
void glDeleteRenderbuffers (GLsizei n, const GLuint *renderbuffers);
void glGenRenderbuffers (GLsizei n, GLuint *renderbuffers);
void glRenderbufferStorage (GLenum target, GLenum internalformat, GLsizei width, GLsizei height);
void glGetRenderbufferParameteriv (GLenum target, GLenum pname, GLint *params);
GLboolean glIsFramebuffer (GLuint framebuffer);
void glBindFramebuffer (GLenum target, GLuint framebuffer);
void glDeleteFramebuffers (GLsizei n, const GLuint *framebuffers);
void glGenFramebuffers (GLsizei n, GLuint *framebuffers);
GLenum glCheckFramebufferStatus (GLenum target);
void glFramebufferTexture1D (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
void glFramebufferTexture2D (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
void glFramebufferTexture3D (GLenum target, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset);
void glFramebufferRenderbuffer (GLenum target, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer);
void glGetFramebufferAttachmentParameteriv (GLenum target, GLenum attachment, GLenum pname, GLint *params);
void glGenerateMipmap (GLenum target);
void glBlitFramebuffer (GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter);
void glRenderbufferStorageMultisample (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
void glFramebufferTextureLayer (GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer);
void *glMapBufferRange (GLenum target, GLintptr offset, GLsizeiptr length, GLbitfield access);
void glFlushMappedBufferRange (GLenum target, GLintptr offset, GLsizeiptr length);
void glBindVertexArray (GLuint array);
void glDeleteVertexArrays (GLsizei n, const GLuint *arrays);
void glGenVertexArrays (GLsizei n, GLuint *arrays);
GLboolean glIsVertexArray (GLuint array);

enum { GL_VERSION_3_1 = 1 };
enum {
    GL_SAMPLER_2D_RECT                = 0x8B63,
    GL_SAMPLER_2D_RECT_SHADOW         = 0x8B64,
    GL_SAMPLER_BUFFER                 = 0x8DC2,
    GL_INT_SAMPLER_2D_RECT            = 0x8DCD,
    GL_INT_SAMPLER_BUFFER             = 0x8DD0,
    GL_UNSIGNED_INT_SAMPLER_2D_RECT   = 0x8DD5,
    GL_UNSIGNED_INT_SAMPLER_BUFFER    = 0x8DD8,
    GL_TEXTURE_BUFFER                 = 0x8C2A,
    GL_MAX_TEXTURE_BUFFER_SIZE        = 0x8C2B,
    GL_TEXTURE_BINDING_BUFFER         = 0x8C2C,
    GL_TEXTURE_BUFFER_DATA_STORE_BINDING = 0x8C2D,
    GL_TEXTURE_RECTANGLE              = 0x84F5,
    GL_TEXTURE_BINDING_RECTANGLE      = 0x84F6,
    GL_PROXY_TEXTURE_RECTANGLE        = 0x84F7,
    GL_MAX_RECTANGLE_TEXTURE_SIZE     = 0x84F8,
    GL_R8_SNORM                       = 0x8F94,
    GL_RG8_SNORM                      = 0x8F95,
    GL_RGB8_SNORM                     = 0x8F96,
    GL_RGBA8_SNORM                    = 0x8F97,
    GL_R16_SNORM                      = 0x8F98,
    GL_RG16_SNORM                     = 0x8F99,
    GL_RGB16_SNORM                    = 0x8F9A,
    GL_RGBA16_SNORM                   = 0x8F9B,
    GL_SIGNED_NORMALIZED              = 0x8F9C,
    GL_PRIMITIVE_RESTART              = 0x8F9D,
    GL_PRIMITIVE_RESTART_INDEX        = 0x8F9E,
    GL_COPY_READ_BUFFER               = 0x8F36,
    GL_COPY_WRITE_BUFFER              = 0x8F37,
    GL_UNIFORM_BUFFER                 = 0x8A11,
    GL_UNIFORM_BUFFER_BINDING         = 0x8A28,
    GL_UNIFORM_BUFFER_START           = 0x8A29,
    GL_UNIFORM_BUFFER_SIZE            = 0x8A2A,
    GL_MAX_VERTEX_UNIFORM_BLOCKS      = 0x8A2B,
    GL_MAX_GEOMETRY_UNIFORM_BLOCKS    = 0x8A2C,
    GL_MAX_FRAGMENT_UNIFORM_BLOCKS    = 0x8A2D,
    GL_MAX_COMBINED_UNIFORM_BLOCKS    = 0x8A2E,
    GL_MAX_UNIFORM_BUFFER_BINDINGS    = 0x8A2F,
    GL_MAX_UNIFORM_BLOCK_SIZE         = 0x8A30,
    GL_MAX_COMBINED_VERTEX_UNIFORM_COMPONENTS = 0x8A31,
    GL_MAX_COMBINED_GEOMETRY_UNIFORM_COMPONENTS = 0x8A32,
    GL_MAX_COMBINED_FRAGMENT_UNIFORM_COMPONENTS = 0x8A33,
    GL_UNIFORM_BUFFER_OFFSET_ALIGNMENT = 0x8A34,
    GL_ACTIVE_UNIFORM_BLOCK_MAX_NAME_LENGTH = 0x8A35,
    GL_ACTIVE_UNIFORM_BLOCKS          = 0x8A36,
    GL_UNIFORM_TYPE                   = 0x8A37,
    GL_UNIFORM_SIZE                   = 0x8A38,
    GL_UNIFORM_NAME_LENGTH            = 0x8A39,
    GL_UNIFORM_BLOCK_INDEX            = 0x8A3A,
    GL_UNIFORM_OFFSET                 = 0x8A3B,
    GL_UNIFORM_ARRAY_STRIDE           = 0x8A3C,
    GL_UNIFORM_MATRIX_STRIDE          = 0x8A3D,
    GL_UNIFORM_IS_ROW_MAJOR           = 0x8A3E,
    GL_UNIFORM_BLOCK_BINDING          = 0x8A3F,
    GL_UNIFORM_BLOCK_DATA_SIZE        = 0x8A40,
    GL_UNIFORM_BLOCK_NAME_LENGTH      = 0x8A41,
    GL_UNIFORM_BLOCK_ACTIVE_UNIFORMS  = 0x8A42,
    GL_UNIFORM_BLOCK_ACTIVE_UNIFORM_INDICES = 0x8A43,
    GL_UNIFORM_BLOCK_REFERENCED_BY_VERTEX_SHADER = 0x8A44,
    GL_UNIFORM_BLOCK_REFERENCED_BY_GEOMETRY_SHADER = 0x8A45,
    GL_UNIFORM_BLOCK_REFERENCED_BY_FRAGMENT_SHADER = 0x8A46,
    GL_INVALID_INDEX                  = 0xFFFFFFFFu
};
typedef void (* PFNGLDRAWARRAYSINSTANCEDPROC) (GLenum mode, GLint first, GLsizei count, GLsizei instancecount);
typedef void (* PFNGLDRAWELEMENTSINSTANCEDPROC) (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei instancecount);
typedef void (* PFNGLTEXBUFFERPROC) (GLenum target, GLenum internalformat, GLuint buffer);
typedef void (* PFNGLPRIMITIVERESTARTINDEXPROC) (GLuint index);
typedef void (* PFNGLCOPYBUFFERSUBDATAPROC) (GLenum readTarget, GLenum writeTarget, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size);
typedef void (* PFNGLGETUNIFORMINDICESPROC) (GLuint program, GLsizei uniformCount, const GLchar *const*uniformNames, GLuint *uniformIndices);
typedef void (* PFNGLGETACTIVEUNIFORMSIVPROC) (GLuint program, GLsizei uniformCount, const GLuint *uniformIndices, GLenum pname, GLint *params);
typedef void (* PFNGLGETACTIVEUNIFORMNAMEPROC) (GLuint program, GLuint uniformIndex, GLsizei bufSize, GLsizei *length, GLchar *uniformName);
typedef GLuint (* PFNGLGETUNIFORMBLOCKINDEXPROC) (GLuint program, const GLchar *uniformBlockName);
typedef void (* PFNGLGETACTIVEUNIFORMBLOCKIVPROC) (GLuint program, GLuint uniformBlockIndex, GLenum pname, GLint *params);
typedef void (* PFNGLGETACTIVEUNIFORMBLOCKNAMEPROC) (GLuint program, GLuint uniformBlockIndex, GLsizei bufSize, GLsizei *length, GLchar *uniformBlockName);
typedef void (* PFNGLUNIFORMBLOCKBINDINGPROC) (GLuint program, GLuint uniformBlockIndex, GLuint uniformBlockBinding);
void glDrawArraysInstanced (GLenum mode, GLint first, GLsizei count, GLsizei instancecount);
void glDrawElementsInstanced (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei instancecount);
void glTexBuffer (GLenum target, GLenum internalformat, GLuint buffer);
void glPrimitiveRestartIndex (GLuint index);
void glCopyBufferSubData (GLenum readTarget, GLenum writeTarget, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size);
void glGetUniformIndices (GLuint program, GLsizei uniformCount, const GLchar *const*uniformNames, GLuint *uniformIndices);
void glGetActiveUniformsiv (GLuint program, GLsizei uniformCount, const GLuint *uniformIndices, GLenum pname, GLint *params);
void glGetActiveUniformName (GLuint program, GLuint uniformIndex, GLsizei bufSize, GLsizei *length, GLchar *uniformName);
GLuint glGetUniformBlockIndex (GLuint program, const GLchar *uniformBlockName);
void glGetActiveUniformBlockiv (GLuint program, GLuint uniformBlockIndex, GLenum pname, GLint *params);
void glGetActiveUniformBlockName (GLuint program, GLuint uniformBlockIndex, GLsizei bufSize, GLsizei *length, GLchar *uniformBlockName);
void glUniformBlockBinding (GLuint program, GLuint uniformBlockIndex, GLuint uniformBlockBinding);


enum { GL_VERSION_3_2 = 1 };
typedef struct __GLsync *GLsync;
typedef uint64_t GLuint64;
typedef int64_t GLint64;
enum {
    GL_CONTEXT_CORE_PROFILE_BIT       = 0x00000001,
    GL_CONTEXT_COMPATIBILITY_PROFILE_BIT = 0x00000002,
    GL_LINES_ADJACENCY                = 0x000A,
    GL_LINE_STRIP_ADJACENCY           = 0x000B,
    GL_TRIANGLES_ADJACENCY            = 0x000C,
    GL_TRIANGLE_STRIP_ADJACENCY       = 0x000D,
    GL_PROGRAM_POINT_SIZE             = 0x8642,
    GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS = 0x8C29,
    GL_FRAMEBUFFER_ATTACHMENT_LAYERED = 0x8DA7,
    GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS = 0x8DA8,
    GL_GEOMETRY_SHADER                = 0x8DD9,
    GL_GEOMETRY_VERTICES_OUT          = 0x8916,
    GL_GEOMETRY_INPUT_TYPE            = 0x8917,
    GL_GEOMETRY_OUTPUT_TYPE           = 0x8918,
    GL_MAX_GEOMETRY_UNIFORM_COMPONENTS = 0x8DDF,
    GL_MAX_GEOMETRY_OUTPUT_VERTICES   = 0x8DE0,
    GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS = 0x8DE1,
    GL_MAX_VERTEX_OUTPUT_COMPONENTS   = 0x9122,
    GL_MAX_GEOMETRY_INPUT_COMPONENTS  = 0x9123,
    GL_MAX_GEOMETRY_OUTPUT_COMPONENTS = 0x9124,
    GL_MAX_FRAGMENT_INPUT_COMPONENTS  = 0x9125,
    GL_CONTEXT_PROFILE_MASK           = 0x9126,
    GL_DEPTH_CLAMP                    = 0x864F,
    GL_QUADS_FOLLOW_PROVOKING_VERTEX_CONVENTION = 0x8E4C,
    GL_FIRST_VERTEX_CONVENTION        = 0x8E4D,
    GL_LAST_VERTEX_CONVENTION         = 0x8E4E,
    GL_PROVOKING_VERTEX               = 0x8E4F,
    GL_TEXTURE_CUBE_MAP_SEAMLESS      = 0x884F,
    GL_MAX_SERVER_WAIT_TIMEOUT        = 0x9111,
    GL_OBJECT_TYPE                    = 0x9112,
    GL_SYNC_CONDITION                 = 0x9113,
    GL_SYNC_STATUS                    = 0x9114,
    GL_SYNC_FLAGS                     = 0x9115,
    GL_SYNC_FENCE                     = 0x9116,
    GL_SYNC_GPU_COMMANDS_COMPLETE     = 0x9117,
    GL_UNSIGNALED                     = 0x9118,
    GL_SIGNALED                       = 0x9119,
    GL_ALREADY_SIGNALED               = 0x911A,
    GL_TIMEOUT_EXPIRED                = 0x911B,
    GL_CONDITION_SATISFIED            = 0x911C,
    GL_WAIT_FAILED                    = 0x911D,
/* GL_TIMEOUT_IGNORED                 = 0xFFFFFFFFFFFFFFFFull, */
    GL_SYNC_FLUSH_COMMANDS_BIT        = 0x00000001,
    GL_SAMPLE_POSITION                = 0x8E50,
    GL_SAMPLE_MASK                    = 0x8E51,
    GL_SAMPLE_MASK_VALUE              = 0x8E52,
    GL_MAX_SAMPLE_MASK_WORDS          = 0x8E59,
    GL_TEXTURE_2D_MULTISAMPLE         = 0x9100,
    GL_PROXY_TEXTURE_2D_MULTISAMPLE   = 0x9101,
    GL_TEXTURE_2D_MULTISAMPLE_ARRAY   = 0x9102,
    GL_PROXY_TEXTURE_2D_MULTISAMPLE_ARRAY = 0x9103,
    GL_TEXTURE_BINDING_2D_MULTISAMPLE = 0x9104,
    GL_TEXTURE_BINDING_2D_MULTISAMPLE_ARRAY = 0x9105,
    GL_TEXTURE_SAMPLES                = 0x9106,
    GL_TEXTURE_FIXED_SAMPLE_LOCATIONS = 0x9107,
    GL_SAMPLER_2D_MULTISAMPLE         = 0x9108,
    GL_INT_SAMPLER_2D_MULTISAMPLE     = 0x9109,
    GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE = 0x910A,
    GL_SAMPLER_2D_MULTISAMPLE_ARRAY   = 0x910B,
    GL_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910C,
    GL_UNSIGNED_INT_SAMPLER_2D_MULTISAMPLE_ARRAY = 0x910D,
    GL_MAX_COLOR_TEXTURE_SAMPLES      = 0x910E,
    GL_MAX_DEPTH_TEXTURE_SAMPLES      = 0x910F,
    GL_MAX_INTEGER_SAMPLES            = 0x9110
};
typedef void (* PFNGLDRAWELEMENTSBASEVERTEXPROC) (GLenum mode, GLsizei count, GLenum type, const void *indices, GLint basevertex);
typedef void (* PFNGLDRAWRANGEELEMENTSBASEVERTEXPROC) (GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const void *indices, GLint basevertex);
typedef void (* PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXPROC) (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei instancecount, GLint basevertex);
typedef void (* PFNGLMULTIDRAWELEMENTSBASEVERTEXPROC) (GLenum mode, const GLsizei *count, GLenum type, const void *const*indices, GLsizei drawcount, const GLint *basevertex);
typedef void (* PFNGLPROVOKINGVERTEXPROC) (GLenum mode);
typedef GLsync (* PFNGLFENCESYNCPROC) (GLenum condition, GLbitfield flags);
typedef GLboolean (* PFNGLISSYNCPROC) (GLsync sync);
typedef void (* PFNGLDELETESYNCPROC) (GLsync sync);
typedef GLenum (* PFNGLCLIENTWAITSYNCPROC) (GLsync sync, GLbitfield flags, GLuint64 timeout);
typedef void (* PFNGLWAITSYNCPROC) (GLsync sync, GLbitfield flags, GLuint64 timeout);
typedef void (* PFNGLGETINTEGER64VPROC) (GLenum pname, GLint64 *data);
typedef void (* PFNGLGETSYNCIVPROC) (GLsync sync, GLenum pname, GLsizei count, GLsizei *length, GLint *values);
typedef void (* PFNGLGETINTEGER64I_VPROC) (GLenum target, GLuint index, GLint64 *data);
typedef void (* PFNGLGETBUFFERPARAMETERI64VPROC) (GLenum target, GLenum pname, GLint64 *params);
typedef void (* PFNGLFRAMEBUFFERTEXTUREPROC) (GLenum target, GLenum attachment, GLuint texture, GLint level);
typedef void (* PFNGLTEXIMAGE2DMULTISAMPLEPROC) (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations);
typedef void (* PFNGLTEXIMAGE3DMULTISAMPLEPROC) (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations);
typedef void (* PFNGLGETMULTISAMPLEFVPROC) (GLenum pname, GLuint index, GLfloat *val);
typedef void (* PFNGLSAMPLEMASKIPROC) (GLuint maskNumber, GLbitfield mask);
void glDrawElementsBaseVertex (GLenum mode, GLsizei count, GLenum type, const void *indices, GLint basevertex);
void glDrawRangeElementsBaseVertex (GLenum mode, GLuint start, GLuint end, GLsizei count, GLenum type, const void *indices, GLint basevertex);
void glDrawElementsInstancedBaseVertex (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei instancecount, GLint basevertex);
void glMultiDrawElementsBaseVertex (GLenum mode, const GLsizei *count, GLenum type, const void *const*indices, GLsizei drawcount, const GLint *basevertex);
void glProvokingVertex (GLenum mode);
GLsync glFenceSync (GLenum condition, GLbitfield flags);
GLboolean glIsSync (GLsync sync);
void glDeleteSync (GLsync sync);
GLenum glClientWaitSync (GLsync sync, GLbitfield flags, GLuint64 timeout);
void glWaitSync (GLsync sync, GLbitfield flags, GLuint64 timeout);
void glGetInteger64v (GLenum pname, GLint64 *data);
void glGetSynciv (GLsync sync, GLenum pname, GLsizei count, GLsizei *length, GLint *values);
void glGetInteger64i_v (GLenum target, GLuint index, GLint64 *data);
void glGetBufferParameteri64v (GLenum target, GLenum pname, GLint64 *params);
void glFramebufferTexture (GLenum target, GLenum attachment, GLuint texture, GLint level);
void glTexImage2DMultisample (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations);
void glTexImage3DMultisample (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations);
void glGetMultisamplefv (GLenum pname, GLuint index, GLfloat *val);
void glSampleMaski (GLuint maskNumber, GLbitfield mask);

enum { GL_VERSION_3_3 = 1 };
enum {
    GL_VERTEX_ATTRIB_ARRAY_DIVISOR    = 0x88FE,
    GL_SRC1_COLOR                     = 0x88F9,
    GL_ONE_MINUS_SRC1_COLOR           = 0x88FA,
    GL_ONE_MINUS_SRC1_ALPHA           = 0x88FB,
    GL_MAX_DUAL_SOURCE_DRAW_BUFFERS   = 0x88FC,
    GL_ANY_SAMPLES_PASSED             = 0x8C2F,
    GL_SAMPLER_BINDING                = 0x8919,
    GL_RGB10_A2UI                     = 0x906F,
    GL_TEXTURE_SWIZZLE_R              = 0x8E42,
    GL_TEXTURE_SWIZZLE_G              = 0x8E43,
    GL_TEXTURE_SWIZZLE_B              = 0x8E44,
    GL_TEXTURE_SWIZZLE_A              = 0x8E45,
    GL_TEXTURE_SWIZZLE_RGBA           = 0x8E46,
    GL_TIME_ELAPSED                   = 0x88BF,
    GL_TIMESTAMP                      = 0x8E28,
    GL_INT_2_10_10_10_REV             = 0x8D9F
};
typedef void (* PFNGLBINDFRAGDATALOCATIONINDEXEDPROC) (GLuint program, GLuint colorNumber, GLuint index, const GLchar *name);
typedef GLint (* PFNGLGETFRAGDATAINDEXPROC) (GLuint program, const GLchar *name);
typedef void (* PFNGLGENSAMPLERSPROC) (GLsizei count, GLuint *samplers);
typedef void (* PFNGLDELETESAMPLERSPROC) (GLsizei count, const GLuint *samplers);
typedef GLboolean (* PFNGLISSAMPLERPROC) (GLuint sampler);
typedef void (* PFNGLBINDSAMPLERPROC) (GLuint unit, GLuint sampler);
typedef void (* PFNGLSAMPLERPARAMETERIPROC) (GLuint sampler, GLenum pname, GLint param);
typedef void (* PFNGLSAMPLERPARAMETERIVPROC) (GLuint sampler, GLenum pname, const GLint *param);
typedef void (* PFNGLSAMPLERPARAMETERFPROC) (GLuint sampler, GLenum pname, GLfloat param);
typedef void (* PFNGLSAMPLERPARAMETERFVPROC) (GLuint sampler, GLenum pname, const GLfloat *param);
typedef void (* PFNGLSAMPLERPARAMETERIIVPROC) (GLuint sampler, GLenum pname, const GLint *param);
typedef void (* PFNGLSAMPLERPARAMETERIUIVPROC) (GLuint sampler, GLenum pname, const GLuint *param);
typedef void (* PFNGLGETSAMPLERPARAMETERIVPROC) (GLuint sampler, GLenum pname, GLint *params);
typedef void (* PFNGLGETSAMPLERPARAMETERIIVPROC) (GLuint sampler, GLenum pname, GLint *params);
typedef void (* PFNGLGETSAMPLERPARAMETERFVPROC) (GLuint sampler, GLenum pname, GLfloat *params);
typedef void (* PFNGLGETSAMPLERPARAMETERIUIVPROC) (GLuint sampler, GLenum pname, GLuint *params);
typedef void (* PFNGLQUERYCOUNTERPROC) (GLuint id, GLenum target);
typedef void (* PFNGLGETQUERYOBJECTI64VPROC) (GLuint id, GLenum pname, GLint64 *params);
typedef void (* PFNGLGETQUERYOBJECTUI64VPROC) (GLuint id, GLenum pname, GLuint64 *params);
typedef void (* PFNGLVERTEXATTRIBDIVISORPROC) (GLuint index, GLuint divisor);
typedef void (* PFNGLVERTEXATTRIBP1UIPROC) (GLuint index, GLenum type, GLboolean normalized, GLuint value);
typedef void (* PFNGLVERTEXATTRIBP1UIVPROC) (GLuint index, GLenum type, GLboolean normalized, const GLuint *value);
typedef void (* PFNGLVERTEXATTRIBP2UIPROC) (GLuint index, GLenum type, GLboolean normalized, GLuint value);
typedef void (* PFNGLVERTEXATTRIBP2UIVPROC) (GLuint index, GLenum type, GLboolean normalized, const GLuint *value);
typedef void (* PFNGLVERTEXATTRIBP3UIPROC) (GLuint index, GLenum type, GLboolean normalized, GLuint value);
typedef void (* PFNGLVERTEXATTRIBP3UIVPROC) (GLuint index, GLenum type, GLboolean normalized, const GLuint *value);
typedef void (* PFNGLVERTEXATTRIBP4UIPROC) (GLuint index, GLenum type, GLboolean normalized, GLuint value);
typedef void (* PFNGLVERTEXATTRIBP4UIVPROC) (GLuint index, GLenum type, GLboolean normalized, const GLuint *value);
void glBindFragDataLocationIndexed (GLuint program, GLuint colorNumber, GLuint index, const GLchar *name);
GLint glGetFragDataIndex (GLuint program, const GLchar *name);
void glGenSamplers (GLsizei count, GLuint *samplers);
void glDeleteSamplers (GLsizei count, const GLuint *samplers);
GLboolean glIsSampler (GLuint sampler);
void glBindSampler (GLuint unit, GLuint sampler);
void glSamplerParameteri (GLuint sampler, GLenum pname, GLint param);
void glSamplerParameteriv (GLuint sampler, GLenum pname, const GLint *param);
void glSamplerParameterf (GLuint sampler, GLenum pname, GLfloat param);
void glSamplerParameterfv (GLuint sampler, GLenum pname, const GLfloat *param);
void glSamplerParameterIiv (GLuint sampler, GLenum pname, const GLint *param);
void glSamplerParameterIuiv (GLuint sampler, GLenum pname, const GLuint *param);
void glGetSamplerParameteriv (GLuint sampler, GLenum pname, GLint *params);
void glGetSamplerParameterIiv (GLuint sampler, GLenum pname, GLint *params);
void glGetSamplerParameterfv (GLuint sampler, GLenum pname, GLfloat *params);
void glGetSamplerParameterIuiv (GLuint sampler, GLenum pname, GLuint *params);
void glQueryCounter (GLuint id, GLenum target);
void glGetQueryObjecti64v (GLuint id, GLenum pname, GLint64 *params);
void glGetQueryObjectui64v (GLuint id, GLenum pname, GLuint64 *params);
void glVertexAttribDivisor (GLuint index, GLuint divisor);
void glVertexAttribP1ui (GLuint index, GLenum type, GLboolean normalized, GLuint value);
void glVertexAttribP1uiv (GLuint index, GLenum type, GLboolean normalized, const GLuint *value);
void glVertexAttribP2ui (GLuint index, GLenum type, GLboolean normalized, GLuint value);
void glVertexAttribP2uiv (GLuint index, GLenum type, GLboolean normalized, const GLuint *value);
void glVertexAttribP3ui (GLuint index, GLenum type, GLboolean normalized, GLuint value);
void glVertexAttribP3uiv (GLuint index, GLenum type, GLboolean normalized, const GLuint *value);
void glVertexAttribP4ui (GLuint index, GLenum type, GLboolean normalized, GLuint value);
void glVertexAttribP4uiv (GLuint index, GLenum type, GLboolean normalized, const GLuint *value);

enum { GL_VERSION_4_0 = 1 };
enum {
    GL_SAMPLE_SHADING                 = 0x8C36,
    GL_MIN_SAMPLE_SHADING_VALUE       = 0x8C37,
    GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET = 0x8E5E,
    GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET = 0x8E5F,
    GL_TEXTURE_CUBE_MAP_ARRAY         = 0x9009,
    GL_TEXTURE_BINDING_CUBE_MAP_ARRAY = 0x900A,
    GL_PROXY_TEXTURE_CUBE_MAP_ARRAY   = 0x900B,
    GL_SAMPLER_CUBE_MAP_ARRAY         = 0x900C,
    GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW  = 0x900D,
    GL_INT_SAMPLER_CUBE_MAP_ARRAY     = 0x900E,
    GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY = 0x900F,
    GL_DRAW_INDIRECT_BUFFER           = 0x8F3F,
    GL_DRAW_INDIRECT_BUFFER_BINDING   = 0x8F43,
    GL_GEOMETRY_SHADER_INVOCATIONS    = 0x887F,
    GL_MAX_GEOMETRY_SHADER_INVOCATIONS = 0x8E5A,
    GL_MIN_FRAGMENT_INTERPOLATION_OFFSET = 0x8E5B,
    GL_MAX_FRAGMENT_INTERPOLATION_OFFSET = 0x8E5C,
    GL_FRAGMENT_INTERPOLATION_OFFSET_BITS = 0x8E5D,
    GL_MAX_VERTEX_STREAMS             = 0x8E71,
    GL_DOUBLE_VEC2                    = 0x8FFC,
    GL_DOUBLE_VEC3                    = 0x8FFD,
    GL_DOUBLE_VEC4                    = 0x8FFE,
    GL_DOUBLE_MAT2                    = 0x8F46,
    GL_DOUBLE_MAT3                    = 0x8F47,
    GL_DOUBLE_MAT4                    = 0x8F48,
    GL_DOUBLE_MAT2x3                  = 0x8F49,
    GL_DOUBLE_MAT2x4                  = 0x8F4A,
    GL_DOUBLE_MAT3x2                  = 0x8F4B,
    GL_DOUBLE_MAT3x4                  = 0x8F4C,
    GL_DOUBLE_MAT4x2                  = 0x8F4D,
    GL_DOUBLE_MAT4x3                  = 0x8F4E,
    GL_ACTIVE_SUBROUTINES             = 0x8DE5,
    GL_ACTIVE_SUBROUTINE_UNIFORMS     = 0x8DE6,
    GL_ACTIVE_SUBROUTINE_UNIFORM_LOCATIONS = 0x8E47,
    GL_ACTIVE_SUBROUTINE_MAX_LENGTH   = 0x8E48,
    GL_ACTIVE_SUBROUTINE_UNIFORM_MAX_LENGTH = 0x8E49,
    GL_MAX_SUBROUTINES                = 0x8DE7,
    GL_MAX_SUBROUTINE_UNIFORM_LOCATIONS = 0x8DE8,
    GL_NUM_COMPATIBLE_SUBROUTINES     = 0x8E4A,
    GL_COMPATIBLE_SUBROUTINES         = 0x8E4B,
    GL_PATCHES                        = 0x000E,
    GL_PATCH_VERTICES                 = 0x8E72,
    GL_PATCH_DEFAULT_INNER_LEVEL      = 0x8E73,
    GL_PATCH_DEFAULT_OUTER_LEVEL      = 0x8E74,
    GL_TESS_CONTROL_OUTPUT_VERTICES   = 0x8E75,
    GL_TESS_GEN_MODE                  = 0x8E76,
    GL_TESS_GEN_SPACING               = 0x8E77,
    GL_TESS_GEN_VERTEX_ORDER          = 0x8E78,
    GL_TESS_GEN_POINT_MODE            = 0x8E79,
    GL_ISOLINES                       = 0x8E7A,
    GL_FRACTIONAL_ODD                 = 0x8E7B,
    GL_FRACTIONAL_EVEN                = 0x8E7C,
    GL_MAX_PATCH_VERTICES             = 0x8E7D,
    GL_MAX_TESS_GEN_LEVEL             = 0x8E7E,
    GL_MAX_TESS_CONTROL_UNIFORM_COMPONENTS = 0x8E7F,
    GL_MAX_TESS_EVALUATION_UNIFORM_COMPONENTS = 0x8E80,
    GL_MAX_TESS_CONTROL_TEXTURE_IMAGE_UNITS = 0x8E81,
    GL_MAX_TESS_EVALUATION_TEXTURE_IMAGE_UNITS = 0x8E82,
    GL_MAX_TESS_CONTROL_OUTPUT_COMPONENTS = 0x8E83,
    GL_MAX_TESS_PATCH_COMPONENTS      = 0x8E84,
    GL_MAX_TESS_CONTROL_TOTAL_OUTPUT_COMPONENTS = 0x8E85,
    GL_MAX_TESS_EVALUATION_OUTPUT_COMPONENTS = 0x8E86,
    GL_MAX_TESS_CONTROL_UNIFORM_BLOCKS = 0x8E89,
    GL_MAX_TESS_EVALUATION_UNIFORM_BLOCKS = 0x8E8A,
    GL_MAX_TESS_CONTROL_INPUT_COMPONENTS = 0x886C,
    GL_MAX_TESS_EVALUATION_INPUT_COMPONENTS = 0x886D,
    GL_MAX_COMBINED_TESS_CONTROL_UNIFORM_COMPONENTS = 0x8E1E,
    GL_MAX_COMBINED_TESS_EVALUATION_UNIFORM_COMPONENTS = 0x8E1F,
    GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_CONTROL_SHADER = 0x84F0,
    GL_UNIFORM_BLOCK_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x84F1,
    GL_TESS_EVALUATION_SHADER         = 0x8E87,
    GL_TESS_CONTROL_SHADER            = 0x8E88,
    GL_TRANSFORM_FEEDBACK             = 0x8E22,
    GL_TRANSFORM_FEEDBACK_BUFFER_PAUSED = 0x8E23,
    GL_TRANSFORM_FEEDBACK_BUFFER_ACTIVE = 0x8E24,
    GL_TRANSFORM_FEEDBACK_BINDING     = 0x8E25,
    GL_MAX_TRANSFORM_FEEDBACK_BUFFERS = 0x8E70
};

typedef void (* PFNGLMINSAMPLESHADINGPROC) (GLfloat value);
typedef void (* PFNGLBLENDEQUATIONIPROC) (GLuint buf, GLenum mode);
typedef void (* PFNGLBLENDEQUATIONSEPARATEIPROC) (GLuint buf, GLenum modeRGB, GLenum modeAlpha);
typedef void (* PFNGLBLENDFUNCIPROC) (GLuint buf, GLenum src, GLenum dst);
typedef void (* PFNGLBLENDFUNCSEPARATEIPROC) (GLuint buf, GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha);
typedef void (* PFNGLDRAWARRAYSINDIRECTPROC) (GLenum mode, const void *indirect);
typedef void (* PFNGLDRAWELEMENTSINDIRECTPROC) (GLenum mode, GLenum type, const void *indirect);
typedef void (* PFNGLUNIFORM1DPROC) (GLint location, GLdouble x);
typedef void (* PFNGLUNIFORM2DPROC) (GLint location, GLdouble x, GLdouble y);
typedef void (* PFNGLUNIFORM3DPROC) (GLint location, GLdouble x, GLdouble y, GLdouble z);
typedef void (* PFNGLUNIFORM4DPROC) (GLint location, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
typedef void (* PFNGLUNIFORM1DVPROC) (GLint location, GLsizei count, const GLdouble *value);
typedef void (* PFNGLUNIFORM2DVPROC) (GLint location, GLsizei count, const GLdouble *value);
typedef void (* PFNGLUNIFORM3DVPROC) (GLint location, GLsizei count, const GLdouble *value);
typedef void (* PFNGLUNIFORM4DVPROC) (GLint location, GLsizei count, const GLdouble *value);
typedef void (* PFNGLUNIFORMMATRIX2DVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLUNIFORMMATRIX3DVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLUNIFORMMATRIX4DVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLUNIFORMMATRIX2X3DVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLUNIFORMMATRIX2X4DVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLUNIFORMMATRIX3X2DVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLUNIFORMMATRIX3X4DVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLUNIFORMMATRIX4X2DVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLUNIFORMMATRIX4X3DVPROC) (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLGETUNIFORMDVPROC) (GLuint program, GLint location, GLdouble *params);
typedef GLint (* PFNGLGETSUBROUTINEUNIFORMLOCATIONPROC) (GLuint program, GLenum shadertype, const GLchar *name);
typedef GLuint (* PFNGLGETSUBROUTINEINDEXPROC) (GLuint program, GLenum shadertype, const GLchar *name);
typedef void (* PFNGLGETACTIVESUBROUTINEUNIFORMIVPROC) (GLuint program, GLenum shadertype, GLuint index, GLenum pname, GLint *values);
typedef void (* PFNGLGETACTIVESUBROUTINEUNIFORMNAMEPROC) (GLuint program, GLenum shadertype, GLuint index, GLsizei bufSize, GLsizei *length, GLchar *name);
typedef void (* PFNGLGETACTIVESUBROUTINENAMEPROC) (GLuint program, GLenum shadertype, GLuint index, GLsizei bufSize, GLsizei *length, GLchar *name);
typedef void (* PFNGLUNIFORMSUBROUTINESUIVPROC) (GLenum shadertype, GLsizei count, const GLuint *indices);
typedef void (* PFNGLGETUNIFORMSUBROUTINEUIVPROC) (GLenum shadertype, GLint location, GLuint *params);
typedef void (* PFNGLGETPROGRAMSTAGEIVPROC) (GLuint program, GLenum shadertype, GLenum pname, GLint *values);
typedef void (* PFNGLPATCHPARAMETERIPROC) (GLenum pname, GLint value);
typedef void (* PFNGLPATCHPARAMETERFVPROC) (GLenum pname, const GLfloat *values);
typedef void (* PFNGLBINDTRANSFORMFEEDBACKPROC) (GLenum target, GLuint id);
typedef void (* PFNGLDELETETRANSFORMFEEDBACKSPROC) (GLsizei n, const GLuint *ids);
typedef void (* PFNGLGENTRANSFORMFEEDBACKSPROC) (GLsizei n, GLuint *ids);
typedef GLboolean (* PFNGLISTRANSFORMFEEDBACKPROC) (GLuint id);
typedef void (* PFNGLPAUSETRANSFORMFEEDBACKPROC) (void);
typedef void (* PFNGLRESUMETRANSFORMFEEDBACKPROC) (void);
typedef void (* PFNGLDRAWTRANSFORMFEEDBACKPROC) (GLenum mode, GLuint id);
typedef void (* PFNGLDRAWTRANSFORMFEEDBACKSTREAMPROC) (GLenum mode, GLuint id, GLuint stream);
typedef void (* PFNGLBEGINQUERYINDEXEDPROC) (GLenum target, GLuint index, GLuint id);
typedef void (* PFNGLENDQUERYINDEXEDPROC) (GLenum target, GLuint index);
typedef void (* PFNGLGETQUERYINDEXEDIVPROC) (GLenum target, GLuint index, GLenum pname, GLint *params);
void glMinSampleShading (GLfloat value);
void glBlendEquationi (GLuint buf, GLenum mode);
void glBlendEquationSeparatei (GLuint buf, GLenum modeRGB, GLenum modeAlpha);
void glBlendFunci (GLuint buf, GLenum src, GLenum dst);
void glBlendFuncSeparatei (GLuint buf, GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha);
void glDrawArraysIndirect (GLenum mode, const void *indirect);
void glDrawElementsIndirect (GLenum mode, GLenum type, const void *indirect);
void glUniform1d (GLint location, GLdouble x);
void glUniform2d (GLint location, GLdouble x, GLdouble y);
void glUniform3d (GLint location, GLdouble x, GLdouble y, GLdouble z);
void glUniform4d (GLint location, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glUniform1dv (GLint location, GLsizei count, const GLdouble *value);
void glUniform2dv (GLint location, GLsizei count, const GLdouble *value);
void glUniform3dv (GLint location, GLsizei count, const GLdouble *value);
void glUniform4dv (GLint location, GLsizei count, const GLdouble *value);
void glUniformMatrix2dv (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glUniformMatrix3dv (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glUniformMatrix4dv (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glUniformMatrix2x3dv (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glUniformMatrix2x4dv (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glUniformMatrix3x2dv (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glUniformMatrix3x4dv (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glUniformMatrix4x2dv (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glUniformMatrix4x3dv (GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glGetUniformdv (GLuint program, GLint location, GLdouble *params);
GLint glGetSubroutineUniformLocation (GLuint program, GLenum shadertype, const GLchar *name);
GLuint glGetSubroutineIndex (GLuint program, GLenum shadertype, const GLchar *name);
void glGetActiveSubroutineUniformiv (GLuint program, GLenum shadertype, GLuint index, GLenum pname, GLint *values);
void glGetActiveSubroutineUniformName (GLuint program, GLenum shadertype, GLuint index, GLsizei bufSize, GLsizei *length, GLchar *name);
void glGetActiveSubroutineName (GLuint program, GLenum shadertype, GLuint index, GLsizei bufSize, GLsizei *length, GLchar *name);
void glUniformSubroutinesuiv (GLenum shadertype, GLsizei count, const GLuint *indices);
void glGetUniformSubroutineuiv (GLenum shadertype, GLint location, GLuint *params);
void glGetProgramStageiv (GLuint program, GLenum shadertype, GLenum pname, GLint *values);
void glPatchParameteri (GLenum pname, GLint value);
void glPatchParameterfv (GLenum pname, const GLfloat *values);
void glBindTransformFeedback (GLenum target, GLuint id);
void glDeleteTransformFeedbacks (GLsizei n, const GLuint *ids);
void glGenTransformFeedbacks (GLsizei n, GLuint *ids);
GLboolean glIsTransformFeedback (GLuint id);
void glPauseTransformFeedback (void);
void glResumeTransformFeedback (void);
void glDrawTransformFeedback (GLenum mode, GLuint id);
void glDrawTransformFeedbackStream (GLenum mode, GLuint id, GLuint stream);
void glBeginQueryIndexed (GLenum target, GLuint index, GLuint id);
void glEndQueryIndexed (GLenum target, GLuint index);
void glGetQueryIndexediv (GLenum target, GLuint index, GLenum pname, GLint *params);

enum { GL_VERSION_4_1 = 1 };
enum {
    GL_FIXED                          = 0x140C,
    GL_IMPLEMENTATION_COLOR_READ_TYPE = 0x8B9A,
    GL_IMPLEMENTATION_COLOR_READ_FORMAT = 0x8B9B,
    GL_LOW_FLOAT                      = 0x8DF0,
    GL_MEDIUM_FLOAT                   = 0x8DF1,
    GL_HIGH_FLOAT                     = 0x8DF2,
    GL_LOW_INT                        = 0x8DF3,
    GL_MEDIUM_INT                     = 0x8DF4,
    GL_HIGH_INT                       = 0x8DF5,
    GL_SHADER_COMPILER                = 0x8DFA,
    GL_SHADER_BINARY_FORMATS          = 0x8DF8,
    GL_NUM_SHADER_BINARY_FORMATS      = 0x8DF9,
    GL_MAX_VERTEX_UNIFORM_VECTORS     = 0x8DFB,
    GL_MAX_VARYING_VECTORS            = 0x8DFC,
    GL_MAX_FRAGMENT_UNIFORM_VECTORS   = 0x8DFD,
    GL_RGB565                         = 0x8D62,
    GL_PROGRAM_BINARY_RETRIEVABLE_HINT = 0x8257,
    GL_PROGRAM_BINARY_LENGTH          = 0x8741,
    GL_NUM_PROGRAM_BINARY_FORMATS     = 0x87FE,
    GL_PROGRAM_BINARY_FORMATS         = 0x87FF,
    GL_VERTEX_SHADER_BIT              = 0x00000001,
    GL_FRAGMENT_SHADER_BIT            = 0x00000002,
    GL_GEOMETRY_SHADER_BIT            = 0x00000004,
    GL_TESS_CONTROL_SHADER_BIT        = 0x00000008,
    GL_TESS_EVALUATION_SHADER_BIT     = 0x00000010,
    GL_ALL_SHADER_BITS                = 0xFFFFFFFF,
    GL_PROGRAM_SEPARABLE              = 0x8258,
    GL_ACTIVE_PROGRAM                 = 0x8259,
    GL_PROGRAM_PIPELINE_BINDING       = 0x825A,
    GL_MAX_VIEWPORTS                  = 0x825B,
    GL_VIEWPORT_SUBPIXEL_BITS         = 0x825C,
    GL_VIEWPORT_BOUNDS_RANGE          = 0x825D,
    GL_LAYER_PROVOKING_VERTEX         = 0x825E,
    GL_VIEWPORT_INDEX_PROVOKING_VERTEX = 0x825F,
    GL_UNDEFINED_VERTEX               = 0x8260
};

typedef void (* PFNGLRELEASESHADERCOMPILERPROC) (void);
typedef void (* PFNGLSHADERBINARYPROC) (GLsizei count, const GLuint *shaders, GLenum binaryformat, const void *binary, GLsizei length);
typedef void (* PFNGLGETSHADERPRECISIONFORMATPROC) (GLenum shadertype, GLenum precisiontype, GLint *range, GLint *precision);
typedef void (* PFNGLDEPTHRANGEFPROC) (GLfloat n, GLfloat f);
typedef void (* PFNGLCLEARDEPTHFPROC) (GLfloat d);
typedef void (* PFNGLGETPROGRAMBINARYPROC) (GLuint program, GLsizei bufSize, GLsizei *length, GLenum *binaryFormat, void *binary);
typedef void (* PFNGLPROGRAMBINARYPROC) (GLuint program, GLenum binaryFormat, const void *binary, GLsizei length);
typedef void (* PFNGLPROGRAMPARAMETERIPROC) (GLuint program, GLenum pname, GLint value);
typedef void (* PFNGLUSEPROGRAMSTAGESPROC) (GLuint pipeline, GLbitfield stages, GLuint program);
typedef void (* PFNGLACTIVESHADERPROGRAMPROC) (GLuint pipeline, GLuint program);
typedef GLuint (* PFNGLCREATESHADERPROGRAMVPROC) (GLenum type, GLsizei count, const GLchar *const*strings);
typedef void (* PFNGLBINDPROGRAMPIPELINEPROC) (GLuint pipeline);
typedef void (* PFNGLDELETEPROGRAMPIPELINESPROC) (GLsizei n, const GLuint *pipelines);
typedef void (* PFNGLGENPROGRAMPIPELINESPROC) (GLsizei n, GLuint *pipelines);
typedef GLboolean (* PFNGLISPROGRAMPIPELINEPROC) (GLuint pipeline);
typedef void (* PFNGLGETPROGRAMPIPELINEIVPROC) (GLuint pipeline, GLenum pname, GLint *params);
typedef void (* PFNGLPROGRAMUNIFORM1IPROC) (GLuint program, GLint location, GLint v0);
typedef void (* PFNGLPROGRAMUNIFORM1IVPROC) (GLuint program, GLint location, GLsizei count, const GLint *value);
typedef void (* PFNGLPROGRAMUNIFORM1FPROC) (GLuint program, GLint location, GLfloat v0);
typedef void (* PFNGLPROGRAMUNIFORM1FVPROC) (GLuint program, GLint location, GLsizei count, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORM1DPROC) (GLuint program, GLint location, GLdouble v0);
typedef void (* PFNGLPROGRAMUNIFORM1DVPROC) (GLuint program, GLint location, GLsizei count, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORM1UIPROC) (GLuint program, GLint location, GLuint v0);
typedef void (* PFNGLPROGRAMUNIFORM1UIVPROC) (GLuint program, GLint location, GLsizei count, const GLuint *value);
typedef void (* PFNGLPROGRAMUNIFORM2IPROC) (GLuint program, GLint location, GLint v0, GLint v1);
typedef void (* PFNGLPROGRAMUNIFORM2IVPROC) (GLuint program, GLint location, GLsizei count, const GLint *value);
typedef void (* PFNGLPROGRAMUNIFORM2FPROC) (GLuint program, GLint location, GLfloat v0, GLfloat v1);
typedef void (* PFNGLPROGRAMUNIFORM2FVPROC) (GLuint program, GLint location, GLsizei count, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORM2DPROC) (GLuint program, GLint location, GLdouble v0, GLdouble v1);
typedef void (* PFNGLPROGRAMUNIFORM2DVPROC) (GLuint program, GLint location, GLsizei count, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORM2UIPROC) (GLuint program, GLint location, GLuint v0, GLuint v1);
typedef void (* PFNGLPROGRAMUNIFORM2UIVPROC) (GLuint program, GLint location, GLsizei count, const GLuint *value);
typedef void (* PFNGLPROGRAMUNIFORM3IPROC) (GLuint program, GLint location, GLint v0, GLint v1, GLint v2);
typedef void (* PFNGLPROGRAMUNIFORM3IVPROC) (GLuint program, GLint location, GLsizei count, const GLint *value);
typedef void (* PFNGLPROGRAMUNIFORM3FPROC) (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
typedef void (* PFNGLPROGRAMUNIFORM3FVPROC) (GLuint program, GLint location, GLsizei count, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORM3DPROC) (GLuint program, GLint location, GLdouble v0, GLdouble v1, GLdouble v2);
typedef void (* PFNGLPROGRAMUNIFORM3DVPROC) (GLuint program, GLint location, GLsizei count, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORM3UIPROC) (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2);
typedef void (* PFNGLPROGRAMUNIFORM3UIVPROC) (GLuint program, GLint location, GLsizei count, const GLuint *value);
typedef void (* PFNGLPROGRAMUNIFORM4IPROC) (GLuint program, GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
typedef void (* PFNGLPROGRAMUNIFORM4IVPROC) (GLuint program, GLint location, GLsizei count, const GLint *value);
typedef void (* PFNGLPROGRAMUNIFORM4FPROC) (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
typedef void (* PFNGLPROGRAMUNIFORM4FVPROC) (GLuint program, GLint location, GLsizei count, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORM4DPROC) (GLuint program, GLint location, GLdouble v0, GLdouble v1, GLdouble v2, GLdouble v3);
typedef void (* PFNGLPROGRAMUNIFORM4DVPROC) (GLuint program, GLint location, GLsizei count, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORM4UIPROC) (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3);
typedef void (* PFNGLPROGRAMUNIFORM4UIVPROC) (GLuint program, GLint location, GLsizei count, const GLuint *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX2FVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX3FVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX4FVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX2DVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX3DVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX4DVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX2X3FVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX3X2FVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX2X4FVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX4X2FVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX3X4FVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX4X3FVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX2X3DVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX3X2DVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX2X4DVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX4X2DVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX3X4DVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX4X3DVPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLVALIDATEPROGRAMPIPELINEPROC) (GLuint pipeline);
typedef void (* PFNGLGETPROGRAMPIPELINEINFOLOGPROC) (GLuint pipeline, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
typedef void (* PFNGLVERTEXATTRIBL1DPROC) (GLuint index, GLdouble x);
typedef void (* PFNGLVERTEXATTRIBL2DPROC) (GLuint index, GLdouble x, GLdouble y);
typedef void (* PFNGLVERTEXATTRIBL3DPROC) (GLuint index, GLdouble x, GLdouble y, GLdouble z);
typedef void (* PFNGLVERTEXATTRIBL4DPROC) (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
typedef void (* PFNGLVERTEXATTRIBL1DVPROC) (GLuint index, const GLdouble *v);
typedef void (* PFNGLVERTEXATTRIBL2DVPROC) (GLuint index, const GLdouble *v);
typedef void (* PFNGLVERTEXATTRIBL3DVPROC) (GLuint index, const GLdouble *v);
typedef void (* PFNGLVERTEXATTRIBL4DVPROC) (GLuint index, const GLdouble *v);
typedef void (* PFNGLVERTEXATTRIBLPOINTERPROC) (GLuint index, GLint size, GLenum type, GLsizei stride, const void *pointer);
typedef void (* PFNGLGETVERTEXATTRIBLDVPROC) (GLuint index, GLenum pname, GLdouble *params);
typedef void (* PFNGLVIEWPORTARRAYVPROC) (GLuint first, GLsizei count, const GLfloat *v);
typedef void (* PFNGLVIEWPORTINDEXEDFPROC) (GLuint index, GLfloat x, GLfloat y, GLfloat w, GLfloat h);
typedef void (* PFNGLVIEWPORTINDEXEDFVPROC) (GLuint index, const GLfloat *v);
typedef void (* PFNGLSCISSORARRAYVPROC) (GLuint first, GLsizei count, const GLint *v);
typedef void (* PFNGLSCISSORINDEXEDPROC) (GLuint index, GLint left, GLint bottom, GLsizei width, GLsizei height);
typedef void (* PFNGLSCISSORINDEXEDVPROC) (GLuint index, const GLint *v);
typedef void (* PFNGLDEPTHRANGEARRAYVPROC) (GLuint first, GLsizei count, const GLdouble *v);
typedef void (* PFNGLDEPTHRANGEINDEXEDPROC) (GLuint index, GLdouble n, GLdouble f);
typedef void (* PFNGLGETFLOATI_VPROC) (GLenum target, GLuint index, GLfloat *data);
typedef void (* PFNGLGETDOUBLEI_VPROC) (GLenum target, GLuint index, GLdouble *data);
void glReleaseShaderCompiler (void);
void glShaderBinary (GLsizei count, const GLuint *shaders, GLenum binaryformat, const void *binary, GLsizei length);
void glGetShaderPrecisionFormat (GLenum shadertype, GLenum precisiontype, GLint *range, GLint *precision);
void glDepthRangef (GLfloat n, GLfloat f);
void glClearDepthf (GLfloat d);
void glGetProgramBinary (GLuint program, GLsizei bufSize, GLsizei *length, GLenum *binaryFormat, void *binary);
void glProgramBinary (GLuint program, GLenum binaryFormat, const void *binary, GLsizei length);
void glProgramParameteri (GLuint program, GLenum pname, GLint value);
void glUseProgramStages (GLuint pipeline, GLbitfield stages, GLuint program);
void glActiveShaderProgram (GLuint pipeline, GLuint program);
GLuint glCreateShaderProgramv (GLenum type, GLsizei count, const GLchar *const*strings);
void glBindProgramPipeline (GLuint pipeline);
void glDeleteProgramPipelines (GLsizei n, const GLuint *pipelines);
void glGenProgramPipelines (GLsizei n, GLuint *pipelines);
GLboolean glIsProgramPipeline (GLuint pipeline);
void glGetProgramPipelineiv (GLuint pipeline, GLenum pname, GLint *params);
void glProgramUniform1i (GLuint program, GLint location, GLint v0);
void glProgramUniform1iv (GLuint program, GLint location, GLsizei count, const GLint *value);
void glProgramUniform1f (GLuint program, GLint location, GLfloat v0);
void glProgramUniform1fv (GLuint program, GLint location, GLsizei count, const GLfloat *value);
void glProgramUniform1d (GLuint program, GLint location, GLdouble v0);
void glProgramUniform1dv (GLuint program, GLint location, GLsizei count, const GLdouble *value);
void glProgramUniform1ui (GLuint program, GLint location, GLuint v0);
void glProgramUniform1uiv (GLuint program, GLint location, GLsizei count, const GLuint *value);
void glProgramUniform2i (GLuint program, GLint location, GLint v0, GLint v1);
void glProgramUniform2iv (GLuint program, GLint location, GLsizei count, const GLint *value);
void glProgramUniform2f (GLuint program, GLint location, GLfloat v0, GLfloat v1);
void glProgramUniform2fv (GLuint program, GLint location, GLsizei count, const GLfloat *value);
void glProgramUniform2d (GLuint program, GLint location, GLdouble v0, GLdouble v1);
void glProgramUniform2dv (GLuint program, GLint location, GLsizei count, const GLdouble *value);
void glProgramUniform2ui (GLuint program, GLint location, GLuint v0, GLuint v1);
void glProgramUniform2uiv (GLuint program, GLint location, GLsizei count, const GLuint *value);
void glProgramUniform3i (GLuint program, GLint location, GLint v0, GLint v1, GLint v2);
void glProgramUniform3iv (GLuint program, GLint location, GLsizei count, const GLint *value);
void glProgramUniform3f (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
void glProgramUniform3fv (GLuint program, GLint location, GLsizei count, const GLfloat *value);
void glProgramUniform3d (GLuint program, GLint location, GLdouble v0, GLdouble v1, GLdouble v2);
void glProgramUniform3dv (GLuint program, GLint location, GLsizei count, const GLdouble *value);
void glProgramUniform3ui (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2);
void glProgramUniform3uiv (GLuint program, GLint location, GLsizei count, const GLuint *value);
void glProgramUniform4i (GLuint program, GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
void glProgramUniform4iv (GLuint program, GLint location, GLsizei count, const GLint *value);
void glProgramUniform4f (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
void glProgramUniform4fv (GLuint program, GLint location, GLsizei count, const GLfloat *value);
void glProgramUniform4d (GLuint program, GLint location, GLdouble v0, GLdouble v1, GLdouble v2, GLdouble v3);
void glProgramUniform4dv (GLuint program, GLint location, GLsizei count, const GLdouble *value);
void glProgramUniform4ui (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3);
void glProgramUniform4uiv (GLuint program, GLint location, GLsizei count, const GLuint *value);
void glProgramUniformMatrix2fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix3fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix4fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix2dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glProgramUniformMatrix3dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glProgramUniformMatrix4dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glProgramUniformMatrix2x3fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix3x2fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix2x4fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix4x2fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix3x4fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix4x3fv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix2x3dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glProgramUniformMatrix3x2dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glProgramUniformMatrix2x4dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glProgramUniformMatrix4x2dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glProgramUniformMatrix3x4dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glProgramUniformMatrix4x3dv (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glValidateProgramPipeline (GLuint pipeline);
void glGetProgramPipelineInfoLog (GLuint pipeline, GLsizei bufSize, GLsizei *length, GLchar *infoLog);
void glVertexAttribL1d (GLuint index, GLdouble x);
void glVertexAttribL2d (GLuint index, GLdouble x, GLdouble y);
void glVertexAttribL3d (GLuint index, GLdouble x, GLdouble y, GLdouble z);
void glVertexAttribL4d (GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glVertexAttribL1dv (GLuint index, const GLdouble *v);
void glVertexAttribL2dv (GLuint index, const GLdouble *v);
void glVertexAttribL3dv (GLuint index, const GLdouble *v);
void glVertexAttribL4dv (GLuint index, const GLdouble *v);
void glVertexAttribLPointer (GLuint index, GLint size, GLenum type, GLsizei stride, const void *pointer);
void glGetVertexAttribLdv (GLuint index, GLenum pname, GLdouble *params);
void glViewportArrayv (GLuint first, GLsizei count, const GLfloat *v);
void glViewportIndexedf (GLuint index, GLfloat x, GLfloat y, GLfloat w, GLfloat h);
void glViewportIndexedfv (GLuint index, const GLfloat *v);
void glScissorArrayv (GLuint first, GLsizei count, const GLint *v);
void glScissorIndexed (GLuint index, GLint left, GLint bottom, GLsizei width, GLsizei height);
void glScissorIndexedv (GLuint index, const GLint *v);
void glDepthRangeArrayv (GLuint first, GLsizei count, const GLdouble *v);
void glDepthRangeIndexed (GLuint index, GLdouble n, GLdouble f);
void glGetFloati_v (GLenum target, GLuint index, GLfloat *data);
void glGetDoublei_v (GLenum target, GLuint index, GLdouble *data);

enum { GL_VERSION_4_2 = 1 };
enum {
    GL_COPY_READ_BUFFER_BINDING       = 0x8F36,
    GL_COPY_WRITE_BUFFER_BINDING      = 0x8F37,
    GL_TRANSFORM_FEEDBACK_ACTIVE      = 0x8E24,
    GL_TRANSFORM_FEEDBACK_PAUSED      = 0x8E23,
    GL_UNPACK_COMPRESSED_BLOCK_WIDTH  = 0x9127,
    GL_UNPACK_COMPRESSED_BLOCK_HEIGHT = 0x9128,
    GL_UNPACK_COMPRESSED_BLOCK_DEPTH  = 0x9129,
    GL_UNPACK_COMPRESSED_BLOCK_SIZE   = 0x912A,
    GL_PACK_COMPRESSED_BLOCK_WIDTH    = 0x912B,
    GL_PACK_COMPRESSED_BLOCK_HEIGHT   = 0x912C,
    GL_PACK_COMPRESSED_BLOCK_DEPTH    = 0x912D,
    GL_PACK_COMPRESSED_BLOCK_SIZE     = 0x912E,
    GL_NUM_SAMPLE_COUNTS              = 0x9380,
    GL_MIN_MAP_BUFFER_ALIGNMENT       = 0x90BC,
    GL_ATOMIC_COUNTER_BUFFER          = 0x92C0,
    GL_ATOMIC_COUNTER_BUFFER_BINDING  = 0x92C1,
    GL_ATOMIC_COUNTER_BUFFER_START    = 0x92C2,
    GL_ATOMIC_COUNTER_BUFFER_SIZE     = 0x92C3,
    GL_ATOMIC_COUNTER_BUFFER_DATA_SIZE = 0x92C4,
    GL_ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTERS = 0x92C5,
    GL_ATOMIC_COUNTER_BUFFER_ACTIVE_ATOMIC_COUNTER_INDICES = 0x92C6,
    GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_VERTEX_SHADER = 0x92C7,
    GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_CONTROL_SHADER = 0x92C8,
    GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x92C9,
    GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_GEOMETRY_SHADER = 0x92CA,
    GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_FRAGMENT_SHADER = 0x92CB,
    GL_MAX_VERTEX_ATOMIC_COUNTER_BUFFERS = 0x92CC,
    GL_MAX_TESS_CONTROL_ATOMIC_COUNTER_BUFFERS = 0x92CD,
    GL_MAX_TESS_EVALUATION_ATOMIC_COUNTER_BUFFERS = 0x92CE,
    GL_MAX_GEOMETRY_ATOMIC_COUNTER_BUFFERS = 0x92CF,
    GL_MAX_FRAGMENT_ATOMIC_COUNTER_BUFFERS = 0x92D0,
    GL_MAX_COMBINED_ATOMIC_COUNTER_BUFFERS = 0x92D1,
    GL_MAX_VERTEX_ATOMIC_COUNTERS     = 0x92D2,
    GL_MAX_TESS_CONTROL_ATOMIC_COUNTERS = 0x92D3,
    GL_MAX_TESS_EVALUATION_ATOMIC_COUNTERS = 0x92D4,
    GL_MAX_GEOMETRY_ATOMIC_COUNTERS   = 0x92D5,
    GL_MAX_FRAGMENT_ATOMIC_COUNTERS   = 0x92D6,
    GL_MAX_COMBINED_ATOMIC_COUNTERS   = 0x92D7,
    GL_MAX_ATOMIC_COUNTER_BUFFER_SIZE = 0x92D8,
    GL_MAX_ATOMIC_COUNTER_BUFFER_BINDINGS = 0x92DC,
    GL_ACTIVE_ATOMIC_COUNTER_BUFFERS  = 0x92D9,
    GL_UNIFORM_ATOMIC_COUNTER_BUFFER_INDEX = 0x92DA,
    GL_UNSIGNED_INT_ATOMIC_COUNTER    = 0x92DB,
    GL_VERTEX_ATTRIB_ARRAY_BARRIER_BIT = 0x00000001,
    GL_ELEMENT_ARRAY_BARRIER_BIT      = 0x00000002,
    GL_UNIFORM_BARRIER_BIT            = 0x00000004,
    GL_TEXTURE_FETCH_BARRIER_BIT      = 0x00000008,
    GL_SHADER_IMAGE_ACCESS_BARRIER_BIT = 0x00000020,
    GL_COMMAND_BARRIER_BIT            = 0x00000040,
    GL_PIXEL_BUFFER_BARRIER_BIT       = 0x00000080,
    GL_TEXTURE_UPDATE_BARRIER_BIT     = 0x00000100,
    GL_BUFFER_UPDATE_BARRIER_BIT      = 0x00000200,
    GL_FRAMEBUFFER_BARRIER_BIT        = 0x00000400,
    GL_TRANSFORM_FEEDBACK_BARRIER_BIT = 0x00000800,
    GL_ATOMIC_COUNTER_BARRIER_BIT     = 0x00001000,
    GL_ALL_BARRIER_BITS               = 0xFFFFFFFF,
    GL_MAX_IMAGE_UNITS                = 0x8F38,
    GL_MAX_COMBINED_IMAGE_UNITS_AND_FRAGMENT_OUTPUTS = 0x8F39,
    GL_IMAGE_BINDING_NAME             = 0x8F3A,
    GL_IMAGE_BINDING_LEVEL            = 0x8F3B,
    GL_IMAGE_BINDING_LAYERED          = 0x8F3C,
    GL_IMAGE_BINDING_LAYER            = 0x8F3D,
    GL_IMAGE_BINDING_ACCESS           = 0x8F3E,
    GL_IMAGE_1D                       = 0x904C,
    GL_IMAGE_2D                       = 0x904D,
    GL_IMAGE_3D                       = 0x904E,
    GL_IMAGE_2D_RECT                  = 0x904F,
    GL_IMAGE_CUBE                     = 0x9050,
    GL_IMAGE_BUFFER                   = 0x9051,
    GL_IMAGE_1D_ARRAY                 = 0x9052,
    GL_IMAGE_2D_ARRAY                 = 0x9053,
    GL_IMAGE_CUBE_MAP_ARRAY           = 0x9054,
    GL_IMAGE_2D_MULTISAMPLE           = 0x9055,
    GL_IMAGE_2D_MULTISAMPLE_ARRAY     = 0x9056,
    GL_INT_IMAGE_1D                   = 0x9057,
    GL_INT_IMAGE_2D                   = 0x9058,
    GL_INT_IMAGE_3D                   = 0x9059,
    GL_INT_IMAGE_2D_RECT              = 0x905A,
    GL_INT_IMAGE_CUBE                 = 0x905B,
    GL_INT_IMAGE_BUFFER               = 0x905C,
    GL_INT_IMAGE_1D_ARRAY             = 0x905D,
    GL_INT_IMAGE_2D_ARRAY             = 0x905E,
    GL_INT_IMAGE_CUBE_MAP_ARRAY       = 0x905F,
    GL_INT_IMAGE_2D_MULTISAMPLE       = 0x9060,
    GL_INT_IMAGE_2D_MULTISAMPLE_ARRAY = 0x9061,
    GL_UNSIGNED_INT_IMAGE_1D          = 0x9062,
    GL_UNSIGNED_INT_IMAGE_2D          = 0x9063,
    GL_UNSIGNED_INT_IMAGE_3D          = 0x9064,
    GL_UNSIGNED_INT_IMAGE_2D_RECT     = 0x9065,
    GL_UNSIGNED_INT_IMAGE_CUBE        = 0x9066,
    GL_UNSIGNED_INT_IMAGE_BUFFER      = 0x9067,
    GL_UNSIGNED_INT_IMAGE_1D_ARRAY    = 0x9068,
    GL_UNSIGNED_INT_IMAGE_2D_ARRAY    = 0x9069,
    GL_UNSIGNED_INT_IMAGE_CUBE_MAP_ARRAY = 0x906A,
    GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE = 0x906B,
    GL_UNSIGNED_INT_IMAGE_2D_MULTISAMPLE_ARRAY = 0x906C,
    GL_MAX_IMAGE_SAMPLES              = 0x906D,
    GL_IMAGE_BINDING_FORMAT           = 0x906E,
    GL_IMAGE_FORMAT_COMPATIBILITY_TYPE = 0x90C7,
    GL_IMAGE_FORMAT_COMPATIBILITY_BY_SIZE = 0x90C8,
    GL_IMAGE_FORMAT_COMPATIBILITY_BY_CLASS = 0x90C9,
    GL_MAX_VERTEX_IMAGE_UNIFORMS      = 0x90CA,
    GL_MAX_TESS_CONTROL_IMAGE_UNIFORMS = 0x90CB,
    GL_MAX_TESS_EVALUATION_IMAGE_UNIFORMS = 0x90CC,
    GL_MAX_GEOMETRY_IMAGE_UNIFORMS    = 0x90CD,
    GL_MAX_FRAGMENT_IMAGE_UNIFORMS    = 0x90CE,
    GL_MAX_COMBINED_IMAGE_UNIFORMS    = 0x90CF,
    GL_COMPRESSED_RGBA_BPTC_UNORM     = 0x8E8C,
    GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM = 0x8E8D,
    GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT = 0x8E8E,
    GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT = 0x8E8F,
    GL_TEXTURE_IMMUTABLE_FORMAT       = 0x912F
};
typedef void (* PFNGLDRAWARRAYSINSTANCEDBASEINSTANCEPROC) (GLenum mode, GLint first, GLsizei count, GLsizei instancecount, GLuint baseinstance);
typedef void (* PFNGLDRAWELEMENTSINSTANCEDBASEINSTANCEPROC) (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei instancecount, GLuint baseinstance);
typedef void (* PFNGLDRAWELEMENTSINSTANCEDBASEVERTEXBASEINSTANCEPROC) (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei instancecount, GLint basevertex, GLuint baseinstance);
typedef void (* PFNGLGETINTERNALFORMATIVPROC) (GLenum target, GLenum internalformat, GLenum pname, GLsizei count, GLint *params);
typedef void (* PFNGLGETACTIVEATOMICCOUNTERBUFFERIVPROC) (GLuint program, GLuint bufferIndex, GLenum pname, GLint *params);
typedef void (* PFNGLBINDIMAGETEXTUREPROC) (GLuint unit, GLuint texture, GLint level, GLboolean layered, GLint layer, GLenum access, GLenum format);
typedef void (* PFNGLMEMORYBARRIERPROC) (GLbitfield barriers);
typedef void (* PFNGLTEXSTORAGE1DPROC) (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width);
typedef void (* PFNGLTEXSTORAGE2DPROC) (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
typedef void (* PFNGLTEXSTORAGE3DPROC) (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
typedef void (* PFNGLDRAWTRANSFORMFEEDBACKINSTANCEDPROC) (GLenum mode, GLuint id, GLsizei instancecount);
typedef void (* PFNGLDRAWTRANSFORMFEEDBACKSTREAMINSTANCEDPROC) (GLenum mode, GLuint id, GLuint stream, GLsizei instancecount);
void glDrawArraysInstancedBaseInstance (GLenum mode, GLint first, GLsizei count, GLsizei instancecount, GLuint baseinstance);
void glDrawElementsInstancedBaseInstance (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei instancecount, GLuint baseinstance);
void glDrawElementsInstancedBaseVertexBaseInstance (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei instancecount, GLint basevertex, GLuint baseinstance);
void glGetInternalformativ (GLenum target, GLenum internalformat, GLenum pname, GLsizei count, GLint *params);
void glGetActiveAtomicCounterBufferiv (GLuint program, GLuint bufferIndex, GLenum pname, GLint *params);
void glBindImageTexture (GLuint unit, GLuint texture, GLint level, GLboolean layered, GLint layer, GLenum access, GLenum format);
void glMemoryBarrier (GLbitfield barriers);
void glTexStorage1D (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width);
void glTexStorage2D (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
void glTexStorage3D (GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
void glDrawTransformFeedbackInstanced (GLenum mode, GLuint id, GLsizei instancecount);
void glDrawTransformFeedbackStreamInstanced (GLenum mode, GLuint id, GLuint stream, GLsizei instancecount);

enum { GL_VERSION_4_3 = 1 };
typedef void ( *GLDEBUGPROC)(GLenum source,GLenum type,GLuint id,GLenum severity,GLsizei length,const GLchar *message,const void *userParam);
enum {   
    GL_NUM_SHADING_LANGUAGE_VERSIONS  = 0x82E9,
    GL_VERTEX_ATTRIB_ARRAY_LONG       = 0x874E,
    GL_COMPRESSED_RGB8_ETC2           = 0x9274,
    GL_COMPRESSED_SRGB8_ETC2          = 0x9275,
    GL_COMPRESSED_RGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9276,
    GL_COMPRESSED_SRGB8_PUNCHTHROUGH_ALPHA1_ETC2 = 0x9277,
    GL_COMPRESSED_RGBA8_ETC2_EAC      = 0x9278,
    GL_COMPRESSED_SRGB8_ALPHA8_ETC2_EAC = 0x9279,
    GL_COMPRESSED_R11_EAC             = 0x9270,
    GL_COMPRESSED_SIGNED_R11_EAC      = 0x9271,
    GL_COMPRESSED_RG11_EAC            = 0x9272,
    GL_COMPRESSED_SIGNED_RG11_EAC     = 0x9273,
    GL_PRIMITIVE_RESTART_FIXED_INDEX  = 0x8D69,
    GL_ANY_SAMPLES_PASSED_CONSERVATIVE = 0x8D6A,
    GL_MAX_ELEMENT_INDEX              = 0x8D6B,
    GL_COMPUTE_SHADER                 = 0x91B9,
    GL_MAX_COMPUTE_UNIFORM_BLOCKS     = 0x91BB,
    GL_MAX_COMPUTE_TEXTURE_IMAGE_UNITS = 0x91BC,
    GL_MAX_COMPUTE_IMAGE_UNIFORMS     = 0x91BD,
    GL_MAX_COMPUTE_SHARED_MEMORY_SIZE = 0x8262,
    GL_MAX_COMPUTE_UNIFORM_COMPONENTS = 0x8263,
    GL_MAX_COMPUTE_ATOMIC_COUNTER_BUFFERS = 0x8264,
    GL_MAX_COMPUTE_ATOMIC_COUNTERS    = 0x8265,
    GL_MAX_COMBINED_COMPUTE_UNIFORM_COMPONENTS = 0x8266,
    GL_MAX_COMPUTE_WORK_GROUP_INVOCATIONS = 0x90EB,
    GL_MAX_COMPUTE_WORK_GROUP_COUNT   = 0x91BE,
    GL_MAX_COMPUTE_WORK_GROUP_SIZE    = 0x91BF,
    GL_COMPUTE_WORK_GROUP_SIZE        = 0x8267,
    GL_UNIFORM_BLOCK_REFERENCED_BY_COMPUTE_SHADER = 0x90EC,
    GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_COMPUTE_SHADER = 0x90ED,
    GL_DISPATCH_INDIRECT_BUFFER       = 0x90EE,
    GL_DISPATCH_INDIRECT_BUFFER_BINDING = 0x90EF,
    GL_COMPUTE_SHADER_BIT             = 0x00000020,
    GL_DEBUG_OUTPUT_SYNCHRONOUS       = 0x8242,
    GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH = 0x8243,
    GL_DEBUG_CALLBACK_FUNCTION        = 0x8244,
    GL_DEBUG_CALLBACK_USER_PARAM      = 0x8245,
    GL_DEBUG_SOURCE_API               = 0x8246,
    GL_DEBUG_SOURCE_WINDOW_SYSTEM     = 0x8247,
    GL_DEBUG_SOURCE_SHADER_COMPILER   = 0x8248,
    GL_DEBUG_SOURCE_THIRD_PARTY       = 0x8249,
    GL_DEBUG_SOURCE_APPLICATION       = 0x824A,
    GL_DEBUG_SOURCE_OTHER             = 0x824B,
    GL_DEBUG_TYPE_ERROR               = 0x824C,
    GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR = 0x824D,
    GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR  = 0x824E,
    GL_DEBUG_TYPE_PORTABILITY         = 0x824F,
    GL_DEBUG_TYPE_PERFORMANCE         = 0x8250,
    GL_DEBUG_TYPE_OTHER               = 0x8251,
    GL_MAX_DEBUG_MESSAGE_LENGTH       = 0x9143,
    GL_MAX_DEBUG_LOGGED_MESSAGES      = 0x9144,
    GL_DEBUG_LOGGED_MESSAGES          = 0x9145,
    GL_DEBUG_SEVERITY_HIGH            = 0x9146,
    GL_DEBUG_SEVERITY_MEDIUM          = 0x9147,
    GL_DEBUG_SEVERITY_LOW             = 0x9148,
    GL_DEBUG_TYPE_MARKER              = 0x8268,
    GL_DEBUG_TYPE_PUSH_GROUP          = 0x8269,
    GL_DEBUG_TYPE_POP_GROUP           = 0x826A,
    GL_DEBUG_SEVERITY_NOTIFICATION    = 0x826B,
    GL_MAX_DEBUG_GROUP_STACK_DEPTH    = 0x826C,
    GL_DEBUG_GROUP_STACK_DEPTH        = 0x826D,
    GL_BUFFER                         = 0x82E0,
    GL_SHADER                         = 0x82E1,
    GL_PROGRAM                        = 0x82E2,
    GL_QUERY                          = 0x82E3,
    GL_PROGRAM_PIPELINE               = 0x82E4,
    GL_SAMPLER                        = 0x82E6,
    GL_MAX_LABEL_LENGTH               = 0x82E8,
    GL_DEBUG_OUTPUT                   = 0x92E0,
    GL_CONTEXT_FLAG_DEBUG_BIT         = 0x00000002,
    GL_MAX_UNIFORM_LOCATIONS          = 0x826E,
    GL_FRAMEBUFFER_DEFAULT_WIDTH      = 0x9310,
    GL_FRAMEBUFFER_DEFAULT_HEIGHT     = 0x9311,
    GL_FRAMEBUFFER_DEFAULT_LAYERS     = 0x9312,
    GL_FRAMEBUFFER_DEFAULT_SAMPLES    = 0x9313,
    GL_FRAMEBUFFER_DEFAULT_FIXED_SAMPLE_LOCATIONS = 0x9314,
    GL_MAX_FRAMEBUFFER_WIDTH          = 0x9315,
    GL_MAX_FRAMEBUFFER_HEIGHT         = 0x9316,
    GL_MAX_FRAMEBUFFER_LAYERS         = 0x9317,
    GL_MAX_FRAMEBUFFER_SAMPLES        = 0x9318,
    GL_INTERNALFORMAT_SUPPORTED       = 0x826F,
    GL_INTERNALFORMAT_PREFERRED       = 0x8270,
    GL_INTERNALFORMAT_RED_SIZE        = 0x8271,
    GL_INTERNALFORMAT_GREEN_SIZE      = 0x8272,
    GL_INTERNALFORMAT_BLUE_SIZE       = 0x8273,
    GL_INTERNALFORMAT_ALPHA_SIZE      = 0x8274,
    GL_INTERNALFORMAT_DEPTH_SIZE      = 0x8275,
    GL_INTERNALFORMAT_STENCIL_SIZE    = 0x8276,
    GL_INTERNALFORMAT_SHARED_SIZE     = 0x8277,
    GL_INTERNALFORMAT_RED_TYPE        = 0x8278,
    GL_INTERNALFORMAT_GREEN_TYPE      = 0x8279,
    GL_INTERNALFORMAT_BLUE_TYPE       = 0x827A,
    GL_INTERNALFORMAT_ALPHA_TYPE      = 0x827B,
    GL_INTERNALFORMAT_DEPTH_TYPE      = 0x827C,
    GL_INTERNALFORMAT_STENCIL_TYPE    = 0x827D,
    GL_MAX_WIDTH                      = 0x827E,
    GL_MAX_HEIGHT                     = 0x827F,
    GL_MAX_DEPTH                      = 0x8280,
    GL_MAX_LAYERS                     = 0x8281,
    GL_MAX_COMBINED_DIMENSIONS        = 0x8282,
    GL_COLOR_COMPONENTS               = 0x8283,
    GL_DEPTH_COMPONENTS               = 0x8284,
    GL_STENCIL_COMPONENTS             = 0x8285,
    GL_COLOR_RENDERABLE               = 0x8286,
    GL_DEPTH_RENDERABLE               = 0x8287,
    GL_STENCIL_RENDERABLE             = 0x8288,
    GL_FRAMEBUFFER_RENDERABLE         = 0x8289,
    GL_FRAMEBUFFER_RENDERABLE_LAYERED = 0x828A,
    GL_FRAMEBUFFER_BLEND              = 0x828B,
    GL_READ_PIXELS                    = 0x828C,
    GL_READ_PIXELS_FORMAT             = 0x828D,
    GL_READ_PIXELS_TYPE               = 0x828E,
    GL_TEXTURE_IMAGE_FORMAT           = 0x828F,
    GL_TEXTURE_IMAGE_TYPE             = 0x8290,
    GL_GET_TEXTURE_IMAGE_FORMAT       = 0x8291,
    GL_GET_TEXTURE_IMAGE_TYPE         = 0x8292,
    GL_MIPMAP                         = 0x8293,
    GL_MANUAL_GENERATE_MIPMAP         = 0x8294,
    GL_AUTO_GENERATE_MIPMAP           = 0x8295,
    GL_COLOR_ENCODING                 = 0x8296,
    GL_SRGB_READ                      = 0x8297,
    GL_SRGB_WRITE                     = 0x8298,
    GL_FILTER                         = 0x829A,
    GL_VERTEX_TEXTURE                 = 0x829B,
    GL_TESS_CONTROL_TEXTURE           = 0x829C,
    GL_TESS_EVALUATION_TEXTURE        = 0x829D,
    GL_GEOMETRY_TEXTURE               = 0x829E,
    GL_FRAGMENT_TEXTURE               = 0x829F,
    GL_COMPUTE_TEXTURE                = 0x82A0,
    GL_TEXTURE_SHADOW                 = 0x82A1,
    GL_TEXTURE_GATHER                 = 0x82A2,
    GL_TEXTURE_GATHER_SHADOW          = 0x82A3,
    GL_SHADER_IMAGE_LOAD              = 0x82A4,
    GL_SHADER_IMAGE_STORE             = 0x82A5,
    GL_SHADER_IMAGE_ATOMIC            = 0x82A6,
    GL_IMAGE_TEXEL_SIZE               = 0x82A7,
    GL_IMAGE_COMPATIBILITY_CLASS      = 0x82A8,
    GL_IMAGE_PIXEL_FORMAT             = 0x82A9,
    GL_IMAGE_PIXEL_TYPE               = 0x82AA,
    GL_SIMULTANEOUS_TEXTURE_AND_DEPTH_TEST = 0x82AC,
    GL_SIMULTANEOUS_TEXTURE_AND_STENCIL_TEST = 0x82AD,
    GL_SIMULTANEOUS_TEXTURE_AND_DEPTH_WRITE = 0x82AE,
    GL_SIMULTANEOUS_TEXTURE_AND_STENCIL_WRITE = 0x82AF,
    GL_TEXTURE_COMPRESSED_BLOCK_WIDTH = 0x82B1,
    GL_TEXTURE_COMPRESSED_BLOCK_HEIGHT = 0x82B2,
    GL_TEXTURE_COMPRESSED_BLOCK_SIZE  = 0x82B3,
    GL_CLEAR_BUFFER                   = 0x82B4,
    GL_TEXTURE_VIEW                   = 0x82B5,
    GL_VIEW_COMPATIBILITY_CLASS       = 0x82B6,
    GL_FULL_SUPPORT                   = 0x82B7,
    GL_CAVEAT_SUPPORT                 = 0x82B8,
    GL_IMAGE_CLASS_4_X_32             = 0x82B9,
    GL_IMAGE_CLASS_2_X_32             = 0x82BA,
    GL_IMAGE_CLASS_1_X_32             = 0x82BB,
    GL_IMAGE_CLASS_4_X_16             = 0x82BC,
    GL_IMAGE_CLASS_2_X_16             = 0x82BD,
    GL_IMAGE_CLASS_1_X_16             = 0x82BE,
    GL_IMAGE_CLASS_4_X_8              = 0x82BF,
    GL_IMAGE_CLASS_2_X_8              = 0x82C0,
    GL_IMAGE_CLASS_1_X_8              = 0x82C1,
    GL_IMAGE_CLASS_11_11_10           = 0x82C2,
    GL_IMAGE_CLASS_10_10_10_2         = 0x82C3,
    GL_VIEW_CLASS_128_BITS            = 0x82C4,
    GL_VIEW_CLASS_96_BITS             = 0x82C5,
    GL_VIEW_CLASS_64_BITS             = 0x82C6,
    GL_VIEW_CLASS_48_BITS             = 0x82C7,
    GL_VIEW_CLASS_32_BITS             = 0x82C8,
    GL_VIEW_CLASS_24_BITS             = 0x82C9,
    GL_VIEW_CLASS_16_BITS             = 0x82CA,
    GL_VIEW_CLASS_8_BITS              = 0x82CB,
    GL_VIEW_CLASS_S3TC_DXT1_RGB       = 0x82CC,
    GL_VIEW_CLASS_S3TC_DXT1_RGBA      = 0x82CD,
    GL_VIEW_CLASS_S3TC_DXT3_RGBA      = 0x82CE,
    GL_VIEW_CLASS_S3TC_DXT5_RGBA      = 0x82CF,
    GL_VIEW_CLASS_RGTC1_RED           = 0x82D0,
    GL_VIEW_CLASS_RGTC2_RG            = 0x82D1,
    GL_VIEW_CLASS_BPTC_UNORM          = 0x82D2,
    GL_VIEW_CLASS_BPTC_FLOAT          = 0x82D3,
    GL_UNIFORM                        = 0x92E1,
    GL_UNIFORM_BLOCK                  = 0x92E2,
    GL_PROGRAM_INPUT                  = 0x92E3,
    GL_PROGRAM_OUTPUT                 = 0x92E4,
    GL_BUFFER_VARIABLE                = 0x92E5,
    GL_SHADER_STORAGE_BLOCK           = 0x92E6,
    GL_VERTEX_SUBROUTINE              = 0x92E8,
    GL_TESS_CONTROL_SUBROUTINE        = 0x92E9,
    GL_TESS_EVALUATION_SUBROUTINE     = 0x92EA,
    GL_GEOMETRY_SUBROUTINE            = 0x92EB,
    GL_FRAGMENT_SUBROUTINE            = 0x92EC,
    GL_COMPUTE_SUBROUTINE             = 0x92ED,
    GL_VERTEX_SUBROUTINE_UNIFORM      = 0x92EE,
    GL_TESS_CONTROL_SUBROUTINE_UNIFORM = 0x92EF,
    GL_TESS_EVALUATION_SUBROUTINE_UNIFORM = 0x92F0,
    GL_GEOMETRY_SUBROUTINE_UNIFORM    = 0x92F1,
    GL_FRAGMENT_SUBROUTINE_UNIFORM    = 0x92F2,
    GL_COMPUTE_SUBROUTINE_UNIFORM     = 0x92F3,
    GL_TRANSFORM_FEEDBACK_VARYING     = 0x92F4,
    GL_ACTIVE_RESOURCES               = 0x92F5,
    GL_MAX_NAME_LENGTH                = 0x92F6,
    GL_MAX_NUM_ACTIVE_VARIABLES       = 0x92F7,
    GL_MAX_NUM_COMPATIBLE_SUBROUTINES = 0x92F8,
    GL_NAME_LENGTH                    = 0x92F9,
    GL_TYPE                           = 0x92FA,
    GL_ARRAY_SIZE                     = 0x92FB,
    GL_OFFSET                         = 0x92FC,
    GL_BLOCK_INDEX                    = 0x92FD,
    GL_ARRAY_STRIDE                   = 0x92FE,
    GL_MATRIX_STRIDE                  = 0x92FF,
    GL_IS_ROW_MAJOR                   = 0x9300,
    GL_ATOMIC_COUNTER_BUFFER_INDEX    = 0x9301,
    GL_BUFFER_BINDING                 = 0x9302,
    GL_BUFFER_DATA_SIZE               = 0x9303,
    GL_NUM_ACTIVE_VARIABLES           = 0x9304,
    GL_ACTIVE_VARIABLES               = 0x9305,
    GL_REFERENCED_BY_VERTEX_SHADER    = 0x9306,
    GL_REFERENCED_BY_TESS_CONTROL_SHADER = 0x9307,
    GL_REFERENCED_BY_TESS_EVALUATION_SHADER = 0x9308,
    GL_REFERENCED_BY_GEOMETRY_SHADER  = 0x9309,
    GL_REFERENCED_BY_FRAGMENT_SHADER  = 0x930A,
    GL_REFERENCED_BY_COMPUTE_SHADER   = 0x930B,
    GL_TOP_LEVEL_ARRAY_SIZE           = 0x930C,
    GL_TOP_LEVEL_ARRAY_STRIDE         = 0x930D,
    GL_LOCATION                       = 0x930E,
    GL_LOCATION_INDEX                 = 0x930F,
    GL_IS_PER_PATCH                   = 0x92E7,
    GL_SHADER_STORAGE_BUFFER          = 0x90D2,
    GL_SHADER_STORAGE_BUFFER_BINDING  = 0x90D3,
    GL_SHADER_STORAGE_BUFFER_START    = 0x90D4,
    GL_SHADER_STORAGE_BUFFER_SIZE     = 0x90D5,
    GL_MAX_VERTEX_SHADER_STORAGE_BLOCKS = 0x90D6,
    GL_MAX_GEOMETRY_SHADER_STORAGE_BLOCKS = 0x90D7,
    GL_MAX_TESS_CONTROL_SHADER_STORAGE_BLOCKS = 0x90D8,
    GL_MAX_TESS_EVALUATION_SHADER_STORAGE_BLOCKS = 0x90D9,
    GL_MAX_FRAGMENT_SHADER_STORAGE_BLOCKS = 0x90DA,
    GL_MAX_COMPUTE_SHADER_STORAGE_BLOCKS = 0x90DB,
    GL_MAX_COMBINED_SHADER_STORAGE_BLOCKS = 0x90DC,
    GL_MAX_SHADER_STORAGE_BUFFER_BINDINGS = 0x90DD,
    GL_MAX_SHADER_STORAGE_BLOCK_SIZE  = 0x90DE,
    GL_SHADER_STORAGE_BUFFER_OFFSET_ALIGNMENT = 0x90DF,
    GL_SHADER_STORAGE_BARRIER_BIT     = 0x00002000,
    GL_MAX_COMBINED_SHADER_OUTPUT_RESOURCES = 0x8F39,
    GL_DEPTH_STENCIL_TEXTURE_MODE     = 0x90EA,
    GL_TEXTURE_BUFFER_OFFSET          = 0x919D,
    GL_TEXTURE_BUFFER_SIZE            = 0x919E,
    GL_TEXTURE_BUFFER_OFFSET_ALIGNMENT = 0x919F,
    GL_TEXTURE_VIEW_MIN_LEVEL         = 0x82DB,
    GL_TEXTURE_VIEW_NUM_LEVELS        = 0x82DC,
    GL_TEXTURE_VIEW_MIN_LAYER         = 0x82DD,
    GL_TEXTURE_VIEW_NUM_LAYERS        = 0x82DE,
    GL_TEXTURE_IMMUTABLE_LEVELS       = 0x82DF,
    GL_VERTEX_ATTRIB_BINDING          = 0x82D4,
    GL_VERTEX_ATTRIB_RELATIVE_OFFSET  = 0x82D5,
    GL_VERTEX_BINDING_DIVISOR         = 0x82D6,
    GL_VERTEX_BINDING_OFFSET          = 0x82D7,
    GL_VERTEX_BINDING_STRIDE          = 0x82D8,
    GL_MAX_VERTEX_ATTRIB_RELATIVE_OFFSET = 0x82D9,
    GL_MAX_VERTEX_ATTRIB_BINDINGS     = 0x82DA,
    GL_VERTEX_BINDING_BUFFER          = 0x8F4F
};
typedef void (* PFNGLCLEARBUFFERDATAPROC) (GLenum target, GLenum internalformat, GLenum format, GLenum type, const void *data);
typedef void (* PFNGLCLEARBUFFERSUBDATAPROC) (GLenum target, GLenum internalformat, GLintptr offset, GLsizeiptr size, GLenum format, GLenum type, const void *data);
typedef void (* PFNGLDISPATCHCOMPUTEPROC) (GLuint num_groups_x, GLuint num_groups_y, GLuint num_groups_z);
typedef void (* PFNGLDISPATCHCOMPUTEINDIRECTPROC) (GLintptr indirect);
typedef void (* PFNGLCOPYIMAGESUBDATAPROC) (GLuint srcName, GLenum srcTarget, GLint srcLevel, GLint srcX, GLint srcY, GLint srcZ, GLuint dstName, GLenum dstTarget, GLint dstLevel, GLint dstX, GLint dstY, GLint dstZ, GLsizei srcWidth, GLsizei srcHeight, GLsizei srcDepth);
typedef void (* PFNGLFRAMEBUFFERPARAMETERIPROC) (GLenum target, GLenum pname, GLint param);
typedef void (* PFNGLGETFRAMEBUFFERPARAMETERIVPROC) (GLenum target, GLenum pname, GLint *params);
typedef void (* PFNGLGETINTERNALFORMATI64VPROC) (GLenum target, GLenum internalformat, GLenum pname, GLsizei count, GLint64 *params);
typedef void (* PFNGLINVALIDATETEXSUBIMAGEPROC) (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth);
typedef void (* PFNGLINVALIDATETEXIMAGEPROC) (GLuint texture, GLint level);
typedef void (* PFNGLINVALIDATEBUFFERSUBDATAPROC) (GLuint buffer, GLintptr offset, GLsizeiptr length);
typedef void (* PFNGLINVALIDATEBUFFERDATAPROC) (GLuint buffer);
typedef void (* PFNGLINVALIDATEFRAMEBUFFERPROC) (GLenum target, GLsizei numAttachments, const GLenum *attachments);
typedef void (* PFNGLINVALIDATESUBFRAMEBUFFERPROC) (GLenum target, GLsizei numAttachments, const GLenum *attachments, GLint x, GLint y, GLsizei width, GLsizei height);
typedef void (* PFNGLMULTIDRAWARRAYSINDIRECTPROC) (GLenum mode, const void *indirect, GLsizei drawcount, GLsizei stride);
typedef void (* PFNGLMULTIDRAWELEMENTSINDIRECTPROC) (GLenum mode, GLenum type, const void *indirect, GLsizei drawcount, GLsizei stride);
typedef void (* PFNGLGETPROGRAMINTERFACEIVPROC) (GLuint program, GLenum programInterface, GLenum pname, GLint *params);
typedef GLuint (* PFNGLGETPROGRAMRESOURCEINDEXPROC) (GLuint program, GLenum programInterface, const GLchar *name);
typedef void (* PFNGLGETPROGRAMRESOURCENAMEPROC) (GLuint program, GLenum programInterface, GLuint index, GLsizei bufSize, GLsizei *length, GLchar *name);
typedef void (* PFNGLGETPROGRAMRESOURCEIVPROC) (GLuint program, GLenum programInterface, GLuint index, GLsizei propCount, const GLenum *props, GLsizei count, GLsizei *length, GLint *params);
typedef GLint (* PFNGLGETPROGRAMRESOURCELOCATIONPROC) (GLuint program, GLenum programInterface, const GLchar *name);
typedef GLint (* PFNGLGETPROGRAMRESOURCELOCATIONINDEXPROC) (GLuint program, GLenum programInterface, const GLchar *name);
typedef void (* PFNGLSHADERSTORAGEBLOCKBINDINGPROC) (GLuint program, GLuint storageBlockIndex, GLuint storageBlockBinding);
typedef void (* PFNGLTEXBUFFERRANGEPROC) (GLenum target, GLenum internalformat, GLuint buffer, GLintptr offset, GLsizeiptr size);
typedef void (* PFNGLTEXSTORAGE2DMULTISAMPLEPROC) (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations);
typedef void (* PFNGLTEXSTORAGE3DMULTISAMPLEPROC) (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations);
typedef void (* PFNGLTEXTUREVIEWPROC) (GLuint texture, GLenum target, GLuint origtexture, GLenum internalformat, GLuint minlevel, GLuint numlevels, GLuint minlayer, GLuint numlayers);
typedef void (* PFNGLBINDVERTEXBUFFERPROC) (GLuint bindingindex, GLuint buffer, GLintptr offset, GLsizei stride);
typedef void (* PFNGLVERTEXATTRIBFORMATPROC) (GLuint attribindex, GLint size, GLenum type, GLboolean normalized, GLuint relativeoffset);
typedef void (* PFNGLVERTEXATTRIBIFORMATPROC) (GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset);
typedef void (* PFNGLVERTEXATTRIBLFORMATPROC) (GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset);
typedef void (* PFNGLVERTEXATTRIBBINDINGPROC) (GLuint attribindex, GLuint bindingindex);
typedef void (* PFNGLVERTEXBINDINGDIVISORPROC) (GLuint bindingindex, GLuint divisor);
typedef void (* PFNGLDEBUGMESSAGECONTROLPROC) (GLenum source, GLenum type, GLenum severity, GLsizei count, const GLuint *ids, GLboolean enabled);
typedef void (* PFNGLDEBUGMESSAGEINSERTPROC) (GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, const GLchar *buf);
typedef void (* PFNGLDEBUGMESSAGECALLBACKPROC) (GLDEBUGPROC callback, const void *userParam);
typedef GLuint (* PFNGLGETDEBUGMESSAGELOGPROC) (GLuint count, GLsizei bufSize, GLenum *sources, GLenum *types, GLuint *ids, GLenum *severities, GLsizei *lengths, GLchar *messageLog);
typedef void (* PFNGLPUSHDEBUGGROUPPROC) (GLenum source, GLuint id, GLsizei length, const GLchar *message);
typedef void (* PFNGLPOPDEBUGGROUPPROC) (void);
typedef void (* PFNGLOBJECTLABELPROC) (GLenum identifier, GLuint name, GLsizei length, const GLchar *label);
typedef void (* PFNGLGETOBJECTLABELPROC) (GLenum identifier, GLuint name, GLsizei bufSize, GLsizei *length, GLchar *label);
typedef void (* PFNGLOBJECTPTRLABELPROC) (const void *ptr, GLsizei length, const GLchar *label);
typedef void (* PFNGLGETOBJECTPTRLABELPROC) (const void *ptr, GLsizei bufSize, GLsizei *length, GLchar *label);

void glClearBufferData (GLenum target, GLenum internalformat, GLenum format, GLenum type, const void *data);
void glClearBufferSubData (GLenum target, GLenum internalformat, GLintptr offset, GLsizeiptr size, GLenum format, GLenum type, const void *data);
void glDispatchCompute (GLuint num_groups_x, GLuint num_groups_y, GLuint num_groups_z);
void glDispatchComputeIndirect (GLintptr indirect);
void glCopyImageSubData (GLuint srcName, GLenum srcTarget, GLint srcLevel, GLint srcX, GLint srcY, GLint srcZ, GLuint dstName, GLenum dstTarget, GLint dstLevel, GLint dstX, GLint dstY, GLint dstZ, GLsizei srcWidth, GLsizei srcHeight, GLsizei srcDepth);
void glFramebufferParameteri (GLenum target, GLenum pname, GLint param);
void glGetFramebufferParameteriv (GLenum target, GLenum pname, GLint *params);
void glGetInternalformati64v (GLenum target, GLenum internalformat, GLenum pname, GLsizei count, GLint64 *params);
void glInvalidateTexSubImage (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth);
void glInvalidateTexImage (GLuint texture, GLint level);
void glInvalidateBufferSubData (GLuint buffer, GLintptr offset, GLsizeiptr length);
void glInvalidateBufferData (GLuint buffer);
void glInvalidateFramebuffer (GLenum target, GLsizei numAttachments, const GLenum *attachments);
void glInvalidateSubFramebuffer (GLenum target, GLsizei numAttachments, const GLenum *attachments, GLint x, GLint y, GLsizei width, GLsizei height);
void glMultiDrawArraysIndirect (GLenum mode, const void *indirect, GLsizei drawcount, GLsizei stride);
void glMultiDrawElementsIndirect (GLenum mode, GLenum type, const void *indirect, GLsizei drawcount, GLsizei stride);
void glGetProgramInterfaceiv (GLuint program, GLenum programInterface, GLenum pname, GLint *params);
GLuint glGetProgramResourceIndex (GLuint program, GLenum programInterface, const GLchar *name);
void glGetProgramResourceName (GLuint program, GLenum programInterface, GLuint index, GLsizei bufSize, GLsizei *length, GLchar *name);
void glGetProgramResourceiv (GLuint program, GLenum programInterface, GLuint index, GLsizei propCount, const GLenum *props, GLsizei count, GLsizei *length, GLint *params);
GLint glGetProgramResourceLocation (GLuint program, GLenum programInterface, const GLchar *name);
GLint glGetProgramResourceLocationIndex (GLuint program, GLenum programInterface, const GLchar *name);
void glShaderStorageBlockBinding (GLuint program, GLuint storageBlockIndex, GLuint storageBlockBinding);
void glTexBufferRange (GLenum target, GLenum internalformat, GLuint buffer, GLintptr offset, GLsizeiptr size);
void glTexStorage2DMultisample (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations);
void glTexStorage3DMultisample (GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations);
void glTextureView (GLuint texture, GLenum target, GLuint origtexture, GLenum internalformat, GLuint minlevel, GLuint numlevels, GLuint minlayer, GLuint numlayers);
void glBindVertexBuffer (GLuint bindingindex, GLuint buffer, GLintptr offset, GLsizei stride);
void glVertexAttribFormat (GLuint attribindex, GLint size, GLenum type, GLboolean normalized, GLuint relativeoffset);
void glVertexAttribIFormat (GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset);
void glVertexAttribLFormat (GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset);
void glVertexAttribBinding (GLuint attribindex, GLuint bindingindex);
void glVertexBindingDivisor (GLuint bindingindex, GLuint divisor);
void glDebugMessageControl (GLenum source, GLenum type, GLenum severity, GLsizei count, const GLuint *ids, GLboolean enabled);
void glDebugMessageInsert (GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, const GLchar *buf);
void glDebugMessageCallback (GLDEBUGPROC callback, const void *userParam);
GLuint glGetDebugMessageLog (GLuint count, GLsizei bufSize, GLenum *sources, GLenum *types, GLuint *ids, GLenum *severities, GLsizei *lengths, GLchar *messageLog);
void glPushDebugGroup (GLenum source, GLuint id, GLsizei length, const GLchar *message);
void glPopDebugGroup (void);
void glObjectLabel (GLenum identifier, GLuint name, GLsizei length, const GLchar *label);
void glGetObjectLabel (GLenum identifier, GLuint name, GLsizei bufSize, GLsizei *length, GLchar *label);
void glObjectPtrLabel (const void *ptr, GLsizei length, const GLchar *label);
void glGetObjectPtrLabel (const void *ptr, GLsizei bufSize, GLsizei *length, GLchar *label);

enum { GL_VERSION_4_4 = 1 };
enum {
    GL_MAX_VERTEX_ATTRIB_STRIDE       = 0x82E5,
    GL_PRIMITIVE_RESTART_FOR_PATCHES_SUPPORTED = 0x8221,
    GL_TEXTURE_BUFFER_BINDING         = 0x8C2A,
    GL_MAP_PERSISTENT_BIT             = 0x0040,
    GL_MAP_COHERENT_BIT               = 0x0080,
    GL_DYNAMIC_STORAGE_BIT            = 0x0100,
    GL_CLIENT_STORAGE_BIT             = 0x0200,
    GL_CLIENT_MAPPED_BUFFER_BARRIER_BIT = 0x00004000,
    GL_BUFFER_IMMUTABLE_STORAGE       = 0x821F,
    GL_BUFFER_STORAGE_FLAGS           = 0x8220,
    GL_CLEAR_TEXTURE                  = 0x9365,
    GL_LOCATION_COMPONENT             = 0x934A,
    GL_TRANSFORM_FEEDBACK_BUFFER_INDEX = 0x934B,
    GL_TRANSFORM_FEEDBACK_BUFFER_STRIDE = 0x934C,
    GL_QUERY_BUFFER                   = 0x9192,
    GL_QUERY_BUFFER_BARRIER_BIT       = 0x00008000,
    GL_QUERY_BUFFER_BINDING           = 0x9193,
    GL_QUERY_RESULT_NO_WAIT           = 0x9194,
    GL_MIRROR_CLAMP_TO_EDGE           = 0x8743
};
typedef void (* PFNGLBUFFERSTORAGEPROC) (GLenum target, GLsizeiptr size, const void *data, GLbitfield flags);
typedef void (* PFNGLCLEARTEXIMAGEPROC) (GLuint texture, GLint level, GLenum format, GLenum type, const void *data);
typedef void (* PFNGLCLEARTEXSUBIMAGEPROC) (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *data);
typedef void (* PFNGLBINDBUFFERSBASEPROC) (GLenum target, GLuint first, GLsizei count, const GLuint *buffers);
typedef void (* PFNGLBINDBUFFERSRANGEPROC) (GLenum target, GLuint first, GLsizei count, const GLuint *buffers, const GLintptr *offsets, const GLsizeiptr *sizes);
typedef void (* PFNGLBINDTEXTURESPROC) (GLuint first, GLsizei count, const GLuint *textures);
typedef void (* PFNGLBINDSAMPLERSPROC) (GLuint first, GLsizei count, const GLuint *samplers);
typedef void (* PFNGLBINDIMAGETEXTURESPROC) (GLuint first, GLsizei count, const GLuint *textures);
typedef void (* PFNGLBINDVERTEXBUFFERSPROC) (GLuint first, GLsizei count, const GLuint *buffers, const GLintptr *offsets, const GLsizei *strides);

void glBufferStorage (GLenum target, GLsizeiptr size, const void *data, GLbitfield flags);
void glClearTexImage (GLuint texture, GLint level, GLenum format, GLenum type, const void *data);
void glClearTexSubImage (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *data);
void glBindBuffersBase (GLenum target, GLuint first, GLsizei count, const GLuint *buffers);
void glBindBuffersRange (GLenum target, GLuint first, GLsizei count, const GLuint *buffers, const GLintptr *offsets, const GLsizeiptr *sizes);
void glBindTextures (GLuint first, GLsizei count, const GLuint *textures);
void glBindSamplers (GLuint first, GLsizei count, const GLuint *samplers);
void glBindImageTextures (GLuint first, GLsizei count, const GLuint *textures);
void glBindVertexBuffers (GLuint first, GLsizei count, const GLuint *buffers, const GLintptr *offsets, const GLsizei *strides);

enum { GL_VERSION_4_5 = 1 };
enum {
    GL_CONTEXT_LOST                   = 0x0507,
    GL_NEGATIVE_ONE_TO_ONE            = 0x935E,
    GL_ZERO_TO_ONE                    = 0x935F,
    GL_CLIP_ORIGIN                    = 0x935C,
    GL_CLIP_DEPTH_MODE                = 0x935D,
    GL_QUERY_WAIT_INVERTED            = 0x8E17,
    GL_QUERY_NO_WAIT_INVERTED         = 0x8E18,
    GL_QUERY_BY_REGION_WAIT_INVERTED  = 0x8E19,
    GL_QUERY_BY_REGION_NO_WAIT_INVERTED = 0x8E1A,
    GL_MAX_CULL_DISTANCES             = 0x82F9,
    GL_MAX_COMBINED_CLIP_AND_CULL_DISTANCES = 0x82FA,
    GL_TEXTURE_TARGET                 = 0x1006,
    GL_QUERY_TARGET                   = 0x82EA,
    GL_GUILTY_CONTEXT_RESET           = 0x8253,
    GL_INNOCENT_CONTEXT_RESET         = 0x8254,
    GL_UNKNOWN_CONTEXT_RESET          = 0x8255,
    GL_RESET_NOTIFICATION_STRATEGY    = 0x8256,
    GL_LOSE_CONTEXT_ON_RESET          = 0x8252,
    GL_NO_RESET_NOTIFICATION          = 0x8261,
    GL_CONTEXT_FLAG_ROBUST_ACCESS_BIT = 0x00000004,
    GL_CONTEXT_RELEASE_BEHAVIOR       = 0x82FB,
    GL_CONTEXT_RELEASE_BEHAVIOR_FLUSH = 0x82FC
};
typedef void (* PFNGLCLIPCONTROLPROC) (GLenum origin, GLenum depth);
typedef void (* PFNGLCREATETRANSFORMFEEDBACKSPROC) (GLsizei n, GLuint *ids);
typedef void (* PFNGLTRANSFORMFEEDBACKBUFFERBASEPROC) (GLuint xfb, GLuint index, GLuint buffer);
typedef void (* PFNGLTRANSFORMFEEDBACKBUFFERRANGEPROC) (GLuint xfb, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size);
typedef void (* PFNGLGETTRANSFORMFEEDBACKIVPROC) (GLuint xfb, GLenum pname, GLint *param);
typedef void (* PFNGLGETTRANSFORMFEEDBACKI_VPROC) (GLuint xfb, GLenum pname, GLuint index, GLint *param);
typedef void (* PFNGLGETTRANSFORMFEEDBACKI64_VPROC) (GLuint xfb, GLenum pname, GLuint index, GLint64 *param);
typedef void (* PFNGLCREATEBUFFERSPROC) (GLsizei n, GLuint *buffers);
typedef void (* PFNGLNAMEDBUFFERSTORAGEPROC) (GLuint buffer, GLsizeiptr size, const void *data, GLbitfield flags);
typedef void (* PFNGLNAMEDBUFFERDATAPROC) (GLuint buffer, GLsizeiptr size, const void *data, GLenum usage);
typedef void (* PFNGLNAMEDBUFFERSUBDATAPROC) (GLuint buffer, GLintptr offset, GLsizeiptr size, const void *data);
typedef void (* PFNGLCOPYNAMEDBUFFERSUBDATAPROC) (GLuint readBuffer, GLuint writeBuffer, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size);
typedef void (* PFNGLCLEARNAMEDBUFFERDATAPROC) (GLuint buffer, GLenum internalformat, GLenum format, GLenum type, const void *data);
typedef void (* PFNGLCLEARNAMEDBUFFERSUBDATAPROC) (GLuint buffer, GLenum internalformat, GLintptr offset, GLsizeiptr size, GLenum format, GLenum type, const void *data);
typedef void *(* PFNGLMAPNAMEDBUFFERPROC) (GLuint buffer, GLenum access);
typedef void *(* PFNGLMAPNAMEDBUFFERRANGEPROC) (GLuint buffer, GLintptr offset, GLsizeiptr length, GLbitfield access);
typedef GLboolean (* PFNGLUNMAPNAMEDBUFFERPROC) (GLuint buffer);
typedef void (* PFNGLFLUSHMAPPEDNAMEDBUFFERRANGEPROC) (GLuint buffer, GLintptr offset, GLsizeiptr length);
typedef void (* PFNGLGETNAMEDBUFFERPARAMETERIVPROC) (GLuint buffer, GLenum pname, GLint *params);
typedef void (* PFNGLGETNAMEDBUFFERPARAMETERI64VPROC) (GLuint buffer, GLenum pname, GLint64 *params);
typedef void (* PFNGLGETNAMEDBUFFERPOINTERVPROC) (GLuint buffer, GLenum pname, void **params);
typedef void (* PFNGLGETNAMEDBUFFERSUBDATAPROC) (GLuint buffer, GLintptr offset, GLsizeiptr size, void *data);
typedef void (* PFNGLCREATEFRAMEBUFFERSPROC) (GLsizei n, GLuint *framebuffers);
typedef void (* PFNGLNAMEDFRAMEBUFFERRENDERBUFFERPROC) (GLuint framebuffer, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer);
typedef void (* PFNGLNAMEDFRAMEBUFFERPARAMETERIPROC) (GLuint framebuffer, GLenum pname, GLint param);
typedef void (* PFNGLNAMEDFRAMEBUFFERTEXTUREPROC) (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level);
typedef void (* PFNGLNAMEDFRAMEBUFFERTEXTURELAYERPROC) (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level, GLint layer);
typedef void (* PFNGLNAMEDFRAMEBUFFERDRAWBUFFERPROC) (GLuint framebuffer, GLenum buf);
typedef void (* PFNGLNAMEDFRAMEBUFFERDRAWBUFFERSPROC) (GLuint framebuffer, GLsizei n, const GLenum *bufs);
typedef void (* PFNGLNAMEDFRAMEBUFFERREADBUFFERPROC) (GLuint framebuffer, GLenum src);
typedef void (* PFNGLINVALIDATENAMEDFRAMEBUFFERDATAPROC) (GLuint framebuffer, GLsizei numAttachments, const GLenum *attachments);
typedef void (* PFNGLINVALIDATENAMEDFRAMEBUFFERSUBDATAPROC) (GLuint framebuffer, GLsizei numAttachments, const GLenum *attachments, GLint x, GLint y, GLsizei width, GLsizei height);
typedef void (* PFNGLCLEARNAMEDFRAMEBUFFERIVPROC) (GLuint framebuffer, GLenum buffer, GLint drawbuffer, const GLint *value);
typedef void (* PFNGLCLEARNAMEDFRAMEBUFFERUIVPROC) (GLuint framebuffer, GLenum buffer, GLint drawbuffer, const GLuint *value);
typedef void (* PFNGLCLEARNAMEDFRAMEBUFFERFVPROC) (GLuint framebuffer, GLenum buffer, GLint drawbuffer, const GLfloat *value);
typedef void (* PFNGLCLEARNAMEDFRAMEBUFFERFIPROC) (GLuint framebuffer, GLenum buffer, GLint drawbuffer, GLfloat depth, GLint stencil);
typedef void (* PFNGLBLITNAMEDFRAMEBUFFERPROC) (GLuint readFramebuffer, GLuint drawFramebuffer, GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter);
typedef GLenum (* PFNGLCHECKNAMEDFRAMEBUFFERSTATUSPROC) (GLuint framebuffer, GLenum target);
typedef void (* PFNGLGETNAMEDFRAMEBUFFERPARAMETERIVPROC) (GLuint framebuffer, GLenum pname, GLint *param);
typedef void (* PFNGLGETNAMEDFRAMEBUFFERATTACHMENTPARAMETERIVPROC) (GLuint framebuffer, GLenum attachment, GLenum pname, GLint *params);
typedef void (* PFNGLCREATERENDERBUFFERSPROC) (GLsizei n, GLuint *renderbuffers);
typedef void (* PFNGLNAMEDRENDERBUFFERSTORAGEPROC) (GLuint renderbuffer, GLenum internalformat, GLsizei width, GLsizei height);
typedef void (* PFNGLNAMEDRENDERBUFFERSTORAGEMULTISAMPLEPROC) (GLuint renderbuffer, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
typedef void (* PFNGLGETNAMEDRENDERBUFFERPARAMETERIVPROC) (GLuint renderbuffer, GLenum pname, GLint *params);
typedef void (* PFNGLCREATETEXTURESPROC) (GLenum target, GLsizei n, GLuint *textures);
typedef void (* PFNGLTEXTUREBUFFERPROC) (GLuint texture, GLenum internalformat, GLuint buffer);
typedef void (* PFNGLTEXTUREBUFFERRANGEPROC) (GLuint texture, GLenum internalformat, GLuint buffer, GLintptr offset, GLsizeiptr size);
typedef void (* PFNGLTEXTURESTORAGE1DPROC) (GLuint texture, GLsizei levels, GLenum internalformat, GLsizei width);
typedef void (* PFNGLTEXTURESTORAGE2DPROC) (GLuint texture, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
typedef void (* PFNGLTEXTURESTORAGE3DPROC) (GLuint texture, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
typedef void (* PFNGLTEXTURESTORAGE2DMULTISAMPLEPROC) (GLuint texture, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations);
typedef void (* PFNGLTEXTURESTORAGE3DMULTISAMPLEPROC) (GLuint texture, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations);
typedef void (* PFNGLTEXTURESUBIMAGE1DPROC) (GLuint texture, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const void *pixels);
typedef void (* PFNGLTEXTURESUBIMAGE2DPROC) (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *pixels);
typedef void (* PFNGLTEXTURESUBIMAGE3DPROC) (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *pixels);
typedef void (* PFNGLCOMPRESSEDTEXTURESUBIMAGE1DPROC) (GLuint texture, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const void *data);
typedef void (* PFNGLCOMPRESSEDTEXTURESUBIMAGE2DPROC) (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *data);
typedef void (* PFNGLCOMPRESSEDTEXTURESUBIMAGE3DPROC) (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *data);
typedef void (* PFNGLCOPYTEXTURESUBIMAGE1DPROC) (GLuint texture, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width);
typedef void (* PFNGLCOPYTEXTURESUBIMAGE2DPROC) (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
typedef void (* PFNGLCOPYTEXTURESUBIMAGE3DPROC) (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
typedef void (* PFNGLTEXTUREPARAMETERFPROC) (GLuint texture, GLenum pname, GLfloat param);
typedef void (* PFNGLTEXTUREPARAMETERFVPROC) (GLuint texture, GLenum pname, const GLfloat *param);
typedef void (* PFNGLTEXTUREPARAMETERIPROC) (GLuint texture, GLenum pname, GLint param);
typedef void (* PFNGLTEXTUREPARAMETERIIVPROC) (GLuint texture, GLenum pname, const GLint *params);
typedef void (* PFNGLTEXTUREPARAMETERIUIVPROC) (GLuint texture, GLenum pname, const GLuint *params);
typedef void (* PFNGLTEXTUREPARAMETERIVPROC) (GLuint texture, GLenum pname, const GLint *param);
typedef void (* PFNGLGENERATETEXTUREMIPMAPPROC) (GLuint texture);
typedef void (* PFNGLBINDTEXTUREUNITPROC) (GLuint unit, GLuint texture);
typedef void (* PFNGLGETTEXTUREIMAGEPROC) (GLuint texture, GLint level, GLenum format, GLenum type, GLsizei bufSize, void *pixels);
typedef void (* PFNGLGETCOMPRESSEDTEXTUREIMAGEPROC) (GLuint texture, GLint level, GLsizei bufSize, void *pixels);
typedef void (* PFNGLGETTEXTURELEVELPARAMETERFVPROC) (GLuint texture, GLint level, GLenum pname, GLfloat *params);
typedef void (* PFNGLGETTEXTURELEVELPARAMETERIVPROC) (GLuint texture, GLint level, GLenum pname, GLint *params);
typedef void (* PFNGLGETTEXTUREPARAMETERFVPROC) (GLuint texture, GLenum pname, GLfloat *params);
typedef void (* PFNGLGETTEXTUREPARAMETERIIVPROC) (GLuint texture, GLenum pname, GLint *params);
typedef void (* PFNGLGETTEXTUREPARAMETERIUIVPROC) (GLuint texture, GLenum pname, GLuint *params);
typedef void (* PFNGLGETTEXTUREPARAMETERIVPROC) (GLuint texture, GLenum pname, GLint *params);
typedef void (* PFNGLCREATEVERTEXARRAYSPROC) (GLsizei n, GLuint *arrays);
typedef void (* PFNGLDISABLEVERTEXARRAYATTRIBPROC) (GLuint vaobj, GLuint index);
typedef void (* PFNGLENABLEVERTEXARRAYATTRIBPROC) (GLuint vaobj, GLuint index);
typedef void (* PFNGLVERTEXARRAYELEMENTBUFFERPROC) (GLuint vaobj, GLuint buffer);
typedef void (* PFNGLVERTEXARRAYVERTEXBUFFERPROC) (GLuint vaobj, GLuint bindingindex, GLuint buffer, GLintptr offset, GLsizei stride);
typedef void (* PFNGLVERTEXARRAYVERTEXBUFFERSPROC) (GLuint vaobj, GLuint first, GLsizei count, const GLuint *buffers, const GLintptr *offsets, const GLsizei *strides);
typedef void (* PFNGLVERTEXARRAYATTRIBBINDINGPROC) (GLuint vaobj, GLuint attribindex, GLuint bindingindex);
typedef void (* PFNGLVERTEXARRAYATTRIBFORMATPROC) (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLboolean normalized, GLuint relativeoffset);
typedef void (* PFNGLVERTEXARRAYATTRIBIFORMATPROC) (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset);
typedef void (* PFNGLVERTEXARRAYATTRIBLFORMATPROC) (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset);
typedef void (* PFNGLVERTEXARRAYBINDINGDIVISORPROC) (GLuint vaobj, GLuint bindingindex, GLuint divisor);
typedef void (* PFNGLGETVERTEXARRAYIVPROC) (GLuint vaobj, GLenum pname, GLint *param);
typedef void (* PFNGLGETVERTEXARRAYINDEXEDIVPROC) (GLuint vaobj, GLuint index, GLenum pname, GLint *param);
typedef void (* PFNGLGETVERTEXARRAYINDEXED64IVPROC) (GLuint vaobj, GLuint index, GLenum pname, GLint64 *param);
typedef void (* PFNGLCREATESAMPLERSPROC) (GLsizei n, GLuint *samplers);
typedef void (* PFNGLCREATEPROGRAMPIPELINESPROC) (GLsizei n, GLuint *pipelines);
typedef void (* PFNGLCREATEQUERIESPROC) (GLenum target, GLsizei n, GLuint *ids);
typedef void (* PFNGLGETQUERYBUFFEROBJECTI64VPROC) (GLuint id, GLuint buffer, GLenum pname, GLintptr offset);
typedef void (* PFNGLGETQUERYBUFFEROBJECTIVPROC) (GLuint id, GLuint buffer, GLenum pname, GLintptr offset);
typedef void (* PFNGLGETQUERYBUFFEROBJECTUI64VPROC) (GLuint id, GLuint buffer, GLenum pname, GLintptr offset);
typedef void (* PFNGLGETQUERYBUFFEROBJECTUIVPROC) (GLuint id, GLuint buffer, GLenum pname, GLintptr offset);
typedef void (* PFNGLMEMORYBARRIERBYREGIONPROC) (GLbitfield barriers);
typedef void (* PFNGLGETTEXTURESUBIMAGEPROC) (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, GLsizei bufSize, void *pixels);
typedef void (* PFNGLGETCOMPRESSEDTEXTURESUBIMAGEPROC) (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLsizei bufSize, void *pixels);
typedef GLenum (* PFNGLGETGRAPHICSRESETSTATUSPROC) (void);
typedef void (* PFNGLGETNCOMPRESSEDTEXIMAGEPROC) (GLenum target, GLint lod, GLsizei bufSize, void *pixels);
typedef void (* PFNGLGETNTEXIMAGEPROC) (GLenum target, GLint level, GLenum format, GLenum type, GLsizei bufSize, void *pixels);
typedef void (* PFNGLGETNUNIFORMDVPROC) (GLuint program, GLint location, GLsizei bufSize, GLdouble *params);
typedef void (* PFNGLGETNUNIFORMFVPROC) (GLuint program, GLint location, GLsizei bufSize, GLfloat *params);
typedef void (* PFNGLGETNUNIFORMIVPROC) (GLuint program, GLint location, GLsizei bufSize, GLint *params);
typedef void (* PFNGLGETNUNIFORMUIVPROC) (GLuint program, GLint location, GLsizei bufSize, GLuint *params);
typedef void (* PFNGLREADNPIXELSPROC) (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLsizei bufSize, void *data);
typedef void (* PFNGLTEXTUREBARRIERPROC) (void);

void glClipControl (GLenum origin, GLenum depth);
void glCreateTransformFeedbacks (GLsizei n, GLuint *ids);
void glTransformFeedbackBufferBase (GLuint xfb, GLuint index, GLuint buffer);
void glTransformFeedbackBufferRange (GLuint xfb, GLuint index, GLuint buffer, GLintptr offset, GLsizeiptr size);
void glGetTransformFeedbackiv (GLuint xfb, GLenum pname, GLint *param);
void glGetTransformFeedbacki_v (GLuint xfb, GLenum pname, GLuint index, GLint *param);
void glGetTransformFeedbacki64_v (GLuint xfb, GLenum pname, GLuint index, GLint64 *param);
void glCreateBuffers (GLsizei n, GLuint *buffers);
void glNamedBufferStorage (GLuint buffer, GLsizeiptr size, const void *data, GLbitfield flags);
void glNamedBufferData (GLuint buffer, GLsizeiptr size, const void *data, GLenum usage);
void glNamedBufferSubData (GLuint buffer, GLintptr offset, GLsizeiptr size, const void *data);
void glCopyNamedBufferSubData (GLuint readBuffer, GLuint writeBuffer, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size);
void glClearNamedBufferData (GLuint buffer, GLenum internalformat, GLenum format, GLenum type, const void *data);
void glClearNamedBufferSubData (GLuint buffer, GLenum internalformat, GLintptr offset, GLsizeiptr size, GLenum format, GLenum type, const void *data);
void *glMapNamedBuffer (GLuint buffer, GLenum access);
void *glMapNamedBufferRange (GLuint buffer, GLintptr offset, GLsizeiptr length, GLbitfield access);
GLboolean glUnmapNamedBuffer (GLuint buffer);
void glFlushMappedNamedBufferRange (GLuint buffer, GLintptr offset, GLsizeiptr length);
void glGetNamedBufferParameteriv (GLuint buffer, GLenum pname, GLint *params);
void glGetNamedBufferParameteri64v (GLuint buffer, GLenum pname, GLint64 *params);
void glGetNamedBufferPointerv (GLuint buffer, GLenum pname, void **params);
void glGetNamedBufferSubData (GLuint buffer, GLintptr offset, GLsizeiptr size, void *data);
void glCreateFramebuffers (GLsizei n, GLuint *framebuffers);
void glNamedFramebufferRenderbuffer (GLuint framebuffer, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer);
void glNamedFramebufferParameteri (GLuint framebuffer, GLenum pname, GLint param);
void glNamedFramebufferTexture (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level);
void glNamedFramebufferTextureLayer (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level, GLint layer);
void glNamedFramebufferDrawBuffer (GLuint framebuffer, GLenum buf);
void glNamedFramebufferDrawBuffers (GLuint framebuffer, GLsizei n, const GLenum *bufs);
void glNamedFramebufferReadBuffer (GLuint framebuffer, GLenum src);
void glInvalidateNamedFramebufferData (GLuint framebuffer, GLsizei numAttachments, const GLenum *attachments);
void glInvalidateNamedFramebufferSubData (GLuint framebuffer, GLsizei numAttachments, const GLenum *attachments, GLint x, GLint y, GLsizei width, GLsizei height);
void glClearNamedFramebufferiv (GLuint framebuffer, GLenum buffer, GLint drawbuffer, const GLint *value);
void glClearNamedFramebufferuiv (GLuint framebuffer, GLenum buffer, GLint drawbuffer, const GLuint *value);
void glClearNamedFramebufferfv (GLuint framebuffer, GLenum buffer, GLint drawbuffer, const GLfloat *value);
void glClearNamedFramebufferfi (GLuint framebuffer, GLenum buffer, GLint drawbuffer, GLfloat depth, GLint stencil);
void glBlitNamedFramebuffer (GLuint readFramebuffer, GLuint drawFramebuffer, GLint srcX0, GLint srcY0, GLint srcX1, GLint srcY1, GLint dstX0, GLint dstY0, GLint dstX1, GLint dstY1, GLbitfield mask, GLenum filter);
GLenum glCheckNamedFramebufferStatus (GLuint framebuffer, GLenum target);
void glGetNamedFramebufferParameteriv (GLuint framebuffer, GLenum pname, GLint *param);
void glGetNamedFramebufferAttachmentParameteriv (GLuint framebuffer, GLenum attachment, GLenum pname, GLint *params);
void glCreateRenderbuffers (GLsizei n, GLuint *renderbuffers);
void glNamedRenderbufferStorage (GLuint renderbuffer, GLenum internalformat, GLsizei width, GLsizei height);
void glNamedRenderbufferStorageMultisample (GLuint renderbuffer, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
void glGetNamedRenderbufferParameteriv (GLuint renderbuffer, GLenum pname, GLint *params);
void glCreateTextures (GLenum target, GLsizei n, GLuint *textures);
void glTextureBuffer (GLuint texture, GLenum internalformat, GLuint buffer);
void glTextureBufferRange (GLuint texture, GLenum internalformat, GLuint buffer, GLintptr offset, GLsizeiptr size);
void glTextureStorage1D (GLuint texture, GLsizei levels, GLenum internalformat, GLsizei width);
void glTextureStorage2D (GLuint texture, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
void glTextureStorage3D (GLuint texture, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
void glTextureStorage2DMultisample (GLuint texture, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations);
void glTextureStorage3DMultisample (GLuint texture, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations);
void glTextureSubImage1D (GLuint texture, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const void *pixels);
void glTextureSubImage2D (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *pixels);
void glTextureSubImage3D (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *pixels);
void glCompressedTextureSubImage1D (GLuint texture, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const void *data);
void glCompressedTextureSubImage2D (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *data);
void glCompressedTextureSubImage3D (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *data);
void glCopyTextureSubImage1D (GLuint texture, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width);
void glCopyTextureSubImage2D (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
void glCopyTextureSubImage3D (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
void glTextureParameterf (GLuint texture, GLenum pname, GLfloat param);
void glTextureParameterfv (GLuint texture, GLenum pname, const GLfloat *param);
void glTextureParameteri (GLuint texture, GLenum pname, GLint param);
void glTextureParameterIiv (GLuint texture, GLenum pname, const GLint *params);
void glTextureParameterIuiv (GLuint texture, GLenum pname, const GLuint *params);
void glTextureParameteriv (GLuint texture, GLenum pname, const GLint *param);
void glGenerateTextureMipmap (GLuint texture);
void glBindTextureUnit (GLuint unit, GLuint texture);
void glGetTextureImage (GLuint texture, GLint level, GLenum format, GLenum type, GLsizei bufSize, void *pixels);
void glGetCompressedTextureImage (GLuint texture, GLint level, GLsizei bufSize, void *pixels);
void glGetTextureLevelParameterfv (GLuint texture, GLint level, GLenum pname, GLfloat *params);
void glGetTextureLevelParameteriv (GLuint texture, GLint level, GLenum pname, GLint *params);
void glGetTextureParameterfv (GLuint texture, GLenum pname, GLfloat *params);
void glGetTextureParameterIiv (GLuint texture, GLenum pname, GLint *params);
void glGetTextureParameterIuiv (GLuint texture, GLenum pname, GLuint *params);
void glGetTextureParameteriv (GLuint texture, GLenum pname, GLint *params);
void glCreateVertexArrays (GLsizei n, GLuint *arrays);
void glDisableVertexArrayAttrib (GLuint vaobj, GLuint index);
void glEnableVertexArrayAttrib (GLuint vaobj, GLuint index);
void glVertexArrayElementBuffer (GLuint vaobj, GLuint buffer);
void glVertexArrayVertexBuffer (GLuint vaobj, GLuint bindingindex, GLuint buffer, GLintptr offset, GLsizei stride);
void glVertexArrayVertexBuffers (GLuint vaobj, GLuint first, GLsizei count, const GLuint *buffers, const GLintptr *offsets, const GLsizei *strides);
void glVertexArrayAttribBinding (GLuint vaobj, GLuint attribindex, GLuint bindingindex);
void glVertexArrayAttribFormat (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLboolean normalized, GLuint relativeoffset);
void glVertexArrayAttribIFormat (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset);
void glVertexArrayAttribLFormat (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset);
void glVertexArrayBindingDivisor (GLuint vaobj, GLuint bindingindex, GLuint divisor);
void glGetVertexArrayiv (GLuint vaobj, GLenum pname, GLint *param);
void glGetVertexArrayIndexediv (GLuint vaobj, GLuint index, GLenum pname, GLint *param);
void glGetVertexArrayIndexed64iv (GLuint vaobj, GLuint index, GLenum pname, GLint64 *param);
void glCreateSamplers (GLsizei n, GLuint *samplers);
void glCreateProgramPipelines (GLsizei n, GLuint *pipelines);
void glCreateQueries (GLenum target, GLsizei n, GLuint *ids);
void glGetQueryBufferObjecti64v (GLuint id, GLuint buffer, GLenum pname, GLintptr offset);
void glGetQueryBufferObjectiv (GLuint id, GLuint buffer, GLenum pname, GLintptr offset);
void glGetQueryBufferObjectui64v (GLuint id, GLuint buffer, GLenum pname, GLintptr offset);
void glGetQueryBufferObjectuiv (GLuint id, GLuint buffer, GLenum pname, GLintptr offset);
void glMemoryBarrierByRegion (GLbitfield barriers);
void glGetTextureSubImage (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, GLsizei bufSize, void *pixels);
void glGetCompressedTextureSubImage (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLsizei bufSize, void *pixels);
GLenum glGetGraphicsResetStatus (void);
void glGetnCompressedTexImage (GLenum target, GLint lod, GLsizei bufSize, void *pixels);
void glGetnTexImage (GLenum target, GLint level, GLenum format, GLenum type, GLsizei bufSize, void *pixels);
void glGetnUniformdv (GLuint program, GLint location, GLsizei bufSize, GLdouble *params);
void glGetnUniformfv (GLuint program, GLint location, GLsizei bufSize, GLfloat *params);
void glGetnUniformiv (GLuint program, GLint location, GLsizei bufSize, GLint *params);
void glGetnUniformuiv (GLuint program, GLint location, GLsizei bufSize, GLuint *params);
void glReadnPixels (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLsizei bufSize, void *data);
void glTextureBarrier (void);

enum { GL_VERSION_4_6 = 1 };
enum {
    GL_SHADER_BINARY_FORMAT_SPIR_V    = 0x9551,
    GL_SPIR_V_BINARY                  = 0x9552,
    GL_PARAMETER_BUFFER               = 0x80EE,
    GL_PARAMETER_BUFFER_BINDING       = 0x80EF,
    GL_CONTEXT_FLAG_NO_ERROR_BIT      = 0x00000008,
    GL_VERTICES_SUBMITTED             = 0x82EE,
    GL_PRIMITIVES_SUBMITTED           = 0x82EF,
    GL_VERTEX_SHADER_INVOCATIONS      = 0x82F0,
    GL_TESS_CONTROL_SHADER_PATCHES    = 0x82F1,
    GL_TESS_EVALUATION_SHADER_INVOCATIONS = 0x82F2,
    GL_GEOMETRY_SHADER_PRIMITIVES_EMITTED = 0x82F3,
    GL_FRAGMENT_SHADER_INVOCATIONS    = 0x82F4,
    GL_COMPUTE_SHADER_INVOCATIONS     = 0x82F5,
    GL_CLIPPING_INPUT_PRIMITIVES      = 0x82F6,
    GL_CLIPPING_OUTPUT_PRIMITIVES     = 0x82F7,
    GL_POLYGON_OFFSET_CLAMP           = 0x8E1B,
    GL_SPIR_V_EXTENSIONS              = 0x9553,
    GL_NUM_SPIR_V_EXTENSIONS          = 0x9554,
    GL_TEXTURE_MAX_ANISOTROPY         = 0x84FE,
    GL_MAX_TEXTURE_MAX_ANISOTROPY     = 0x84FF,
    GL_TRANSFORM_FEEDBACK_OVERFLOW    = 0x82EC,
    GL_TRANSFORM_FEEDBACK_STREAM_OVERFLOW = 0x82ED
};
typedef void (* PFNGLSPECIALIZESHADERPROC) (GLuint shader, const GLchar *pEntryPoint, GLuint numSpecializationConstants, const GLuint *pConstantIndex, const GLuint *pConstantValue);
typedef void (* PFNGLMULTIDRAWARRAYSINDIRECTCOUNTPROC) (GLenum mode, const void *indirect, GLintptr drawcount, GLsizei maxdrawcount, GLsizei stride);
typedef void (* PFNGLMULTIDRAWELEMENTSINDIRECTCOUNTPROC) (GLenum mode, GLenum type, const void *indirect, GLintptr drawcount, GLsizei maxdrawcount, GLsizei stride);
typedef void (* PFNGLPOLYGONOFFSETCLAMPPROC) (GLfloat factor, GLfloat units, GLfloat clamp);
void glSpecializeShader (GLuint shader, const GLchar *pEntryPoint, GLuint numSpecializationConstants, const GLuint *pConstantIndex, const GLuint *pConstantValue);
void glMultiDrawArraysIndirectCount (GLenum mode, const void *indirect, GLintptr drawcount, GLsizei maxdrawcount, GLsizei stride);
void glMultiDrawElementsIndirectCount (GLenum mode, GLenum type, const void *indirect, GLintptr drawcount, GLsizei maxdrawcount, GLsizei stride);
void glPolygonOffsetClamp (GLfloat factor, GLfloat units, GLfloat clamp);

enum { GL_ARB_ES2_compatibility = 1 };
enum { GL_ARB_ES3_1_compatibility = 1 };

enum {
    GL_ARB_ES3_2_compatibility = 1,
    GL_PRIMITIVE_BOUNDING_BOX_ARB     = 0x92BE,
    GL_MULTISAMPLE_LINE_WIDTH_RANGE_ARB = 0x9381,
    GL_MULTISAMPLE_LINE_WIDTH_GRANULARITY_ARB = 0x9382
};
typedef void (* PFNGLPRIMITIVEBOUNDINGBOXARBPROC) (GLfloat minX, GLfloat minY, GLfloat minZ, GLfloat minW, GLfloat maxX, GLfloat maxY, GLfloat maxZ, GLfloat maxW);
void glPrimitiveBoundingBoxARB (GLfloat minX, GLfloat minY, GLfloat minZ, GLfloat minW, GLfloat maxX, GLfloat maxY, GLfloat maxZ, GLfloat maxW);

enum { GL_ARB_ES3_compatibility = 1 };
enum { GL_ARB_arrays_of_arrays = 1 };
enum { GL_ARB_base_instance = 1 };
enum { GL_ARB_bindless_texture = 1 };
typedef uint64_t GLuint64EXT;
enum { GL_UNSIGNED_INT64_ARB = 0x140F };
typedef GLuint64 (* PFNGLGETTEXTUREHANDLEARBPROC) (GLuint texture);
typedef GLuint64 (* PFNGLGETTEXTURESAMPLERHANDLEARBPROC) (GLuint texture, GLuint sampler);
typedef void (* PFNGLMAKETEXTUREHANDLERESIDENTARBPROC) (GLuint64 handle);
typedef void (* PFNGLMAKETEXTUREHANDLENONRESIDENTARBPROC) (GLuint64 handle);
typedef GLuint64 (* PFNGLGETIMAGEHANDLEARBPROC) (GLuint texture, GLint level, GLboolean layered, GLint layer, GLenum format);
typedef void (* PFNGLMAKEIMAGEHANDLERESIDENTARBPROC) (GLuint64 handle, GLenum access);
typedef void (* PFNGLMAKEIMAGEHANDLENONRESIDENTARBPROC) (GLuint64 handle);
typedef void (* PFNGLUNIFORMHANDLEUI64ARBPROC) (GLint location, GLuint64 value);
typedef void (* PFNGLUNIFORMHANDLEUI64VARBPROC) (GLint location, GLsizei count, const GLuint64 *value);
typedef void (* PFNGLPROGRAMUNIFORMHANDLEUI64ARBPROC) (GLuint program, GLint location, GLuint64 value);
typedef void (* PFNGLPROGRAMUNIFORMHANDLEUI64VARBPROC) (GLuint program, GLint location, GLsizei count, const GLuint64 *values);
typedef GLboolean (* PFNGLISTEXTUREHANDLERESIDENTARBPROC) (GLuint64 handle);
typedef GLboolean (* PFNGLISIMAGEHANDLERESIDENTARBPROC) (GLuint64 handle);
typedef void (* PFNGLVERTEXATTRIBL1UI64ARBPROC) (GLuint index, GLuint64EXT x);
typedef void (* PFNGLVERTEXATTRIBL1UI64VARBPROC) (GLuint index, const GLuint64EXT *v);
typedef void (* PFNGLGETVERTEXATTRIBLUI64VARBPROC) (GLuint index, GLenum pname, GLuint64EXT *params);

GLuint64 glGetTextureHandleARB (GLuint texture);
GLuint64 glGetTextureSamplerHandleARB (GLuint texture, GLuint sampler);
void glMakeTextureHandleResidentARB (GLuint64 handle);
void glMakeTextureHandleNonResidentARB (GLuint64 handle);
GLuint64 glGetImageHandleARB (GLuint texture, GLint level, GLboolean layered, GLint layer, GLenum format);
void glMakeImageHandleResidentARB (GLuint64 handle, GLenum access);
void glMakeImageHandleNonResidentARB (GLuint64 handle);
void glUniformHandleui64ARB (GLint location, GLuint64 value);
void glUniformHandleui64vARB (GLint location, GLsizei count, const GLuint64 *value);
void glProgramUniformHandleui64ARB (GLuint program, GLint location, GLuint64 value);
void glProgramUniformHandleui64vARB (GLuint program, GLint location, GLsizei count, const GLuint64 *values);
GLboolean glIsTextureHandleResidentARB (GLuint64 handle);
GLboolean glIsImageHandleResidentARB (GLuint64 handle);
void glVertexAttribL1ui64ARB (GLuint index, GLuint64EXT x);
void glVertexAttribL1ui64vARB (GLuint index, const GLuint64EXT *v);
void glGetVertexAttribLui64vARB (GLuint index, GLenum pname, GLuint64EXT *params);

enum { GL_ARB_blend_func_extended = 1 };
enum { GL_ARB_buffer_storage = 1 };

enum { GL_ARB_cl_event = 1 };
struct _cl_context;
struct _cl_event;
enum {
    GL_SYNC_CL_EVENT_ARB              = 0x8240,
    GL_SYNC_CL_EVENT_COMPLETE_ARB     = 0x8241
};
typedef GLsync (* PFNGLCREATESYNCFROMCLEVENTARBPROC) (struct _cl_context *context, struct _cl_event *event, GLbitfield flags);
GLsync glCreateSyncFromCLeventARB (struct _cl_context *context, struct _cl_event *event, GLbitfield flags);

enum { GL_ARB_clear_buffer_object = 1 };
enum { GL_ARB_clear_texture = 1 };
enum { GL_ARB_clip_control = 1 };
enum { GL_ARB_compressed_texture_pixel_storage = 1 };
enum { GL_ARB_compute_shader = 1 };

enum {
    GL_ARB_compute_variable_group_size = 1,
    GL_MAX_COMPUTE_VARIABLE_GROUP_INVOCATIONS_ARB = 0x9344,
    GL_MAX_COMPUTE_FIXED_GROUP_INVOCATIONS_ARB = 0x90EB,
    GL_MAX_COMPUTE_VARIABLE_GROUP_SIZE_ARB = 0x9345,
    GL_MAX_COMPUTE_FIXED_GROUP_SIZE_ARB = 0x91BF
};
typedef void (* PFNGLDISPATCHCOMPUTEGROUPSIZEARBPROC) (GLuint num_groups_x, GLuint num_groups_y, GLuint num_groups_z, GLuint group_size_x, GLuint group_size_y, GLuint group_size_z);
void glDispatchComputeGroupSizeARB (GLuint num_groups_x, GLuint num_groups_y, GLuint num_groups_z, GLuint group_size_x, GLuint group_size_y, GLuint group_size_z);

enum { GL_ARB_conditional_render_inverted = 1 };
enum { GL_ARB_conservative_depth = 1 };
enum { GL_ARB_copy_buffer = 1 };
enum { GL_ARB_copy_image = 1 };
enum { GL_ARB_cull_distance = 1 };
enum { GL_ARB_debug_output = 1 };
typedef void ( *GLDEBUGPROCARB)(GLenum source,GLenum type,GLuint id,GLenum severity,GLsizei length,const GLchar *message,const void *userParam);
enum {
    GL_DEBUG_OUTPUT_SYNCHRONOUS_ARB   = 0x8242,
    GL_DEBUG_NEXT_LOGGED_MESSAGE_LENGTH_ARB = 0x8243,
    GL_DEBUG_CALLBACK_FUNCTION_ARB    = 0x8244,
    GL_DEBUG_CALLBACK_USER_PARAM_ARB  = 0x8245,
    GL_DEBUG_SOURCE_API_ARB           = 0x8246,
    GL_DEBUG_SOURCE_WINDOW_SYSTEM_ARB = 0x8247,
    GL_DEBUG_SOURCE_SHADER_COMPILER_ARB = 0x8248,
    GL_DEBUG_SOURCE_THIRD_PARTY_ARB   = 0x8249,
    GL_DEBUG_SOURCE_APPLICATION_ARB   = 0x824A,
    GL_DEBUG_SOURCE_OTHER_ARB         = 0x824B,
    GL_DEBUG_TYPE_ERROR_ARB           = 0x824C,
    GL_DEBUG_TYPE_DEPRECATED_BEHAVIOR_ARB = 0x824D,
    GL_DEBUG_TYPE_UNDEFINED_BEHAVIOR_ARB = 0x824E,
    GL_DEBUG_TYPE_PORTABILITY_ARB     = 0x824F,
    GL_DEBUG_TYPE_PERFORMANCE_ARB     = 0x8250,
    GL_DEBUG_TYPE_OTHER_ARB           = 0x8251,
    GL_MAX_DEBUG_MESSAGE_LENGTH_ARB   = 0x9143,
    GL_MAX_DEBUG_LOGGED_MESSAGES_ARB  = 0x9144,
    GL_DEBUG_LOGGED_MESSAGES_ARB      = 0x9145,
    GL_DEBUG_SEVERITY_HIGH_ARB        = 0x9146,
    GL_DEBUG_SEVERITY_MEDIUM_ARB      = 0x9147,
    GL_DEBUG_SEVERITY_LOW_ARB         = 0x9148
};
typedef void (* PFNGLDEBUGMESSAGECONTROLARBPROC) (GLenum source, GLenum type, GLenum severity, GLsizei count, const GLuint *ids, GLboolean enabled);
typedef void (* PFNGLDEBUGMESSAGEINSERTARBPROC) (GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, const GLchar *buf);
typedef void (* PFNGLDEBUGMESSAGECALLBACKARBPROC) (GLDEBUGPROCARB callback, const void *userParam);
typedef GLuint (* PFNGLGETDEBUGMESSAGELOGARBPROC) (GLuint count, GLsizei bufSize, GLenum *sources, GLenum *types, GLuint *ids, GLenum *severities, GLsizei *lengths, GLchar *messageLog);

void glDebugMessageControlARB (GLenum source, GLenum type, GLenum severity, GLsizei count, const GLuint *ids, GLboolean enabled);
void glDebugMessageInsertARB (GLenum source, GLenum type, GLuint id, GLenum severity, GLsizei length, const GLchar *buf);
void glDebugMessageCallbackARB (GLDEBUGPROCARB callback, const void *userParam);
GLuint glGetDebugMessageLogARB (GLuint count, GLsizei bufSize, GLenum *sources, GLenum *types, GLuint *ids, GLenum *severities, GLsizei *lengths, GLchar *messageLog);

enum { GL_ARB_depth_buffer_float = 1 };
enum { GL_ARB_depth_clamp = 1 };
enum { GL_ARB_derivative_control = 1 };
enum { GL_ARB_direct_state_access = 1 };
enum { GL_ARB_draw_buffers_blend = 1 };
typedef void (* PFNGLBLENDEQUATIONIARBPROC) (GLuint buf, GLenum mode);
typedef void (* PFNGLBLENDEQUATIONSEPARATEIARBPROC) (GLuint buf, GLenum modeRGB, GLenum modeAlpha);
typedef void (* PFNGLBLENDFUNCIARBPROC) (GLuint buf, GLenum src, GLenum dst);
typedef void (* PFNGLBLENDFUNCSEPARATEIARBPROC) (GLuint buf, GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha);
void glBlendEquationiARB (GLuint buf, GLenum mode);
void glBlendEquationSeparateiARB (GLuint buf, GLenum modeRGB, GLenum modeAlpha);
void glBlendFunciARB (GLuint buf, GLenum src, GLenum dst);
void glBlendFuncSeparateiARB (GLuint buf, GLenum srcRGB, GLenum dstRGB, GLenum srcAlpha, GLenum dstAlpha);
enum { GL_ARB_draw_elements_base_vertex = 1 };
enum { GL_ARB_draw_indirect = 1 };
enum { GL_ARB_draw_instanced = 1 };
typedef void (* PFNGLDRAWARRAYSINSTANCEDARBPROC) (GLenum mode, GLint first, GLsizei count, GLsizei primcount);
typedef void (* PFNGLDRAWELEMENTSINSTANCEDARBPROC) (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei primcount);
void glDrawArraysInstancedARB (GLenum mode, GLint first, GLsizei count, GLsizei primcount);
void glDrawElementsInstancedARB (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei primcount);

enum { GL_ARB_enhanced_layouts = 1 };
enum { GL_ARB_explicit_attrib_location = 1 };
enum { GL_ARB_explicit_uniform_location = 1 };
enum { GL_ARB_fragment_coord_conventions = 1 };
enum { GL_ARB_fragment_layer_viewport = 1 };
enum { GL_ARB_fragment_shader_interlock = 1 };
enum { GL_ARB_framebuffer_no_attachments = 1 };
enum { GL_ARB_framebuffer_object = 1 };
enum { GL_ARB_framebuffer_sRGB = 1 };

enum {
    GL_ARB_geometry_shader4 = 1,
    GL_LINES_ADJACENCY_ARB            = 0x000A,
    GL_LINE_STRIP_ADJACENCY_ARB       = 0x000B,
    GL_TRIANGLES_ADJACENCY_ARB        = 0x000C,
    GL_TRIANGLE_STRIP_ADJACENCY_ARB   = 0x000D,
    GL_PROGRAM_POINT_SIZE_ARB         = 0x8642,
    GL_MAX_GEOMETRY_TEXTURE_IMAGE_UNITS_ARB = 0x8C29,
    GL_FRAMEBUFFER_ATTACHMENT_LAYERED_ARB = 0x8DA7,
    GL_FRAMEBUFFER_INCOMPLETE_LAYER_TARGETS_ARB = 0x8DA8,
    GL_FRAMEBUFFER_INCOMPLETE_LAYER_COUNT_ARB = 0x8DA9,
    GL_GEOMETRY_SHADER_ARB            = 0x8DD9,
    GL_GEOMETRY_VERTICES_OUT_ARB      = 0x8DDA,
    GL_GEOMETRY_INPUT_TYPE_ARB        = 0x8DDB,
    GL_GEOMETRY_OUTPUT_TYPE_ARB       = 0x8DDC,
    GL_MAX_GEOMETRY_VARYING_COMPONENTS_ARB = 0x8DDD,
    GL_MAX_VERTEX_VARYING_COMPONENTS_ARB = 0x8DDE,
    GL_MAX_GEOMETRY_UNIFORM_COMPONENTS_ARB = 0x8DDF,
    GL_MAX_GEOMETRY_OUTPUT_VERTICES_ARB = 0x8DE0,
    GL_MAX_GEOMETRY_TOTAL_OUTPUT_COMPONENTS_ARB = 0x8DE1
};
typedef void (* PFNGLPROGRAMPARAMETERIARBPROC) (GLuint program, GLenum pname, GLint value);
typedef void (* PFNGLFRAMEBUFFERTEXTUREARBPROC) (GLenum target, GLenum attachment, GLuint texture, GLint level);
typedef void (* PFNGLFRAMEBUFFERTEXTURELAYERARBPROC) (GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer);
typedef void (* PFNGLFRAMEBUFFERTEXTUREFACEARBPROC) (GLenum target, GLenum attachment, GLuint texture, GLint level, GLenum face);
void glProgramParameteriARB (GLuint program, GLenum pname, GLint value);
void glFramebufferTextureARB (GLenum target, GLenum attachment, GLuint texture, GLint level);
void glFramebufferTextureLayerARB (GLenum target, GLenum attachment, GLuint texture, GLint level, GLint layer);
void glFramebufferTextureFaceARB (GLenum target, GLenum attachment, GLuint texture, GLint level, GLenum face);

enum { GL_ARB_get_program_binary = 1 };
enum { GL_ARB_get_texture_sub_image = 1 };

enum { GL_ARB_gl_spirv = 1 };
enum {
    GL_SHADER_BINARY_FORMAT_SPIR_V_ARB = 0x9551,
    GL_SPIR_V_BINARY_ARB              = 0x9552
};
typedef void (* PFNGLSPECIALIZESHADERARBPROC) (GLuint shader, const GLchar *pEntryPoint, GLuint numSpecializationConstants, const GLuint *pConstantIndex, const GLuint *pConstantValue);
void glSpecializeShaderARB (GLuint shader, const GLchar *pEntryPoint, GLuint numSpecializationConstants, const GLuint *pConstantIndex, const GLuint *pConstantValue);

enum { GL_ARB_gpu_shader5 = 1 };
enum { GL_ARB_gpu_shader_fp64 = 1 };

enum {
    GL_ARB_gpu_shader_int64           = 1,
    GL_INT64_ARB                      = 0x140E,
    GL_INT64_VEC2_ARB                 = 0x8FE9,
    GL_INT64_VEC3_ARB                 = 0x8FEA,
    GL_INT64_VEC4_ARB                 = 0x8FEB,
    GL_UNSIGNED_INT64_VEC2_ARB        = 0x8FF5,
    GL_UNSIGNED_INT64_VEC3_ARB        = 0x8FF6,
    GL_UNSIGNED_INT64_VEC4_ARB        = 0x8FF7
};
typedef void (* PFNGLUNIFORM1I64ARBPROC) (GLint location, GLint64 x);
typedef void (* PFNGLUNIFORM2I64ARBPROC) (GLint location, GLint64 x, GLint64 y);
typedef void (* PFNGLUNIFORM3I64ARBPROC) (GLint location, GLint64 x, GLint64 y, GLint64 z);
typedef void (* PFNGLUNIFORM4I64ARBPROC) (GLint location, GLint64 x, GLint64 y, GLint64 z, GLint64 w);
typedef void (* PFNGLUNIFORM1I64VARBPROC) (GLint location, GLsizei count, const GLint64 *value);
typedef void (* PFNGLUNIFORM2I64VARBPROC) (GLint location, GLsizei count, const GLint64 *value);
typedef void (* PFNGLUNIFORM3I64VARBPROC) (GLint location, GLsizei count, const GLint64 *value);
typedef void (* PFNGLUNIFORM4I64VARBPROC) (GLint location, GLsizei count, const GLint64 *value);
typedef void (* PFNGLUNIFORM1UI64ARBPROC) (GLint location, GLuint64 x);
typedef void (* PFNGLUNIFORM2UI64ARBPROC) (GLint location, GLuint64 x, GLuint64 y);
typedef void (* PFNGLUNIFORM3UI64ARBPROC) (GLint location, GLuint64 x, GLuint64 y, GLuint64 z);
typedef void (* PFNGLUNIFORM4UI64ARBPROC) (GLint location, GLuint64 x, GLuint64 y, GLuint64 z, GLuint64 w);
typedef void (* PFNGLUNIFORM1UI64VARBPROC) (GLint location, GLsizei count, const GLuint64 *value);
typedef void (* PFNGLUNIFORM2UI64VARBPROC) (GLint location, GLsizei count, const GLuint64 *value);
typedef void (* PFNGLUNIFORM3UI64VARBPROC) (GLint location, GLsizei count, const GLuint64 *value);
typedef void (* PFNGLUNIFORM4UI64VARBPROC) (GLint location, GLsizei count, const GLuint64 *value);
typedef void (* PFNGLGETUNIFORMI64VARBPROC) (GLuint program, GLint location, GLint64 *params);
typedef void (* PFNGLGETUNIFORMUI64VARBPROC) (GLuint program, GLint location, GLuint64 *params);
typedef void (* PFNGLGETNUNIFORMI64VARBPROC) (GLuint program, GLint location, GLsizei bufSize, GLint64 *params);
typedef void (* PFNGLGETNUNIFORMUI64VARBPROC) (GLuint program, GLint location, GLsizei bufSize, GLuint64 *params);
typedef void (* PFNGLPROGRAMUNIFORM1I64ARBPROC) (GLuint program, GLint location, GLint64 x);
typedef void (* PFNGLPROGRAMUNIFORM2I64ARBPROC) (GLuint program, GLint location, GLint64 x, GLint64 y);
typedef void (* PFNGLPROGRAMUNIFORM3I64ARBPROC) (GLuint program, GLint location, GLint64 x, GLint64 y, GLint64 z);
typedef void (* PFNGLPROGRAMUNIFORM4I64ARBPROC) (GLuint program, GLint location, GLint64 x, GLint64 y, GLint64 z, GLint64 w);
typedef void (* PFNGLPROGRAMUNIFORM1I64VARBPROC) (GLuint program, GLint location, GLsizei count, const GLint64 *value);
typedef void (* PFNGLPROGRAMUNIFORM2I64VARBPROC) (GLuint program, GLint location, GLsizei count, const GLint64 *value);
typedef void (* PFNGLPROGRAMUNIFORM3I64VARBPROC) (GLuint program, GLint location, GLsizei count, const GLint64 *value);
typedef void (* PFNGLPROGRAMUNIFORM4I64VARBPROC) (GLuint program, GLint location, GLsizei count, const GLint64 *value);
typedef void (* PFNGLPROGRAMUNIFORM1UI64ARBPROC) (GLuint program, GLint location, GLuint64 x);
typedef void (* PFNGLPROGRAMUNIFORM2UI64ARBPROC) (GLuint program, GLint location, GLuint64 x, GLuint64 y);
typedef void (* PFNGLPROGRAMUNIFORM3UI64ARBPROC) (GLuint program, GLint location, GLuint64 x, GLuint64 y, GLuint64 z);
typedef void (* PFNGLPROGRAMUNIFORM4UI64ARBPROC) (GLuint program, GLint location, GLuint64 x, GLuint64 y, GLuint64 z, GLuint64 w);
typedef void (* PFNGLPROGRAMUNIFORM1UI64VARBPROC) (GLuint program, GLint location, GLsizei count, const GLuint64 *value);
typedef void (* PFNGLPROGRAMUNIFORM2UI64VARBPROC) (GLuint program, GLint location, GLsizei count, const GLuint64 *value);
typedef void (* PFNGLPROGRAMUNIFORM3UI64VARBPROC) (GLuint program, GLint location, GLsizei count, const GLuint64 *value);
typedef void (* PFNGLPROGRAMUNIFORM4UI64VARBPROC) (GLuint program, GLint location, GLsizei count, const GLuint64 *value);

void glUniform1i64ARB (GLint location, GLint64 x);
void glUniform2i64ARB (GLint location, GLint64 x, GLint64 y);
void glUniform3i64ARB (GLint location, GLint64 x, GLint64 y, GLint64 z);
void glUniform4i64ARB (GLint location, GLint64 x, GLint64 y, GLint64 z, GLint64 w);
void glUniform1i64vARB (GLint location, GLsizei count, const GLint64 *value);
void glUniform2i64vARB (GLint location, GLsizei count, const GLint64 *value);
void glUniform3i64vARB (GLint location, GLsizei count, const GLint64 *value);
void glUniform4i64vARB (GLint location, GLsizei count, const GLint64 *value);
void glUniform1ui64ARB (GLint location, GLuint64 x);
void glUniform2ui64ARB (GLint location, GLuint64 x, GLuint64 y);
void glUniform3ui64ARB (GLint location, GLuint64 x, GLuint64 y, GLuint64 z);
void glUniform4ui64ARB (GLint location, GLuint64 x, GLuint64 y, GLuint64 z, GLuint64 w);
void glUniform1ui64vARB (GLint location, GLsizei count, const GLuint64 *value);
void glUniform2ui64vARB (GLint location, GLsizei count, const GLuint64 *value);
void glUniform3ui64vARB (GLint location, GLsizei count, const GLuint64 *value);
void glUniform4ui64vARB (GLint location, GLsizei count, const GLuint64 *value);
void glGetUniformi64vARB (GLuint program, GLint location, GLint64 *params);
void glGetUniformui64vARB (GLuint program, GLint location, GLuint64 *params);
void glGetnUniformi64vARB (GLuint program, GLint location, GLsizei bufSize, GLint64 *params);
void glGetnUniformui64vARB (GLuint program, GLint location, GLsizei bufSize, GLuint64 *params);
void glProgramUniform1i64ARB (GLuint program, GLint location, GLint64 x);
void glProgramUniform2i64ARB (GLuint program, GLint location, GLint64 x, GLint64 y);
void glProgramUniform3i64ARB (GLuint program, GLint location, GLint64 x, GLint64 y, GLint64 z);
void glProgramUniform4i64ARB (GLuint program, GLint location, GLint64 x, GLint64 y, GLint64 z, GLint64 w);
void glProgramUniform1i64vARB (GLuint program, GLint location, GLsizei count, const GLint64 *value);
void glProgramUniform2i64vARB (GLuint program, GLint location, GLsizei count, const GLint64 *value);
void glProgramUniform3i64vARB (GLuint program, GLint location, GLsizei count, const GLint64 *value);
void glProgramUniform4i64vARB (GLuint program, GLint location, GLsizei count, const GLint64 *value);
void glProgramUniform1ui64ARB (GLuint program, GLint location, GLuint64 x);
void glProgramUniform2ui64ARB (GLuint program, GLint location, GLuint64 x, GLuint64 y);
void glProgramUniform3ui64ARB (GLuint program, GLint location, GLuint64 x, GLuint64 y, GLuint64 z);
void glProgramUniform4ui64ARB (GLuint program, GLint location, GLuint64 x, GLuint64 y, GLuint64 z, GLuint64 w);
void glProgramUniform1ui64vARB (GLuint program, GLint location, GLsizei count, const GLuint64 *value);
void glProgramUniform2ui64vARB (GLuint program, GLint location, GLsizei count, const GLuint64 *value);
void glProgramUniform3ui64vARB (GLuint program, GLint location, GLsizei count, const GLuint64 *value);
void glProgramUniform4ui64vARB (GLuint program, GLint location, GLsizei count, const GLuint64 *value);

enum { GL_ARB_half_float_vertex = 1 };
enum { GL_ARB_indirect_parameters = 1 };
enum {
    GL_PARAMETER_BUFFER_ARB           = 0x80EE,
    GL_PARAMETER_BUFFER_BINDING_ARB   = 0x80EF
};
typedef void (* PFNGLMULTIDRAWARRAYSINDIRECTCOUNTARBPROC) (GLenum mode, const void *indirect, GLintptr drawcount, GLsizei maxdrawcount, GLsizei stride);
typedef void (* PFNGLMULTIDRAWELEMENTSINDIRECTCOUNTARBPROC) (GLenum mode, GLenum type, const void *indirect, GLintptr drawcount, GLsizei maxdrawcount, GLsizei stride);
void glMultiDrawArraysIndirectCountARB (GLenum mode, const void *indirect, GLintptr drawcount, GLsizei maxdrawcount, GLsizei stride);
void glMultiDrawElementsIndirectCountARB (GLenum mode, GLenum type, const void *indirect, GLintptr drawcount, GLsizei maxdrawcount, GLsizei stride);
enum {
    GL_ARB_instanced_arrays = 1,
    GL_VERTEX_ATTRIB_ARRAY_DIVISOR_ARB = 0x88FE
};
typedef void (* PFNGLVERTEXATTRIBDIVISORARBPROC) (GLuint index, GLuint divisor);
void glVertexAttribDivisorARB (GLuint index, GLuint divisor);

enum { GL_ARB_internalformat_query = 1 };

enum {
    GL_ARB_internalformat_query2      = 1,
    GL_SRGB_DECODE_ARB                = 0x8299,
    GL_VIEW_CLASS_EAC_R11             = 0x9383,
    GL_VIEW_CLASS_EAC_RG11            = 0x9384,
    GL_VIEW_CLASS_ETC2_RGB            = 0x9385,
    GL_VIEW_CLASS_ETC2_RGBA           = 0x9386,
    GL_VIEW_CLASS_ETC2_EAC_RGBA       = 0x9387,
    GL_VIEW_CLASS_ASTC_4x4_RGBA       = 0x9388,
    GL_VIEW_CLASS_ASTC_5x4_RGBA       = 0x9389,
    GL_VIEW_CLASS_ASTC_5x5_RGBA       = 0x938A,
    GL_VIEW_CLASS_ASTC_6x5_RGBA       = 0x938B,
    GL_VIEW_CLASS_ASTC_6x6_RGBA       = 0x938C,
    GL_VIEW_CLASS_ASTC_8x5_RGBA       = 0x938D,
    GL_VIEW_CLASS_ASTC_8x6_RGBA       = 0x938E,
    GL_VIEW_CLASS_ASTC_8x8_RGBA       = 0x938F,
    GL_VIEW_CLASS_ASTC_10x5_RGBA      = 0x9390,
    GL_VIEW_CLASS_ASTC_10x6_RGBA      = 0x9391,
    GL_VIEW_CLASS_ASTC_10x8_RGBA      = 0x9392,
    GL_VIEW_CLASS_ASTC_10x10_RGBA     = 0x9393,
    GL_VIEW_CLASS_ASTC_12x10_RGBA     = 0x9394,
    GL_VIEW_CLASS_ASTC_12x12_RGBA     = 0x9395
};

enum { GL_ARB_invalidate_subdata = 1 };
enum { GL_ARB_map_buffer_alignment = 1 };
enum { GL_ARB_map_buffer_range = 1 };
enum { GL_ARB_multi_bind = 1 };
enum { GL_ARB_multi_draw_indirect = 1 };
enum { GL_ARB_occlusion_query2 = 1 };

enum {
    GL_ARB_parallel_shader_compile     = 1,
    GL_MAX_SHADER_COMPILER_THREADS_ARB = 0x91B0,
    GL_COMPLETION_STATUS_ARB           = 0x91B1
};
typedef void (* PFNGLMAXSHADERCOMPILERTHREADSARBPROC) (GLuint count);
void glMaxShaderCompilerThreadsARB (GLuint count);

enum {
    GL_ARB_pipeline_statistics_query = 1,
    GL_VERTICES_SUBMITTED_ARB         = 0x82EE,
    GL_PRIMITIVES_SUBMITTED_ARB       = 0x82EF,
    GL_VERTEX_SHADER_INVOCATIONS_ARB  = 0x82F0,
    GL_TESS_CONTROL_SHADER_PATCHES_ARB = 0x82F1,
    GL_TESS_EVALUATION_SHADER_INVOCATIONS_ARB = 0x82F2,
    GL_GEOMETRY_SHADER_PRIMITIVES_EMITTED_ARB = 0x82F3,
    GL_FRAGMENT_SHADER_INVOCATIONS_ARB = 0x82F4,
    GL_COMPUTE_SHADER_INVOCATIONS_ARB = 0x82F5,
    GL_CLIPPING_INPUT_PRIMITIVES_ARB  = 0x82F6,
    GL_CLIPPING_OUTPUT_PRIMITIVES_ARB = 0x82F7
};

enum {
    GL_ARB_pixel_buffer_object = 1,
    GL_PIXEL_PACK_BUFFER_ARB          = 0x88EB,
    GL_PIXEL_UNPACK_BUFFER_ARB        = 0x88EC,
    GL_PIXEL_PACK_BUFFER_BINDING_ARB  = 0x88ED,
    GL_PIXEL_UNPACK_BUFFER_BINDING_ARB = 0x88EF
};

enum { GL_ARB_polygon_offset_clamp = 1 };
enum { GL_ARB_post_depth_coverage = 1 };
enum { GL_ARB_program_interface_query = 1 };
enum { GL_ARB_provoking_vertex = 1 };
enum { GL_ARB_query_buffer_object = 1 };
enum { GL_ARB_robust_buffer_access_behavior = 1 };

enum {
    GL_ARB_robustness = 1,
    GL_CONTEXT_FLAG_ROBUST_ACCESS_BIT_ARB = 0x00000004,
    GL_LOSE_CONTEXT_ON_RESET_ARB      = 0x8252,
    GL_GUILTY_CONTEXT_RESET_ARB       = 0x8253,
    GL_INNOCENT_CONTEXT_RESET_ARB     = 0x8254,
    GL_UNKNOWN_CONTEXT_RESET_ARB      = 0x8255,
    GL_RESET_NOTIFICATION_STRATEGY_ARB = 0x8256,
    GL_NO_RESET_NOTIFICATION_ARB      = 0x8261
};

typedef GLenum (* PFNGLGETGRAPHICSRESETSTATUSARBPROC) (void);
typedef void (* PFNGLGETNTEXIMAGEARBPROC) (GLenum target, GLint level, GLenum format, GLenum type, GLsizei bufSize, void *img);
typedef void (* PFNGLREADNPIXELSARBPROC) (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLsizei bufSize, void *data);
typedef void (* PFNGLGETNCOMPRESSEDTEXIMAGEARBPROC) (GLenum target, GLint lod, GLsizei bufSize, void *img);
typedef void (* PFNGLGETNUNIFORMFVARBPROC) (GLuint program, GLint location, GLsizei bufSize, GLfloat *params);
typedef void (* PFNGLGETNUNIFORMIVARBPROC) (GLuint program, GLint location, GLsizei bufSize, GLint *params);
typedef void (* PFNGLGETNUNIFORMUIVARBPROC) (GLuint program, GLint location, GLsizei bufSize, GLuint *params);
typedef void (* PFNGLGETNUNIFORMDVARBPROC) (GLuint program, GLint location, GLsizei bufSize, GLdouble *params);

GLenum glGetGraphicsResetStatusARB (void);
void glGetnTexImageARB (GLenum target, GLint level, GLenum format, GLenum type, GLsizei bufSize, void *img);
void glReadnPixelsARB (GLint x, GLint y, GLsizei width, GLsizei height, GLenum format, GLenum type, GLsizei bufSize, void *data);
void glGetnCompressedTexImageARB (GLenum target, GLint lod, GLsizei bufSize, void *img);
void glGetnUniformfvARB (GLuint program, GLint location, GLsizei bufSize, GLfloat *params);
void glGetnUniformivARB (GLuint program, GLint location, GLsizei bufSize, GLint *params);
void glGetnUniformuivARB (GLuint program, GLint location, GLsizei bufSize, GLuint *params);
void glGetnUniformdvARB (GLuint program, GLint location, GLsizei bufSize, GLdouble *params);

enum { GL_ARB_robustness_isolation = 1 };
enum {
    GL_ARB_sample_locations = 1,
    GL_SAMPLE_LOCATION_SUBPIXEL_BITS_ARB = 0x933D,
    GL_SAMPLE_LOCATION_PIXEL_GRID_WIDTH_ARB = 0x933E,
    GL_SAMPLE_LOCATION_PIXEL_GRID_HEIGHT_ARB = 0x933F,
    GL_PROGRAMMABLE_SAMPLE_LOCATION_TABLE_SIZE_ARB = 0x9340,
    GL_SAMPLE_LOCATION_ARB            = 0x8E50,
    GL_PROGRAMMABLE_SAMPLE_LOCATION_ARB = 0x9341,
    GL_FRAMEBUFFER_PROGRAMMABLE_SAMPLE_LOCATIONS_ARB = 0x9342,
    GL_FRAMEBUFFER_SAMPLE_LOCATION_PIXEL_GRID_ARB = 0x9343
};
typedef void (* PFNGLFRAMEBUFFERSAMPLELOCATIONSFVARBPROC) (GLenum target, GLuint start, GLsizei count, const GLfloat *v);
typedef void (* PFNGLNAMEDFRAMEBUFFERSAMPLELOCATIONSFVARBPROC) (GLuint framebuffer, GLuint start, GLsizei count, const GLfloat *v);
typedef void (* PFNGLEVALUATEDEPTHVALUESARBPROC) (void);
void glFramebufferSampleLocationsfvARB (GLenum target, GLuint start, GLsizei count, const GLfloat *v);
void glNamedFramebufferSampleLocationsfvARB (GLuint framebuffer, GLuint start, GLsizei count, const GLfloat *v);
void glEvaluateDepthValuesARB (void);
enum {
    GL_ARB_sample_shading = 1,
    GL_SAMPLE_SHADING_ARB             = 0x8C36,
    GL_MIN_SAMPLE_SHADING_VALUE_ARB   = 0x8C37
};
typedef void (* PFNGLMINSAMPLESHADINGARBPROC) (GLfloat value);
void glMinSampleShadingARB (GLfloat value);

enum { GL_ARB_sampler_objects = 1 };
enum { GL_ARB_seamless_cube_map = 1 };
enum { GL_ARB_seamless_cubemap_per_texture = 1 };
enum { GL_ARB_separate_shader_objects = 1 };
enum { GL_ARB_shader_atomic_counter_ops = 1 };
enum { GL_ARB_shader_atomic_counters = 1 };
enum { GL_ARB_shader_ballot = 1 };
enum { GL_ARB_shader_bit_encoding = 1 };
enum { GL_ARB_shader_clock = 1 };
enum { GL_ARB_shader_draw_parameters = 1 };
enum { GL_ARB_shader_group_vote = 1 };
enum { GL_ARB_shader_image_load_store = 1 };
enum { GL_ARB_shader_image_size = 1 };
enum { GL_ARB_shader_precision = 1 };
enum { GL_ARB_shader_stencil_export = 1 };
enum { GL_ARB_shader_storage_buffer_object = 1 };
enum { GL_ARB_shader_subroutine = 1 };
enum { GL_ARB_shader_texture_image_samples = 1 };
enum { GL_ARB_shader_viewport_layer_array = 1 };
enum { GL_ARB_shading_language_420pack = 1 };
enum {
    GL_ARB_shading_language_include   = 1,
    GL_SHADER_INCLUDE_ARB             = 0x8DAE,
    GL_NAMED_STRING_LENGTH_ARB        = 0x8DE9,
    GL_NAMED_STRING_TYPE_ARB          = 0x8DEA
};

typedef void (* PFNGLNAMEDSTRINGARBPROC) (GLenum type, GLint namelen, const GLchar *name, GLint stringlen, const GLchar *string);
typedef void (* PFNGLDELETENAMEDSTRINGARBPROC) (GLint namelen, const GLchar *name);
typedef void (* PFNGLCOMPILESHADERINCLUDEARBPROC) (GLuint shader, GLsizei count, const GLchar *const*path, const GLint *length);
typedef GLboolean (* PFNGLISNAMEDSTRINGARBPROC) (GLint namelen, const GLchar *name);
typedef void (* PFNGLGETNAMEDSTRINGARBPROC) (GLint namelen, const GLchar *name, GLsizei bufSize, GLint *stringlen, GLchar *string);
typedef void (* PFNGLGETNAMEDSTRINGIVARBPROC) (GLint namelen, const GLchar *name, GLenum pname, GLint *params);
void glNamedStringARB (GLenum type, GLint namelen, const GLchar *name, GLint stringlen, const GLchar *string);
void glDeleteNamedStringARB (GLint namelen, const GLchar *name);
void glCompileShaderIncludeARB (GLuint shader, GLsizei count, const GLchar *const*path, const GLint *length);
GLboolean glIsNamedStringARB (GLint namelen, const GLchar *name);
void glGetNamedStringARB (GLint namelen, const GLchar *name, GLsizei bufSize, GLint *stringlen, GLchar *string);

enum { GL_ARB_shading_language_packing = 1 };
enum {
    GL_ARB_sparse_buffer              = 1,
    GL_SPARSE_STORAGE_BIT_ARB         = 0x0400,
    GL_SPARSE_BUFFER_PAGE_SIZE_ARB    = 0x82F8
};
typedef void (* PFNGLBUFFERPAGECOMMITMENTARBPROC) (GLenum target, GLintptr offset, GLsizeiptr size, GLboolean commit);
typedef void (* PFNGLNAMEDBUFFERPAGECOMMITMENTEXTPROC) (GLuint buffer, GLintptr offset, GLsizeiptr size, GLboolean commit);
typedef void (* PFNGLNAMEDBUFFERPAGECOMMITMENTARBPROC) (GLuint buffer, GLintptr offset, GLsizeiptr size, GLboolean commit);

void glBufferPageCommitmentARB (GLenum target, GLintptr offset, GLsizeiptr size, GLboolean commit);
void glNamedBufferPageCommitmentEXT (GLuint buffer, GLintptr offset, GLsizeiptr size, GLboolean commit);
void glNamedBufferPageCommitmentARB (GLuint buffer, GLintptr offset, GLsizeiptr size, GLboolean commit);
enum {
    GL_ARB_sparse_texture             = 1,
    GL_TEXTURE_SPARSE_ARB             = 0x91A6,
    GL_VIRTUAL_PAGE_SIZE_INDEX_ARB    = 0x91A7,
    GL_NUM_SPARSE_LEVELS_ARB          = 0x91AA,
    GL_NUM_VIRTUAL_PAGE_SIZES_ARB     = 0x91A8,
    GL_VIRTUAL_PAGE_SIZE_X_ARB        = 0x9195,
    GL_VIRTUAL_PAGE_SIZE_Y_ARB        = 0x9196,
    GL_VIRTUAL_PAGE_SIZE_Z_ARB        = 0x9197,
    GL_MAX_SPARSE_TEXTURE_SIZE_ARB    = 0x9198,
    GL_MAX_SPARSE_3D_TEXTURE_SIZE_ARB = 0x9199,
    GL_MAX_SPARSE_ARRAY_TEXTURE_LAYERS_ARB = 0x919A,
    GL_SPARSE_TEXTURE_FULL_ARRAY_CUBE_MIPMAPS_ARB = 0x91A9
};
typedef void (* PFNGLTEXPAGECOMMITMENTARBPROC) (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLboolean commit);
void glTexPageCommitmentARB (GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLboolean commit);

enum { GL_ARB_sparse_texture2 = 1 };
enum { GL_ARB_sparse_texture_clamp = 1 };
enum { GL_ARB_spirv_extensions = 1 };
enum { GL_ARB_stencil_texturing = 1 };
enum { GL_ARB_sync = 1 };
enum { GL_ARB_tessellation_shader = 1 };
enum { GL_ARB_texture_barrier = 1 };
enum { GL_ARB_texture_border_clamp = 1 };
enum { GL_CLAMP_TO_BORDER_ARB = 0x812D };
enum {
    GL_ARB_texture_buffer_object      = 1,
    GL_TEXTURE_BUFFER_ARB             = 0x8C2A,
    GL_MAX_TEXTURE_BUFFER_SIZE_ARB    = 0x8C2B,
    GL_TEXTURE_BINDING_BUFFER_ARB     = 0x8C2C,
    GL_TEXTURE_BUFFER_DATA_STORE_BINDING_ARB = 0x8C2D,
    GL_TEXTURE_BUFFER_FORMAT_ARB      = 0x8C2E
};

typedef void (* PFNGLTEXBUFFERARBPROC) (GLenum target, GLenum internalformat, GLuint buffer);
void glTexBufferARB (GLenum target, GLenum internalformat, GLuint buffer);

enum { GL_ARB_texture_buffer_object_rgb32 = 1 };
enum { GL_ARB_texture_buffer_range = 1 };
enum {
    GL_ARB_texture_compression_bptc = 1,
    GL_COMPRESSED_RGBA_BPTC_UNORM_ARB = 0x8E8C,
    GL_COMPRESSED_SRGB_ALPHA_BPTC_UNORM_ARB = 0x8E8D,
    GL_COMPRESSED_RGB_BPTC_SIGNED_FLOAT_ARB = 0x8E8E,
    GL_COMPRESSED_RGB_BPTC_UNSIGNED_FLOAT_ARB = 0x8E8F
};
enum { GL_ARB_texture_compression_rgtc = 1 };
enum {
    GL_ARB_texture_cube_map_array = 1,
    GL_TEXTURE_CUBE_MAP_ARRAY_ARB     = 0x9009,
    GL_TEXTURE_BINDING_CUBE_MAP_ARRAY_ARB = 0x900A,
    GL_PROXY_TEXTURE_CUBE_MAP_ARRAY_ARB = 0x900B,
    GL_SAMPLER_CUBE_MAP_ARRAY_ARB     = 0x900C,
    GL_SAMPLER_CUBE_MAP_ARRAY_SHADOW_ARB = 0x900D,
    GL_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = 0x900E,
    GL_UNSIGNED_INT_SAMPLER_CUBE_MAP_ARRAY_ARB = 0x900F
};
enum { GL_ARB_texture_filter_anisotropic = 1 };
enum {
    GL_ARB_texture_filter_minmax = 1,
    GL_TEXTURE_REDUCTION_MODE_ARB     = 0x9366,
    GL_WEIGHTED_AVERAGE_ARB           = 0x9367
};
enum {
    GL_ARB_texture_gather = 1,
    GL_MIN_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = 0x8E5E,
    GL_MAX_PROGRAM_TEXTURE_GATHER_OFFSET_ARB = 0x8E5F,
    GL_MAX_PROGRAM_TEXTURE_GATHER_COMPONENTS_ARB = 0x8F9F
};
enum { GL_ARB_texture_mirror_clamp_to_edge = 1 };
enum {
    GL_ARB_texture_mirrored_repeat = 1,
    GL_MIRRORED_REPEAT_ARB         = 0x8370
};

enum { GL_ARB_texture_multisample = 1 };
enum { GL_ARB_texture_non_power_of_two = 1 };
enum { GL_ARB_texture_query_levels = 1 };
enum { GL_ARB_texture_query_lod = 1 };
enum { GL_ARB_texture_rg = 1 };
enum { GL_ARB_texture_rgb10_a2ui = 1 };
enum { GL_ARB_texture_stencil8 = 1 };
enum { GL_ARB_texture_storage = 1 };
enum { GL_ARB_texture_storage_multisample = 1 };
enum { GL_ARB_texture_swizzle = 1 };
enum { GL_ARB_texture_view = 1 };
enum { GL_ARB_timer_query = 1 };
enum { GL_ARB_transform_feedback2 = 1 };
enum { GL_ARB_transform_feedback3 = 1 };
enum { GL_ARB_transform_feedback_instanced = 1 };
enum {
    GL_ARB_transform_feedback_overflow_query = 1,
    GL_TRANSFORM_FEEDBACK_OVERFLOW_ARB = 0x82EC,
    GL_TRANSFORM_FEEDBACK_STREAM_OVERFLOW_ARB = 0x82ED
};

enum { GL_ARB_uniform_buffer_object = 1 };
enum { GL_ARB_vertex_array_bgra = 1 };
enum { GL_ARB_vertex_array_object = 1 };
enum { GL_ARB_vertex_attrib_64bit = 1 };
enum { GL_ARB_vertex_attrib_binding = 1 };
enum { GL_ARB_vertex_type_10f_11f_11f_rev = 1 };
enum { GL_ARB_vertex_type_2_10_10_10_rev = 1 };
enum { GL_ARB_viewport_array = 1 };
typedef void (* PFNGLDEPTHRANGEARRAYDVNVPROC) (GLuint first, GLsizei count, const GLdouble *v);
typedef void (* PFNGLDEPTHRANGEINDEXEDDNVPROC) (GLuint index, GLdouble n, GLdouble f);

void glDepthRangeArraydvNV (GLuint first, GLsizei count, const GLdouble *v);
void glDepthRangeIndexeddNV (GLuint index, GLdouble n, GLdouble f);

enum {
    GL_KHR_blend_equation_advanced    = 1,
    GL_MULTIPLY_KHR                   = 0x9294,
    GL_SCREEN_KHR                     = 0x9295,
    GL_OVERLAY_KHR                    = 0x9296,
    GL_DARKEN_KHR                     = 0x9297,
    GL_LIGHTEN_KHR                    = 0x9298,
    GL_COLORDODGE_KHR                 = 0x9299,
    GL_COLORBURN_KHR                  = 0x929A,
    GL_HARDLIGHT_KHR                  = 0x929B,
    GL_SOFTLIGHT_KHR                  = 0x929C,
    GL_DIFFERENCE_KHR                 = 0x929E,
    GL_EXCLUSION_KHR                  = 0x92A0,
    GL_HSL_HUE_KHR                    = 0x92AD,
    GL_HSL_SATURATION_KHR             = 0x92AE,
    GL_HSL_COLOR_KHR                  = 0x92AF,
    GL_HSL_LUMINOSITY_KHR             = 0x92B0
};
typedef void (* PFNGLBLENDBARRIERKHRPROC) (void);
void glBlendBarrierKHR (void);

enum {
    GL_KHR_blend_equation_advanced_coherent = 1,
    GL_BLEND_ADVANCED_COHERENT_KHR    = 0x9285
};

enum { GL_KHR_context_flush_control = 1 };
enum { GL_KHR_debug = 1 };
enum {
    GL_KHR_no_error = 1,
    GL_CONTEXT_FLAG_NO_ERROR_BIT_KHR  = 0x00000008
};

enum {
    GL_KHR_parallel_shader_compile = 1,
    GL_MAX_SHADER_COMPILER_THREADS_KHR = 0x91B0,
    GL_COMPLETION_STATUS_KHR          = 0x91B1
};
typedef void (* PFNGLMAXSHADERCOMPILERTHREADSKHRPROC) (GLuint count);
void glMaxShaderCompilerThreadsKHR (GLuint count);

enum { GL_KHR_robust_buffer_access_behavior = 1 };
enum {
    GL_KHR_robustness = 1,
    GL_CONTEXT_ROBUST_ACCESS          = 0x90F3
};

enum {
    GL_KHR_shader_subgroup = 1,
    GL_SUBGROUP_SIZE_KHR              = 0x9532,
    GL_SUBGROUP_SUPPORTED_STAGES_KHR  = 0x9533,
    GL_SUBGROUP_SUPPORTED_FEATURES_KHR = 0x9534,
    GL_SUBGROUP_QUAD_ALL_STAGES_KHR   = 0x9535,
    GL_SUBGROUP_FEATURE_BASIC_BIT_KHR = 0x00000001,
    GL_SUBGROUP_FEATURE_VOTE_BIT_KHR  = 0x00000002,
    GL_SUBGROUP_FEATURE_ARITHMETIC_BIT_KHR = 0x00000004,
    GL_SUBGROUP_FEATURE_BALLOT_BIT_KHR = 0x00000008,
    GL_SUBGROUP_FEATURE_SHUFFLE_BIT_KHR = 0x00000010,
    GL_SUBGROUP_FEATURE_SHUFFLE_RELATIVE_BIT_KHR = 0x00000020,
    GL_SUBGROUP_FEATURE_CLUSTERED_BIT_KHR = 0x00000040,
    GL_SUBGROUP_FEATURE_QUAD_BIT_KHR  = 0x00000080
};

enum {
    GL_KHR_texture_compression_astc_hdr = 1,
    GL_COMPRESSED_RGBA_ASTC_4x4_KHR   = 0x93B0,
    GL_COMPRESSED_RGBA_ASTC_5x4_KHR   = 0x93B1,
    GL_COMPRESSED_RGBA_ASTC_5x5_KHR   = 0x93B2,
    GL_COMPRESSED_RGBA_ASTC_6x5_KHR   = 0x93B3,
    GL_COMPRESSED_RGBA_ASTC_6x6_KHR   = 0x93B4,
    GL_COMPRESSED_RGBA_ASTC_8x5_KHR   = 0x93B5,
    GL_COMPRESSED_RGBA_ASTC_8x6_KHR   = 0x93B6,
    GL_COMPRESSED_RGBA_ASTC_8x8_KHR   = 0x93B7,
    GL_COMPRESSED_RGBA_ASTC_10x5_KHR  = 0x93B8,
    GL_COMPRESSED_RGBA_ASTC_10x6_KHR  = 0x93B9,
    GL_COMPRESSED_RGBA_ASTC_10x8_KHR  = 0x93BA,
    GL_COMPRESSED_RGBA_ASTC_10x10_KHR = 0x93BB,
    GL_COMPRESSED_RGBA_ASTC_12x10_KHR = 0x93BC,
    GL_COMPRESSED_RGBA_ASTC_12x12_KHR = 0x93BD,
    GL_COMPRESSED_SRGB8_ALPHA8_ASTC_4x4_KHR = 0x93D0,
    GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x4_KHR = 0x93D1,
    GL_COMPRESSED_SRGB8_ALPHA8_ASTC_5x5_KHR = 0x93D2,
    GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x5_KHR = 0x93D3,
    GL_COMPRESSED_SRGB8_ALPHA8_ASTC_6x6_KHR = 0x93D4,
    GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x5_KHR = 0x93D5,
    GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x6_KHR = 0x93D6,
    GL_COMPRESSED_SRGB8_ALPHA8_ASTC_8x8_KHR = 0x93D7,
    GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x5_KHR = 0x93D8,
    GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x6_KHR = 0x93D9,
    GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x8_KHR = 0x93DA,
    GL_COMPRESSED_SRGB8_ALPHA8_ASTC_10x10_KHR = 0x93DB,
    GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x10_KHR = 0x93DC,
    GL_COMPRESSED_SRGB8_ALPHA8_ASTC_12x12_KHR = 0x93DD
};

enum { GL_KHR_texture_compression_astc_ldr = 1 };
enum { GL_KHR_texture_compression_astc_sliced_3d = 1 };
enum {
    GL_AMD_framebuffer_multisample_advanced = 1,
    GL_RENDERBUFFER_STORAGE_SAMPLES_AMD = 0x91B2,
    GL_MAX_COLOR_FRAMEBUFFER_SAMPLES_AMD = 0x91B3,
    GL_MAX_COLOR_FRAMEBUFFER_STORAGE_SAMPLES_AMD = 0x91B4,
    GL_MAX_DEPTH_STENCIL_FRAMEBUFFER_SAMPLES_AMD = 0x91B5,
    GL_NUM_SUPPORTED_MULTISAMPLE_MODES_AMD = 0x91B6,
    GL_SUPPORTED_MULTISAMPLE_MODES_AMD = 0x91B7
};
typedef void (* PFNGLRENDERBUFFERSTORAGEMULTISAMPLEADVANCEDAMDPROC) (GLenum target, GLsizei samples, GLsizei storageSamples, GLenum internalformat, GLsizei width, GLsizei height);
typedef void (* PFNGLNAMEDRENDERBUFFERSTORAGEMULTISAMPLEADVANCEDAMDPROC) (GLuint renderbuffer, GLsizei samples, GLsizei storageSamples, GLenum internalformat, GLsizei width, GLsizei height);
void glRenderbufferStorageMultisampleAdvancedAMD (GLenum target, GLsizei samples, GLsizei storageSamples, GLenum internalformat, GLsizei width, GLsizei height);
void glNamedRenderbufferStorageMultisampleAdvancedAMD (GLuint renderbuffer, GLsizei samples, GLsizei storageSamples, GLenum internalformat, GLsizei width, GLsizei height);

enum {
    GL_AMD_performance_monitor        = 1,
    GL_COUNTER_TYPE_AMD               = 0x8BC0,
    GL_COUNTER_RANGE_AMD              = 0x8BC1,
    GL_UNSIGNED_INT64_AMD             = 0x8BC2,
    GL_PERCENTAGE_AMD                 = 0x8BC3,
    GL_PERFMON_RESULT_AVAILABLE_AMD   = 0x8BC4,
    GL_PERFMON_RESULT_SIZE_AMD        = 0x8BC5,
    GL_PERFMON_RESULT_AMD             = 0x8BC6
};
typedef void (* PFNGLGETPERFMONITORGROUPSAMDPROC) (GLint *numGroups, GLsizei groupsSize, GLuint *groups);
typedef void (* PFNGLGETPERFMONITORCOUNTERSAMDPROC) (GLuint group, GLint *numCounters, GLint *maxActiveCounters, GLsizei counterSize, GLuint *counters);
typedef void (* PFNGLGETPERFMONITORGROUPSTRINGAMDPROC) (GLuint group, GLsizei bufSize, GLsizei *length, GLchar *groupString);
typedef void (* PFNGLGETPERFMONITORCOUNTERSTRINGAMDPROC) (GLuint group, GLuint counter, GLsizei bufSize, GLsizei *length, GLchar *counterString);
typedef void (* PFNGLGETPERFMONITORCOUNTERINFOAMDPROC) (GLuint group, GLuint counter, GLenum pname, void *data);
typedef void (* PFNGLGENPERFMONITORSAMDPROC) (GLsizei n, GLuint *monitors);
typedef void (* PFNGLDELETEPERFMONITORSAMDPROC) (GLsizei n, GLuint *monitors);
typedef void (* PFNGLSELECTPERFMONITORCOUNTERSAMDPROC) (GLuint monitor, GLboolean enable, GLuint group, GLint numCounters, GLuint *counterList);
typedef void (* PFNGLBEGINPERFMONITORAMDPROC) (GLuint monitor);
typedef void (* PFNGLENDPERFMONITORAMDPROC) (GLuint monitor);
typedef void (* PFNGLGETPERFMONITORCOUNTERDATAAMDPROC) (GLuint monitor, GLenum pname, GLsizei dataSize, GLuint *data, GLint *bytesWritten);

void glGetPerfMonitorGroupsAMD (GLint *numGroups, GLsizei groupsSize, GLuint *groups);
void glGetPerfMonitorCountersAMD (GLuint group, GLint *numCounters, GLint *maxActiveCounters, GLsizei counterSize, GLuint *counters);
void glGetPerfMonitorGroupStringAMD (GLuint group, GLsizei bufSize, GLsizei *length, GLchar *groupString);
void glGetPerfMonitorCounterStringAMD (GLuint group, GLuint counter, GLsizei bufSize, GLsizei *length, GLchar *counterString);
void glGetPerfMonitorCounterInfoAMD (GLuint group, GLuint counter, GLenum pname, void *data);
void glGenPerfMonitorsAMD (GLsizei n, GLuint *monitors);
void glDeletePerfMonitorsAMD (GLsizei n, GLuint *monitors);
void glSelectPerfMonitorCountersAMD (GLuint monitor, GLboolean enable, GLuint group, GLint numCounters, GLuint *counterList);
void glBeginPerfMonitorAMD (GLuint monitor);
void glEndPerfMonitorAMD (GLuint monitor);
void glGetPerfMonitorCounterDataAMD (GLuint monitor, GLenum pname, GLsizei dataSize, GLuint *data, GLint *bytesWritten);

enum {
    GL_APPLE_rgb_422                  = 1,
    GL_RGB_422_APPLE                  = 0x8A1F,
    GL_UNSIGNED_SHORT_8_8_APPLE       = 0x85BA,
    GL_UNSIGNED_SHORT_8_8_REV_APPLE   = 0x85BB,
    GL_RGB_RAW_422_APPLE              = 0x8A51
};

enum { GL_EXT_EGL_image_storage = 1 };
typedef void *GLeglImageOES;
typedef void (* PFNGLEGLIMAGETARGETTEXSTORAGEEXTPROC) (GLenum target, GLeglImageOES image, const GLint* attrib_list);
typedef void (* PFNGLEGLIMAGETARGETTEXTURESTORAGEEXTPROC) (GLuint texture, GLeglImageOES image, const GLint* attrib_list);

void glEGLImageTargetTexStorageEXT (GLenum target, GLeglImageOES image, const GLint* attrib_list);
void glEGLImageTargetTextureStorageEXT (GLuint texture, GLeglImageOES image, const GLint* attrib_list);

enum { GL_EXT_EGL_sync = 1 };
enum {
    GL_EXT_debug_label                = 1,
    GL_PROGRAM_PIPELINE_OBJECT_EXT    = 0x8A4F,
    GL_PROGRAM_OBJECT_EXT             = 0x8B40,
    GL_SHADER_OBJECT_EXT              = 0x8B48,
    GL_BUFFER_OBJECT_EXT              = 0x9151,
    GL_QUERY_OBJECT_EXT               = 0x9153,
    GL_VERTEX_ARRAY_OBJECT_EXT        = 0x9154
};
typedef void (* PFNGLLABELOBJECTEXTPROC) (GLenum type, GLuint object, GLsizei length, const GLchar *label);
typedef void (* PFNGLGETOBJECTLABELEXTPROC) (GLenum type, GLuint object, GLsizei bufSize, GLsizei *length, GLchar *label);
void glLabelObjectEXT (GLenum type, GLuint object, GLsizei length, const GLchar *label);
void glGetObjectLabelEXT (GLenum type, GLuint object, GLsizei bufSize, GLsizei *length, GLchar *label);

enum { GL_EXT_debug_marker = 1 };
typedef void (* PFNGLINSERTEVENTMARKEREXTPROC) (GLsizei length, const GLchar *marker);
typedef void (* PFNGLPUSHGROUPMARKEREXTPROC) (GLsizei length, const GLchar *marker);
typedef void (* PFNGLPOPGROUPMARKEREXTPROC) (void);
void glInsertEventMarkerEXT (GLsizei length, const GLchar *marker);
void glPushGroupMarkerEXT (GLsizei length, const GLchar *marker);
void glPopGroupMarkerEXT (void);

enum {
    GL_EXT_direct_state_access        = 1,
    GL_PROGRAM_MATRIX_EXT             = 0x8E2D,
    GL_TRANSPOSE_PROGRAM_MATRIX_EXT   = 0x8E2E,
    GL_PROGRAM_MATRIX_STACK_DEPTH_EXT = 0x8E2F
};
typedef void (* PFNGLMATRIXLOADFEXTPROC) (GLenum mode, const GLfloat *m);
typedef void (* PFNGLMATRIXLOADDEXTPROC) (GLenum mode, const GLdouble *m);
typedef void (* PFNGLMATRIXMULTFEXTPROC) (GLenum mode, const GLfloat *m);
typedef void (* PFNGLMATRIXMULTDEXTPROC) (GLenum mode, const GLdouble *m);
typedef void (* PFNGLMATRIXLOADIDENTITYEXTPROC) (GLenum mode);
typedef void (* PFNGLMATRIXROTATEFEXTPROC) (GLenum mode, GLfloat angle, GLfloat x, GLfloat y, GLfloat z);
typedef void (* PFNGLMATRIXROTATEDEXTPROC) (GLenum mode, GLdouble angle, GLdouble x, GLdouble y, GLdouble z);
typedef void (* PFNGLMATRIXSCALEFEXTPROC) (GLenum mode, GLfloat x, GLfloat y, GLfloat z);
typedef void (* PFNGLMATRIXSCALEDEXTPROC) (GLenum mode, GLdouble x, GLdouble y, GLdouble z);
typedef void (* PFNGLMATRIXTRANSLATEFEXTPROC) (GLenum mode, GLfloat x, GLfloat y, GLfloat z);
typedef void (* PFNGLMATRIXTRANSLATEDEXTPROC) (GLenum mode, GLdouble x, GLdouble y, GLdouble z);
typedef void (* PFNGLMATRIXFRUSTUMEXTPROC) (GLenum mode, GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble zNear, GLdouble zFar);
typedef void (* PFNGLMATRIXORTHOEXTPROC) (GLenum mode, GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble zNear, GLdouble zFar);
typedef void (* PFNGLMATRIXPOPEXTPROC) (GLenum mode);
typedef void (* PFNGLMATRIXPUSHEXTPROC) (GLenum mode);
typedef void (* PFNGLCLIENTATTRIBDEFAULTEXTPROC) (GLbitfield mask);
typedef void (* PFNGLPUSHCLIENTATTRIBDEFAULTEXTPROC) (GLbitfield mask);
typedef void (* PFNGLTEXTUREPARAMETERFEXTPROC) (GLuint texture, GLenum target, GLenum pname, GLfloat param);
typedef void (* PFNGLTEXTUREPARAMETERFVEXTPROC) (GLuint texture, GLenum target, GLenum pname, const GLfloat *params);
typedef void (* PFNGLTEXTUREPARAMETERIEXTPROC) (GLuint texture, GLenum target, GLenum pname, GLint param);
typedef void (* PFNGLTEXTUREPARAMETERIVEXTPROC) (GLuint texture, GLenum target, GLenum pname, const GLint *params);
typedef void (* PFNGLTEXTUREIMAGE1DEXTPROC) (GLuint texture, GLenum target, GLint level, GLint internalformat, GLsizei width, GLint border, GLenum format, GLenum type, const void *pixels);
typedef void (* PFNGLTEXTUREIMAGE2DEXTPROC) (GLuint texture, GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const void *pixels);
typedef void (* PFNGLTEXTURESUBIMAGE1DEXTPROC) (GLuint texture, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const void *pixels);
typedef void (* PFNGLTEXTURESUBIMAGE2DEXTPROC) (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *pixels);
typedef void (* PFNGLCOPYTEXTUREIMAGE1DEXTPROC) (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border);
typedef void (* PFNGLCOPYTEXTUREIMAGE2DEXTPROC) (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
typedef void (* PFNGLCOPYTEXTURESUBIMAGE1DEXTPROC) (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width);
typedef void (* PFNGLCOPYTEXTURESUBIMAGE2DEXTPROC) (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
typedef void (* PFNGLGETTEXTUREIMAGEEXTPROC) (GLuint texture, GLenum target, GLint level, GLenum format, GLenum type, void *pixels);
typedef void (* PFNGLGETTEXTUREPARAMETERFVEXTPROC) (GLuint texture, GLenum target, GLenum pname, GLfloat *params);
typedef void (* PFNGLGETTEXTUREPARAMETERIVEXTPROC) (GLuint texture, GLenum target, GLenum pname, GLint *params);
typedef void (* PFNGLGETTEXTURELEVELPARAMETERFVEXTPROC) (GLuint texture, GLenum target, GLint level, GLenum pname, GLfloat *params);
typedef void (* PFNGLGETTEXTURELEVELPARAMETERIVEXTPROC) (GLuint texture, GLenum target, GLint level, GLenum pname, GLint *params);
typedef void (* PFNGLTEXTUREIMAGE3DEXTPROC) (GLuint texture, GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const void *pixels);
typedef void (* PFNGLTEXTURESUBIMAGE3DEXTPROC) (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *pixels);
typedef void (* PFNGLCOPYTEXTURESUBIMAGE3DEXTPROC) (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
typedef void (* PFNGLBINDMULTITEXTUREEXTPROC) (GLenum texunit, GLenum target, GLuint texture);
typedef void (* PFNGLMULTITEXCOORDPOINTEREXTPROC) (GLenum texunit, GLint size, GLenum type, GLsizei stride, const void *pointer);
typedef void (* PFNGLMULTITEXENVFEXTPROC) (GLenum texunit, GLenum target, GLenum pname, GLfloat param);
typedef void (* PFNGLMULTITEXENVFVEXTPROC) (GLenum texunit, GLenum target, GLenum pname, const GLfloat *params);
typedef void (* PFNGLMULTITEXENVIEXTPROC) (GLenum texunit, GLenum target, GLenum pname, GLint param);
typedef void (* PFNGLMULTITEXENVIVEXTPROC) (GLenum texunit, GLenum target, GLenum pname, const GLint *params);
typedef void (* PFNGLMULTITEXGENDEXTPROC) (GLenum texunit, GLenum coord, GLenum pname, GLdouble param);
typedef void (* PFNGLMULTITEXGENDVEXTPROC) (GLenum texunit, GLenum coord, GLenum pname, const GLdouble *params);
typedef void (* PFNGLMULTITEXGENFEXTPROC) (GLenum texunit, GLenum coord, GLenum pname, GLfloat param);
typedef void (* PFNGLMULTITEXGENFVEXTPROC) (GLenum texunit, GLenum coord, GLenum pname, const GLfloat *params);
typedef void (* PFNGLMULTITEXGENIEXTPROC) (GLenum texunit, GLenum coord, GLenum pname, GLint param);
typedef void (* PFNGLMULTITEXGENIVEXTPROC) (GLenum texunit, GLenum coord, GLenum pname, const GLint *params);
typedef void (* PFNGLGETMULTITEXENVFVEXTPROC) (GLenum texunit, GLenum target, GLenum pname, GLfloat *params);
typedef void (* PFNGLGETMULTITEXENVIVEXTPROC) (GLenum texunit, GLenum target, GLenum pname, GLint *params);
typedef void (* PFNGLGETMULTITEXGENDVEXTPROC) (GLenum texunit, GLenum coord, GLenum pname, GLdouble *params);
typedef void (* PFNGLGETMULTITEXGENFVEXTPROC) (GLenum texunit, GLenum coord, GLenum pname, GLfloat *params);
typedef void (* PFNGLGETMULTITEXGENIVEXTPROC) (GLenum texunit, GLenum coord, GLenum pname, GLint *params);
typedef void (* PFNGLMULTITEXPARAMETERIEXTPROC) (GLenum texunit, GLenum target, GLenum pname, GLint param);
typedef void (* PFNGLMULTITEXPARAMETERIVEXTPROC) (GLenum texunit, GLenum target, GLenum pname, const GLint *params);
typedef void (* PFNGLMULTITEXPARAMETERFEXTPROC) (GLenum texunit, GLenum target, GLenum pname, GLfloat param);
typedef void (* PFNGLMULTITEXPARAMETERFVEXTPROC) (GLenum texunit, GLenum target, GLenum pname, const GLfloat *params);
typedef void (* PFNGLMULTITEXIMAGE1DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLint internalformat, GLsizei width, GLint border, GLenum format, GLenum type, const void *pixels);
typedef void (* PFNGLMULTITEXIMAGE2DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const void *pixels);
typedef void (* PFNGLMULTITEXSUBIMAGE1DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const void *pixels);
typedef void (* PFNGLMULTITEXSUBIMAGE2DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *pixels);
typedef void (* PFNGLCOPYMULTITEXIMAGE1DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border);
typedef void (* PFNGLCOPYMULTITEXIMAGE2DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
typedef void (* PFNGLCOPYMULTITEXSUBIMAGE1DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width);
typedef void (* PFNGLCOPYMULTITEXSUBIMAGE2DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
typedef void (* PFNGLGETMULTITEXIMAGEEXTPROC) (GLenum texunit, GLenum target, GLint level, GLenum format, GLenum type, void *pixels);
typedef void (* PFNGLGETMULTITEXPARAMETERFVEXTPROC) (GLenum texunit, GLenum target, GLenum pname, GLfloat *params);
typedef void (* PFNGLGETMULTITEXPARAMETERIVEXTPROC) (GLenum texunit, GLenum target, GLenum pname, GLint *params);
typedef void (* PFNGLGETMULTITEXLEVELPARAMETERFVEXTPROC) (GLenum texunit, GLenum target, GLint level, GLenum pname, GLfloat *params);
typedef void (* PFNGLGETMULTITEXLEVELPARAMETERIVEXTPROC) (GLenum texunit, GLenum target, GLint level, GLenum pname, GLint *params);
typedef void (* PFNGLMULTITEXIMAGE3DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const void *pixels);
typedef void (* PFNGLMULTITEXSUBIMAGE3DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *pixels);
typedef void (* PFNGLCOPYMULTITEXSUBIMAGE3DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
typedef void (* PFNGLENABLECLIENTSTATEINDEXEDEXTPROC) (GLenum array, GLuint index);
typedef void (* PFNGLDISABLECLIENTSTATEINDEXEDEXTPROC) (GLenum array, GLuint index);
typedef void (* PFNGLGETFLOATINDEXEDVEXTPROC) (GLenum target, GLuint index, GLfloat *data);
typedef void (* PFNGLGETDOUBLEINDEXEDVEXTPROC) (GLenum target, GLuint index, GLdouble *data);
typedef void (* PFNGLGETPOINTERINDEXEDVEXTPROC) (GLenum target, GLuint index, void **data);
typedef void (* PFNGLENABLEINDEXEDEXTPROC) (GLenum target, GLuint index);
typedef void (* PFNGLDISABLEINDEXEDEXTPROC) (GLenum target, GLuint index);
typedef GLboolean (* PFNGLISENABLEDINDEXEDEXTPROC) (GLenum target, GLuint index);
typedef void (* PFNGLGETINTEGERINDEXEDVEXTPROC) (GLenum target, GLuint index, GLint *data);
typedef void (* PFNGLGETBOOLEANINDEXEDVEXTPROC) (GLenum target, GLuint index, GLboolean *data);
typedef void (* PFNGLCOMPRESSEDTEXTUREIMAGE3DEXTPROC) (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const void *bits);
typedef void (* PFNGLCOMPRESSEDTEXTUREIMAGE2DEXTPROC) (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const void *bits);
typedef void (* PFNGLCOMPRESSEDTEXTUREIMAGE1DEXTPROC) (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const void *bits);
typedef void (* PFNGLCOMPRESSEDTEXTURESUBIMAGE3DEXTPROC) (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *bits);
typedef void (* PFNGLCOMPRESSEDTEXTURESUBIMAGE2DEXTPROC) (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *bits);
typedef void (* PFNGLCOMPRESSEDTEXTURESUBIMAGE1DEXTPROC) (GLuint texture, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const void *bits);
typedef void (* PFNGLGETCOMPRESSEDTEXTUREIMAGEEXTPROC) (GLuint texture, GLenum target, GLint lod, void *img);
typedef void (* PFNGLCOMPRESSEDMULTITEXIMAGE3DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const void *bits);
typedef void (* PFNGLCOMPRESSEDMULTITEXIMAGE2DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const void *bits);
typedef void (* PFNGLCOMPRESSEDMULTITEXIMAGE1DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const void *bits);
typedef void (* PFNGLCOMPRESSEDMULTITEXSUBIMAGE3DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *bits);
typedef void (* PFNGLCOMPRESSEDMULTITEXSUBIMAGE2DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *bits);
typedef void (* PFNGLCOMPRESSEDMULTITEXSUBIMAGE1DEXTPROC) (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const void *bits);
typedef void (* PFNGLGETCOMPRESSEDMULTITEXIMAGEEXTPROC) (GLenum texunit, GLenum target, GLint lod, void *img);
typedef void (* PFNGLMATRIXLOADTRANSPOSEFEXTPROC) (GLenum mode, const GLfloat *m);
typedef void (* PFNGLMATRIXLOADTRANSPOSEDEXTPROC) (GLenum mode, const GLdouble *m);
typedef void (* PFNGLMATRIXMULTTRANSPOSEFEXTPROC) (GLenum mode, const GLfloat *m);
typedef void (* PFNGLMATRIXMULTTRANSPOSEDEXTPROC) (GLenum mode, const GLdouble *m);
typedef void (* PFNGLNAMEDBUFFERDATAEXTPROC) (GLuint buffer, GLsizeiptr size, const void *data, GLenum usage);
typedef void (* PFNGLNAMEDBUFFERSUBDATAEXTPROC) (GLuint buffer, GLintptr offset, GLsizeiptr size, const void *data);
typedef void *(* PFNGLMAPNAMEDBUFFEREXTPROC) (GLuint buffer, GLenum access);
typedef GLboolean (* PFNGLUNMAPNAMEDBUFFEREXTPROC) (GLuint buffer);
typedef void (* PFNGLGETNAMEDBUFFERPARAMETERIVEXTPROC) (GLuint buffer, GLenum pname, GLint *params);
typedef void (* PFNGLGETNAMEDBUFFERPOINTERVEXTPROC) (GLuint buffer, GLenum pname, void **params);
typedef void (* PFNGLGETNAMEDBUFFERSUBDATAEXTPROC) (GLuint buffer, GLintptr offset, GLsizeiptr size, void *data);
typedef void (* PFNGLPROGRAMUNIFORM1FEXTPROC) (GLuint program, GLint location, GLfloat v0);
typedef void (* PFNGLPROGRAMUNIFORM2FEXTPROC) (GLuint program, GLint location, GLfloat v0, GLfloat v1);
typedef void (* PFNGLPROGRAMUNIFORM3FEXTPROC) (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
typedef void (* PFNGLPROGRAMUNIFORM4FEXTPROC) (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
typedef void (* PFNGLPROGRAMUNIFORM1IEXTPROC) (GLuint program, GLint location, GLint v0);
typedef void (* PFNGLPROGRAMUNIFORM2IEXTPROC) (GLuint program, GLint location, GLint v0, GLint v1);
typedef void (* PFNGLPROGRAMUNIFORM3IEXTPROC) (GLuint program, GLint location, GLint v0, GLint v1, GLint v2);
typedef void (* PFNGLPROGRAMUNIFORM4IEXTPROC) (GLuint program, GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
typedef void (* PFNGLPROGRAMUNIFORM1FVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORM2FVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORM3FVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORM4FVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORM1IVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLint *value);
typedef void (* PFNGLPROGRAMUNIFORM2IVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLint *value);
typedef void (* PFNGLPROGRAMUNIFORM3IVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLint *value);
typedef void (* PFNGLPROGRAMUNIFORM4IVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLint *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX2FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX3FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX4FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX2X3FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX3X2FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX2X4FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX4X2FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX3X4FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX4X3FVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
typedef void (* PFNGLTEXTUREBUFFEREXTPROC) (GLuint texture, GLenum target, GLenum internalformat, GLuint buffer);
typedef void (* PFNGLMULTITEXBUFFEREXTPROC) (GLenum texunit, GLenum target, GLenum internalformat, GLuint buffer);
typedef void (* PFNGLTEXTUREPARAMETERIIVEXTPROC) (GLuint texture, GLenum target, GLenum pname, const GLint *params);
typedef void (* PFNGLTEXTUREPARAMETERIUIVEXTPROC) (GLuint texture, GLenum target, GLenum pname, const GLuint *params);
typedef void (* PFNGLGETTEXTUREPARAMETERIIVEXTPROC) (GLuint texture, GLenum target, GLenum pname, GLint *params);
typedef void (* PFNGLGETTEXTUREPARAMETERIUIVEXTPROC) (GLuint texture, GLenum target, GLenum pname, GLuint *params);
typedef void (* PFNGLMULTITEXPARAMETERIIVEXTPROC) (GLenum texunit, GLenum target, GLenum pname, const GLint *params);
typedef void (* PFNGLMULTITEXPARAMETERIUIVEXTPROC) (GLenum texunit, GLenum target, GLenum pname, const GLuint *params);
typedef void (* PFNGLGETMULTITEXPARAMETERIIVEXTPROC) (GLenum texunit, GLenum target, GLenum pname, GLint *params);
typedef void (* PFNGLGETMULTITEXPARAMETERIUIVEXTPROC) (GLenum texunit, GLenum target, GLenum pname, GLuint *params);
typedef void (* PFNGLPROGRAMUNIFORM1UIEXTPROC) (GLuint program, GLint location, GLuint v0);
typedef void (* PFNGLPROGRAMUNIFORM2UIEXTPROC) (GLuint program, GLint location, GLuint v0, GLuint v1);
typedef void (* PFNGLPROGRAMUNIFORM3UIEXTPROC) (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2);
typedef void (* PFNGLPROGRAMUNIFORM4UIEXTPROC) (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3);
typedef void (* PFNGLPROGRAMUNIFORM1UIVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLuint *value);
typedef void (* PFNGLPROGRAMUNIFORM2UIVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLuint *value);
typedef void (* PFNGLPROGRAMUNIFORM3UIVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLuint *value);
typedef void (* PFNGLPROGRAMUNIFORM4UIVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLuint *value);
typedef void (* PFNGLNAMEDPROGRAMLOCALPARAMETERS4FVEXTPROC) (GLuint program, GLenum target, GLuint index, GLsizei count, const GLfloat *params);
typedef void (* PFNGLNAMEDPROGRAMLOCALPARAMETERI4IEXTPROC) (GLuint program, GLenum target, GLuint index, GLint x, GLint y, GLint z, GLint w);
typedef void (* PFNGLNAMEDPROGRAMLOCALPARAMETERI4IVEXTPROC) (GLuint program, GLenum target, GLuint index, const GLint *params);
typedef void (* PFNGLNAMEDPROGRAMLOCALPARAMETERSI4IVEXTPROC) (GLuint program, GLenum target, GLuint index, GLsizei count, const GLint *params);
typedef void (* PFNGLNAMEDPROGRAMLOCALPARAMETERI4UIEXTPROC) (GLuint program, GLenum target, GLuint index, GLuint x, GLuint y, GLuint z, GLuint w);
typedef void (* PFNGLNAMEDPROGRAMLOCALPARAMETERI4UIVEXTPROC) (GLuint program, GLenum target, GLuint index, const GLuint *params);
typedef void (* PFNGLNAMEDPROGRAMLOCALPARAMETERSI4UIVEXTPROC) (GLuint program, GLenum target, GLuint index, GLsizei count, const GLuint *params);
typedef void (* PFNGLGETNAMEDPROGRAMLOCALPARAMETERIIVEXTPROC) (GLuint program, GLenum target, GLuint index, GLint *params);
typedef void (* PFNGLGETNAMEDPROGRAMLOCALPARAMETERIUIVEXTPROC) (GLuint program, GLenum target, GLuint index, GLuint *params);
typedef void (* PFNGLENABLECLIENTSTATEIEXTPROC) (GLenum array, GLuint index);
typedef void (* PFNGLDISABLECLIENTSTATEIEXTPROC) (GLenum array, GLuint index);
typedef void (* PFNGLGETFLOATI_VEXTPROC) (GLenum pname, GLuint index, GLfloat *params);
typedef void (* PFNGLGETDOUBLEI_VEXTPROC) (GLenum pname, GLuint index, GLdouble *params);
typedef void (* PFNGLGETPOINTERI_VEXTPROC) (GLenum pname, GLuint index, void **params);
typedef void (* PFNGLNAMEDPROGRAMSTRINGEXTPROC) (GLuint program, GLenum target, GLenum format, GLsizei len, const void *string);
typedef void (* PFNGLNAMEDPROGRAMLOCALPARAMETER4DEXTPROC) (GLuint program, GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
typedef void (* PFNGLNAMEDPROGRAMLOCALPARAMETER4DVEXTPROC) (GLuint program, GLenum target, GLuint index, const GLdouble *params);
typedef void (* PFNGLNAMEDPROGRAMLOCALPARAMETER4FEXTPROC) (GLuint program, GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
typedef void (* PFNGLNAMEDPROGRAMLOCALPARAMETER4FVEXTPROC) (GLuint program, GLenum target, GLuint index, const GLfloat *params);
typedef void (* PFNGLGETNAMEDPROGRAMLOCALPARAMETERDVEXTPROC) (GLuint program, GLenum target, GLuint index, GLdouble *params);
typedef void (* PFNGLGETNAMEDPROGRAMLOCALPARAMETERFVEXTPROC) (GLuint program, GLenum target, GLuint index, GLfloat *params);
typedef void (* PFNGLGETNAMEDPROGRAMIVEXTPROC) (GLuint program, GLenum target, GLenum pname, GLint *params);
typedef void (* PFNGLGETNAMEDPROGRAMSTRINGEXTPROC) (GLuint program, GLenum target, GLenum pname, void *string);
typedef void (* PFNGLNAMEDRENDERBUFFERSTORAGEEXTPROC) (GLuint renderbuffer, GLenum internalformat, GLsizei width, GLsizei height);
typedef void (* PFNGLGETNAMEDRENDERBUFFERPARAMETERIVEXTPROC) (GLuint renderbuffer, GLenum pname, GLint *params);
typedef void (* PFNGLNAMEDRENDERBUFFERSTORAGEMULTISAMPLEEXTPROC) (GLuint renderbuffer, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
typedef void (* PFNGLNAMEDRENDERBUFFERSTORAGEMULTISAMPLECOVERAGEEXTPROC) (GLuint renderbuffer, GLsizei coverageSamples, GLsizei colorSamples, GLenum internalformat, GLsizei width, GLsizei height);
typedef GLenum (* PFNGLCHECKNAMEDFRAMEBUFFERSTATUSEXTPROC) (GLuint framebuffer, GLenum target);
typedef void (* PFNGLNAMEDFRAMEBUFFERTEXTURE1DEXTPROC) (GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
typedef void (* PFNGLNAMEDFRAMEBUFFERTEXTURE2DEXTPROC) (GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
typedef void (* PFNGLNAMEDFRAMEBUFFERTEXTURE3DEXTPROC) (GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset);
typedef void (* PFNGLNAMEDFRAMEBUFFERRENDERBUFFEREXTPROC) (GLuint framebuffer, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer);
typedef void (* PFNGLGETNAMEDFRAMEBUFFERATTACHMENTPARAMETERIVEXTPROC) (GLuint framebuffer, GLenum attachment, GLenum pname, GLint *params);
typedef void (* PFNGLGENERATETEXTUREMIPMAPEXTPROC) (GLuint texture, GLenum target);
typedef void (* PFNGLGENERATEMULTITEXMIPMAPEXTPROC) (GLenum texunit, GLenum target);
typedef void (* PFNGLFRAMEBUFFERDRAWBUFFEREXTPROC) (GLuint framebuffer, GLenum mode);
typedef void (* PFNGLFRAMEBUFFERDRAWBUFFERSEXTPROC) (GLuint framebuffer, GLsizei n, const GLenum *bufs);
typedef void (* PFNGLFRAMEBUFFERREADBUFFEREXTPROC) (GLuint framebuffer, GLenum mode);
typedef void (* PFNGLGETFRAMEBUFFERPARAMETERIVEXTPROC) (GLuint framebuffer, GLenum pname, GLint *params);
typedef void (* PFNGLNAMEDCOPYBUFFERSUBDATAEXTPROC) (GLuint readBuffer, GLuint writeBuffer, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size);
typedef void (* PFNGLNAMEDFRAMEBUFFERTEXTUREEXTPROC) (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level);
typedef void (* PFNGLNAMEDFRAMEBUFFERTEXTURELAYEREXTPROC) (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level, GLint layer);
typedef void (* PFNGLNAMEDFRAMEBUFFERTEXTUREFACEEXTPROC) (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level, GLenum face);
typedef void (* PFNGLTEXTURERENDERBUFFEREXTPROC) (GLuint texture, GLenum target, GLuint renderbuffer);
typedef void (* PFNGLMULTITEXRENDERBUFFEREXTPROC) (GLenum texunit, GLenum target, GLuint renderbuffer);
typedef void (* PFNGLVERTEXARRAYVERTEXOFFSETEXTPROC) (GLuint vaobj, GLuint buffer, GLint size, GLenum type, GLsizei stride, GLintptr offset);
typedef void (* PFNGLVERTEXARRAYCOLOROFFSETEXTPROC) (GLuint vaobj, GLuint buffer, GLint size, GLenum type, GLsizei stride, GLintptr offset);
typedef void (* PFNGLVERTEXARRAYEDGEFLAGOFFSETEXTPROC) (GLuint vaobj, GLuint buffer, GLsizei stride, GLintptr offset);
typedef void (* PFNGLVERTEXARRAYINDEXOFFSETEXTPROC) (GLuint vaobj, GLuint buffer, GLenum type, GLsizei stride, GLintptr offset);
typedef void (* PFNGLVERTEXARRAYNORMALOFFSETEXTPROC) (GLuint vaobj, GLuint buffer, GLenum type, GLsizei stride, GLintptr offset);
typedef void (* PFNGLVERTEXARRAYTEXCOORDOFFSETEXTPROC) (GLuint vaobj, GLuint buffer, GLint size, GLenum type, GLsizei stride, GLintptr offset);
typedef void (* PFNGLVERTEXARRAYMULTITEXCOORDOFFSETEXTPROC) (GLuint vaobj, GLuint buffer, GLenum texunit, GLint size, GLenum type, GLsizei stride, GLintptr offset);
typedef void (* PFNGLVERTEXARRAYFOGCOORDOFFSETEXTPROC) (GLuint vaobj, GLuint buffer, GLenum type, GLsizei stride, GLintptr offset);
typedef void (* PFNGLVERTEXARRAYSECONDARYCOLOROFFSETEXTPROC) (GLuint vaobj, GLuint buffer, GLint size, GLenum type, GLsizei stride, GLintptr offset);
typedef void (* PFNGLVERTEXARRAYVERTEXATTRIBOFFSETEXTPROC) (GLuint vaobj, GLuint buffer, GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, GLintptr offset);
typedef void (* PFNGLVERTEXARRAYVERTEXATTRIBIOFFSETEXTPROC) (GLuint vaobj, GLuint buffer, GLuint index, GLint size, GLenum type, GLsizei stride, GLintptr offset);
typedef void (* PFNGLENABLEVERTEXARRAYEXTPROC) (GLuint vaobj, GLenum array);
typedef void (* PFNGLDISABLEVERTEXARRAYEXTPROC) (GLuint vaobj, GLenum array);
typedef void (* PFNGLENABLEVERTEXARRAYATTRIBEXTPROC) (GLuint vaobj, GLuint index);
typedef void (* PFNGLDISABLEVERTEXARRAYATTRIBEXTPROC) (GLuint vaobj, GLuint index);
typedef void (* PFNGLGETVERTEXARRAYINTEGERVEXTPROC) (GLuint vaobj, GLenum pname, GLint *param);
typedef void (* PFNGLGETVERTEXARRAYPOINTERVEXTPROC) (GLuint vaobj, GLenum pname, void **param);
typedef void (* PFNGLGETVERTEXARRAYINTEGERI_VEXTPROC) (GLuint vaobj, GLuint index, GLenum pname, GLint *param);
typedef void (* PFNGLGETVERTEXARRAYPOINTERI_VEXTPROC) (GLuint vaobj, GLuint index, GLenum pname, void **param);
typedef void *(* PFNGLMAPNAMEDBUFFERRANGEEXTPROC) (GLuint buffer, GLintptr offset, GLsizeiptr length, GLbitfield access);
typedef void (* PFNGLFLUSHMAPPEDNAMEDBUFFERRANGEEXTPROC) (GLuint buffer, GLintptr offset, GLsizeiptr length);
typedef void (* PFNGLNAMEDBUFFERSTORAGEEXTPROC) (GLuint buffer, GLsizeiptr size, const void *data, GLbitfield flags);
typedef void (* PFNGLCLEARNAMEDBUFFERDATAEXTPROC) (GLuint buffer, GLenum internalformat, GLenum format, GLenum type, const void *data);
typedef void (* PFNGLCLEARNAMEDBUFFERSUBDATAEXTPROC) (GLuint buffer, GLenum internalformat, GLsizeiptr offset, GLsizeiptr size, GLenum format, GLenum type, const void *data);
typedef void (* PFNGLNAMEDFRAMEBUFFERPARAMETERIEXTPROC) (GLuint framebuffer, GLenum pname, GLint param);
typedef void (* PFNGLGETNAMEDFRAMEBUFFERPARAMETERIVEXTPROC) (GLuint framebuffer, GLenum pname, GLint *params);
typedef void (* PFNGLPROGRAMUNIFORM1DEXTPROC) (GLuint program, GLint location, GLdouble x);
typedef void (* PFNGLPROGRAMUNIFORM2DEXTPROC) (GLuint program, GLint location, GLdouble x, GLdouble y);
typedef void (* PFNGLPROGRAMUNIFORM3DEXTPROC) (GLuint program, GLint location, GLdouble x, GLdouble y, GLdouble z);
typedef void (* PFNGLPROGRAMUNIFORM4DEXTPROC) (GLuint program, GLint location, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
typedef void (* PFNGLPROGRAMUNIFORM1DVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORM2DVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORM3DVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORM4DVEXTPROC) (GLuint program, GLint location, GLsizei count, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX2DVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX3DVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX4DVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX2X3DVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX2X4DVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX3X2DVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX3X4DVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX4X2DVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLPROGRAMUNIFORMMATRIX4X3DVEXTPROC) (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
typedef void (* PFNGLTEXTUREBUFFERRANGEEXTPROC) (GLuint texture, GLenum target, GLenum internalformat, GLuint buffer, GLintptr offset, GLsizeiptr size);
typedef void (* PFNGLTEXTURESTORAGE1DEXTPROC) (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width);
typedef void (* PFNGLTEXTURESTORAGE2DEXTPROC) (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
typedef void (* PFNGLTEXTURESTORAGE3DEXTPROC) (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
typedef void (* PFNGLTEXTURESTORAGE2DMULTISAMPLEEXTPROC) (GLuint texture, GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations);
typedef void (* PFNGLTEXTURESTORAGE3DMULTISAMPLEEXTPROC) (GLuint texture, GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations);
typedef void (* PFNGLVERTEXARRAYBINDVERTEXBUFFEREXTPROC) (GLuint vaobj, GLuint bindingindex, GLuint buffer, GLintptr offset, GLsizei stride);
typedef void (* PFNGLVERTEXARRAYVERTEXATTRIBFORMATEXTPROC) (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLboolean normalized, GLuint relativeoffset);
typedef void (* PFNGLVERTEXARRAYVERTEXATTRIBIFORMATEXTPROC) (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset);
typedef void (* PFNGLVERTEXARRAYVERTEXATTRIBLFORMATEXTPROC) (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset);
typedef void (* PFNGLVERTEXARRAYVERTEXATTRIBBINDINGEXTPROC) (GLuint vaobj, GLuint attribindex, GLuint bindingindex);
typedef void (* PFNGLVERTEXARRAYVERTEXBINDINGDIVISOREXTPROC) (GLuint vaobj, GLuint bindingindex, GLuint divisor);
typedef void (* PFNGLVERTEXARRAYVERTEXATTRIBLOFFSETEXTPROC) (GLuint vaobj, GLuint buffer, GLuint index, GLint size, GLenum type, GLsizei stride, GLintptr offset);
typedef void (* PFNGLTEXTUREPAGECOMMITMENTEXTPROC) (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLboolean commit);
typedef void (* PFNGLVERTEXARRAYVERTEXATTRIBDIVISOREXTPROC) (GLuint vaobj, GLuint index, GLuint divisor);

void glMatrixLoadfEXT (GLenum mode, const GLfloat *m);
void glMatrixLoaddEXT (GLenum mode, const GLdouble *m);
void glMatrixMultfEXT (GLenum mode, const GLfloat *m);
void glMatrixMultdEXT (GLenum mode, const GLdouble *m);
void glMatrixLoadIdentityEXT (GLenum mode);
void glMatrixRotatefEXT (GLenum mode, GLfloat angle, GLfloat x, GLfloat y, GLfloat z);
void glMatrixRotatedEXT (GLenum mode, GLdouble angle, GLdouble x, GLdouble y, GLdouble z);
void glMatrixScalefEXT (GLenum mode, GLfloat x, GLfloat y, GLfloat z);
void glMatrixScaledEXT (GLenum mode, GLdouble x, GLdouble y, GLdouble z);
void glMatrixTranslatefEXT (GLenum mode, GLfloat x, GLfloat y, GLfloat z);
void glMatrixTranslatedEXT (GLenum mode, GLdouble x, GLdouble y, GLdouble z);
void glMatrixFrustumEXT (GLenum mode, GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble zNear, GLdouble zFar);
void glMatrixOrthoEXT (GLenum mode, GLdouble left, GLdouble right, GLdouble bottom, GLdouble top, GLdouble zNear, GLdouble zFar);
void glMatrixPopEXT (GLenum mode);
void glMatrixPushEXT (GLenum mode);
void glClientAttribDefaultEXT (GLbitfield mask);
void glPushClientAttribDefaultEXT (GLbitfield mask);
void glTextureParameterfEXT (GLuint texture, GLenum target, GLenum pname, GLfloat param);
void glTextureParameterfvEXT (GLuint texture, GLenum target, GLenum pname, const GLfloat *params);
void glTextureParameteriEXT (GLuint texture, GLenum target, GLenum pname, GLint param);
void glTextureParameterivEXT (GLuint texture, GLenum target, GLenum pname, const GLint *params);
void glTextureImage1DEXT (GLuint texture, GLenum target, GLint level, GLint internalformat, GLsizei width, GLint border, GLenum format, GLenum type, const void *pixels);
void glTextureImage2DEXT (GLuint texture, GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const void *pixels);
void glTextureSubImage1DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const void *pixels);
void glTextureSubImage2DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *pixels);
void glCopyTextureImage1DEXT (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border);
void glCopyTextureImage2DEXT (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
void glCopyTextureSubImage1DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width);
void glCopyTextureSubImage2DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
void glGetTextureImageEXT (GLuint texture, GLenum target, GLint level, GLenum format, GLenum type, void *pixels);
void glGetTextureParameterfvEXT (GLuint texture, GLenum target, GLenum pname, GLfloat *params);
void glGetTextureParameterivEXT (GLuint texture, GLenum target, GLenum pname, GLint *params);
void glGetTextureLevelParameterfvEXT (GLuint texture, GLenum target, GLint level, GLenum pname, GLfloat *params);
void glGetTextureLevelParameterivEXT (GLuint texture, GLenum target, GLint level, GLenum pname, GLint *params);
void glTextureImage3DEXT (GLuint texture, GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const void *pixels);
void glTextureSubImage3DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *pixels);
void glCopyTextureSubImage3DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
void glBindMultiTextureEXT (GLenum texunit, GLenum target, GLuint texture);
void glMultiTexCoordPointerEXT (GLenum texunit, GLint size, GLenum type, GLsizei stride, const void *pointer);
void glMultiTexEnvfEXT (GLenum texunit, GLenum target, GLenum pname, GLfloat param);
void glMultiTexEnvfvEXT (GLenum texunit, GLenum target, GLenum pname, const GLfloat *params);
void glMultiTexEnviEXT (GLenum texunit, GLenum target, GLenum pname, GLint param);
void glMultiTexEnvivEXT (GLenum texunit, GLenum target, GLenum pname, const GLint *params);
void glMultiTexGendEXT (GLenum texunit, GLenum coord, GLenum pname, GLdouble param);
void glMultiTexGendvEXT (GLenum texunit, GLenum coord, GLenum pname, const GLdouble *params);
void glMultiTexGenfEXT (GLenum texunit, GLenum coord, GLenum pname, GLfloat param);
void glMultiTexGenfvEXT (GLenum texunit, GLenum coord, GLenum pname, const GLfloat *params);
void glMultiTexGeniEXT (GLenum texunit, GLenum coord, GLenum pname, GLint param);
void glMultiTexGenivEXT (GLenum texunit, GLenum coord, GLenum pname, const GLint *params);
void glGetMultiTexEnvfvEXT (GLenum texunit, GLenum target, GLenum pname, GLfloat *params);
void glGetMultiTexEnvivEXT (GLenum texunit, GLenum target, GLenum pname, GLint *params);
void glGetMultiTexGendvEXT (GLenum texunit, GLenum coord, GLenum pname, GLdouble *params);
void glGetMultiTexGenfvEXT (GLenum texunit, GLenum coord, GLenum pname, GLfloat *params);
void glGetMultiTexGenivEXT (GLenum texunit, GLenum coord, GLenum pname, GLint *params);
void glMultiTexParameteriEXT (GLenum texunit, GLenum target, GLenum pname, GLint param);
void glMultiTexParameterivEXT (GLenum texunit, GLenum target, GLenum pname, const GLint *params);
void glMultiTexParameterfEXT (GLenum texunit, GLenum target, GLenum pname, GLfloat param);
void glMultiTexParameterfvEXT (GLenum texunit, GLenum target, GLenum pname, const GLfloat *params);
void glMultiTexImage1DEXT (GLenum texunit, GLenum target, GLint level, GLint internalformat, GLsizei width, GLint border, GLenum format, GLenum type, const void *pixels);
void glMultiTexImage2DEXT (GLenum texunit, GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLint border, GLenum format, GLenum type, const void *pixels);
void glMultiTexSubImage1DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLenum type, const void *pixels);
void glMultiTexSubImage2DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLenum type, const void *pixels);
void glCopyMultiTexImage1DEXT (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLint border);
void glCopyMultiTexImage2DEXT (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLint x, GLint y, GLsizei width, GLsizei height, GLint border);
void glCopyMultiTexSubImage1DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint x, GLint y, GLsizei width);
void glCopyMultiTexSubImage2DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint x, GLint y, GLsizei width, GLsizei height);
void glGetMultiTexImageEXT (GLenum texunit, GLenum target, GLint level, GLenum format, GLenum type, void *pixels);
void glGetMultiTexParameterfvEXT (GLenum texunit, GLenum target, GLenum pname, GLfloat *params);
void glGetMultiTexParameterivEXT (GLenum texunit, GLenum target, GLenum pname, GLint *params);
void glGetMultiTexLevelParameterfvEXT (GLenum texunit, GLenum target, GLint level, GLenum pname, GLfloat *params);
void glGetMultiTexLevelParameterivEXT (GLenum texunit, GLenum target, GLint level, GLenum pname, GLint *params);
void glMultiTexImage3DEXT (GLenum texunit, GLenum target, GLint level, GLint internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLenum format, GLenum type, const void *pixels);
void glMultiTexSubImage3DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLenum type, const void *pixels);
void glCopyMultiTexSubImage3DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLint x, GLint y, GLsizei width, GLsizei height);
void glEnableClientStateIndexedEXT (GLenum array, GLuint index);
void glDisableClientStateIndexedEXT (GLenum array, GLuint index);
void glGetFloatIndexedvEXT (GLenum target, GLuint index, GLfloat *data);
void glGetDoubleIndexedvEXT (GLenum target, GLuint index, GLdouble *data);
void glGetPointerIndexedvEXT (GLenum target, GLuint index, void **data);
void glEnableIndexedEXT (GLenum target, GLuint index);
void glDisableIndexedEXT (GLenum target, GLuint index);
GLboolean glIsEnabledIndexedEXT (GLenum target, GLuint index);
void glGetIntegerIndexedvEXT (GLenum target, GLuint index, GLint *data);
void glGetBooleanIndexedvEXT (GLenum target, GLuint index, GLboolean *data);
void glCompressedTextureImage3DEXT (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const void *bits);
void glCompressedTextureImage2DEXT (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const void *bits);
void glCompressedTextureImage1DEXT (GLuint texture, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const void *bits);
void glCompressedTextureSubImage3DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *bits);
void glCompressedTextureSubImage2DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *bits);
void glCompressedTextureSubImage1DEXT (GLuint texture, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const void *bits);
void glGetCompressedTextureImageEXT (GLuint texture, GLenum target, GLint lod, void *img);
void glCompressedMultiTexImage3DEXT (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLint border, GLsizei imageSize, const void *bits);
void glCompressedMultiTexImage2DEXT (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLsizei height, GLint border, GLsizei imageSize, const void *bits);
void glCompressedMultiTexImage1DEXT (GLenum texunit, GLenum target, GLint level, GLenum internalformat, GLsizei width, GLint border, GLsizei imageSize, const void *bits);
void glCompressedMultiTexSubImage3DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLenum format, GLsizei imageSize, const void *bits);
void glCompressedMultiTexSubImage2DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLint yoffset, GLsizei width, GLsizei height, GLenum format, GLsizei imageSize, const void *bits);
void glCompressedMultiTexSubImage1DEXT (GLenum texunit, GLenum target, GLint level, GLint xoffset, GLsizei width, GLenum format, GLsizei imageSize, const void *bits);
void glGetCompressedMultiTexImageEXT (GLenum texunit, GLenum target, GLint lod, void *img);
void glMatrixLoadTransposefEXT (GLenum mode, const GLfloat *m);
void glMatrixLoadTransposedEXT (GLenum mode, const GLdouble *m);
void glMatrixMultTransposefEXT (GLenum mode, const GLfloat *m);
void glMatrixMultTransposedEXT (GLenum mode, const GLdouble *m);
void glNamedBufferDataEXT (GLuint buffer, GLsizeiptr size, const void *data, GLenum usage);
void glNamedBufferSubDataEXT (GLuint buffer, GLintptr offset, GLsizeiptr size, const void *data);
void *glMapNamedBufferEXT (GLuint buffer, GLenum access);
GLboolean glUnmapNamedBufferEXT (GLuint buffer);
void glGetNamedBufferParameterivEXT (GLuint buffer, GLenum pname, GLint *params);
void glGetNamedBufferPointervEXT (GLuint buffer, GLenum pname, void **params);
void glGetNamedBufferSubDataEXT (GLuint buffer, GLintptr offset, GLsizeiptr size, void *data);
void glProgramUniform1fEXT (GLuint program, GLint location, GLfloat v0);
void glProgramUniform2fEXT (GLuint program, GLint location, GLfloat v0, GLfloat v1);
void glProgramUniform3fEXT (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2);
void glProgramUniform4fEXT (GLuint program, GLint location, GLfloat v0, GLfloat v1, GLfloat v2, GLfloat v3);
void glProgramUniform1iEXT (GLuint program, GLint location, GLint v0);
void glProgramUniform2iEXT (GLuint program, GLint location, GLint v0, GLint v1);
void glProgramUniform3iEXT (GLuint program, GLint location, GLint v0, GLint v1, GLint v2);
void glProgramUniform4iEXT (GLuint program, GLint location, GLint v0, GLint v1, GLint v2, GLint v3);
void glProgramUniform1fvEXT (GLuint program, GLint location, GLsizei count, const GLfloat *value);
void glProgramUniform2fvEXT (GLuint program, GLint location, GLsizei count, const GLfloat *value);
void glProgramUniform3fvEXT (GLuint program, GLint location, GLsizei count, const GLfloat *value);
void glProgramUniform4fvEXT (GLuint program, GLint location, GLsizei count, const GLfloat *value);
void glProgramUniform1ivEXT (GLuint program, GLint location, GLsizei count, const GLint *value);
void glProgramUniform2ivEXT (GLuint program, GLint location, GLsizei count, const GLint *value);
void glProgramUniform3ivEXT (GLuint program, GLint location, GLsizei count, const GLint *value);
void glProgramUniform4ivEXT (GLuint program, GLint location, GLsizei count, const GLint *value);
void glProgramUniformMatrix2fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix3fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix4fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix2x3fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix3x2fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix2x4fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix4x2fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix3x4fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glProgramUniformMatrix4x3fvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLfloat *value);
void glTextureBufferEXT (GLuint texture, GLenum target, GLenum internalformat, GLuint buffer);
void glMultiTexBufferEXT (GLenum texunit, GLenum target, GLenum internalformat, GLuint buffer);
void glTextureParameterIivEXT (GLuint texture, GLenum target, GLenum pname, const GLint *params);
void glTextureParameterIuivEXT (GLuint texture, GLenum target, GLenum pname, const GLuint *params);
void glGetTextureParameterIivEXT (GLuint texture, GLenum target, GLenum pname, GLint *params);
void glGetTextureParameterIuivEXT (GLuint texture, GLenum target, GLenum pname, GLuint *params);
void glMultiTexParameterIivEXT (GLenum texunit, GLenum target, GLenum pname, const GLint *params);
void glMultiTexParameterIuivEXT (GLenum texunit, GLenum target, GLenum pname, const GLuint *params);
void glGetMultiTexParameterIivEXT (GLenum texunit, GLenum target, GLenum pname, GLint *params);
void glGetMultiTexParameterIuivEXT (GLenum texunit, GLenum target, GLenum pname, GLuint *params);
void glProgramUniform1uiEXT (GLuint program, GLint location, GLuint v0);
void glProgramUniform2uiEXT (GLuint program, GLint location, GLuint v0, GLuint v1);
void glProgramUniform3uiEXT (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2);
void glProgramUniform4uiEXT (GLuint program, GLint location, GLuint v0, GLuint v1, GLuint v2, GLuint v3);
void glProgramUniform1uivEXT (GLuint program, GLint location, GLsizei count, const GLuint *value);
void glProgramUniform2uivEXT (GLuint program, GLint location, GLsizei count, const GLuint *value);
void glProgramUniform3uivEXT (GLuint program, GLint location, GLsizei count, const GLuint *value);
void glProgramUniform4uivEXT (GLuint program, GLint location, GLsizei count, const GLuint *value);
void glNamedProgramLocalParameters4fvEXT (GLuint program, GLenum target, GLuint index, GLsizei count, const GLfloat *params);
void glNamedProgramLocalParameterI4iEXT (GLuint program, GLenum target, GLuint index, GLint x, GLint y, GLint z, GLint w);
void glNamedProgramLocalParameterI4ivEXT (GLuint program, GLenum target, GLuint index, const GLint *params);
void glNamedProgramLocalParametersI4ivEXT (GLuint program, GLenum target, GLuint index, GLsizei count, const GLint *params);
void glNamedProgramLocalParameterI4uiEXT (GLuint program, GLenum target, GLuint index, GLuint x, GLuint y, GLuint z, GLuint w);
void glNamedProgramLocalParameterI4uivEXT (GLuint program, GLenum target, GLuint index, const GLuint *params);
void glNamedProgramLocalParametersI4uivEXT (GLuint program, GLenum target, GLuint index, GLsizei count, const GLuint *params);
void glGetNamedProgramLocalParameterIivEXT (GLuint program, GLenum target, GLuint index, GLint *params);
void glGetNamedProgramLocalParameterIuivEXT (GLuint program, GLenum target, GLuint index, GLuint *params);
void glEnableClientStateiEXT (GLenum array, GLuint index);
void glDisableClientStateiEXT (GLenum array, GLuint index);
void glGetFloati_vEXT (GLenum pname, GLuint index, GLfloat *params);
void glGetDoublei_vEXT (GLenum pname, GLuint index, GLdouble *params);
void glGetPointeri_vEXT (GLenum pname, GLuint index, void **params);
void glNamedProgramStringEXT (GLuint program, GLenum target, GLenum format, GLsizei len, const void *string);
void glNamedProgramLocalParameter4dEXT (GLuint program, GLenum target, GLuint index, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glNamedProgramLocalParameter4dvEXT (GLuint program, GLenum target, GLuint index, const GLdouble *params);
void glNamedProgramLocalParameter4fEXT (GLuint program, GLenum target, GLuint index, GLfloat x, GLfloat y, GLfloat z, GLfloat w);
void glNamedProgramLocalParameter4fvEXT (GLuint program, GLenum target, GLuint index, const GLfloat *params);
void glGetNamedProgramLocalParameterdvEXT (GLuint program, GLenum target, GLuint index, GLdouble *params);
void glGetNamedProgramLocalParameterfvEXT (GLuint program, GLenum target, GLuint index, GLfloat *params);
void glGetNamedProgramivEXT (GLuint program, GLenum target, GLenum pname, GLint *params);
void glGetNamedProgramStringEXT (GLuint program, GLenum target, GLenum pname, void *string);
void glNamedRenderbufferStorageEXT (GLuint renderbuffer, GLenum internalformat, GLsizei width, GLsizei height);
void glGetNamedRenderbufferParameterivEXT (GLuint renderbuffer, GLenum pname, GLint *params);
void glNamedRenderbufferStorageMultisampleEXT (GLuint renderbuffer, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height);
void glNamedRenderbufferStorageMultisampleCoverageEXT (GLuint renderbuffer, GLsizei coverageSamples, GLsizei colorSamples, GLenum internalformat, GLsizei width, GLsizei height);
GLenum glCheckNamedFramebufferStatusEXT (GLuint framebuffer, GLenum target);
void glNamedFramebufferTexture1DEXT (GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
void glNamedFramebufferTexture2DEXT (GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level);
void glNamedFramebufferTexture3DEXT (GLuint framebuffer, GLenum attachment, GLenum textarget, GLuint texture, GLint level, GLint zoffset);
void glNamedFramebufferRenderbufferEXT (GLuint framebuffer, GLenum attachment, GLenum renderbuffertarget, GLuint renderbuffer);
void glGetNamedFramebufferAttachmentParameterivEXT (GLuint framebuffer, GLenum attachment, GLenum pname, GLint *params);
void glGenerateTextureMipmapEXT (GLuint texture, GLenum target);
void glGenerateMultiTexMipmapEXT (GLenum texunit, GLenum target);
void glFramebufferDrawBufferEXT (GLuint framebuffer, GLenum mode);
void glFramebufferDrawBuffersEXT (GLuint framebuffer, GLsizei n, const GLenum *bufs);
void glFramebufferReadBufferEXT (GLuint framebuffer, GLenum mode);
void glGetFramebufferParameterivEXT (GLuint framebuffer, GLenum pname, GLint *params);
void glNamedCopyBufferSubDataEXT (GLuint readBuffer, GLuint writeBuffer, GLintptr readOffset, GLintptr writeOffset, GLsizeiptr size);
void glNamedFramebufferTextureEXT (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level);
void glNamedFramebufferTextureLayerEXT (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level, GLint layer);
void glNamedFramebufferTextureFaceEXT (GLuint framebuffer, GLenum attachment, GLuint texture, GLint level, GLenum face);
void glTextureRenderbufferEXT (GLuint texture, GLenum target, GLuint renderbuffer);
void glMultiTexRenderbufferEXT (GLenum texunit, GLenum target, GLuint renderbuffer);
void glVertexArrayVertexOffsetEXT (GLuint vaobj, GLuint buffer, GLint size, GLenum type, GLsizei stride, GLintptr offset);
void glVertexArrayColorOffsetEXT (GLuint vaobj, GLuint buffer, GLint size, GLenum type, GLsizei stride, GLintptr offset);
void glVertexArrayEdgeFlagOffsetEXT (GLuint vaobj, GLuint buffer, GLsizei stride, GLintptr offset);
void glVertexArrayIndexOffsetEXT (GLuint vaobj, GLuint buffer, GLenum type, GLsizei stride, GLintptr offset);
void glVertexArrayNormalOffsetEXT (GLuint vaobj, GLuint buffer, GLenum type, GLsizei stride, GLintptr offset);
void glVertexArrayTexCoordOffsetEXT (GLuint vaobj, GLuint buffer, GLint size, GLenum type, GLsizei stride, GLintptr offset);
void glVertexArrayMultiTexCoordOffsetEXT (GLuint vaobj, GLuint buffer, GLenum texunit, GLint size, GLenum type, GLsizei stride, GLintptr offset);
void glVertexArrayFogCoordOffsetEXT (GLuint vaobj, GLuint buffer, GLenum type, GLsizei stride, GLintptr offset);
void glVertexArraySecondaryColorOffsetEXT (GLuint vaobj, GLuint buffer, GLint size, GLenum type, GLsizei stride, GLintptr offset);
void glVertexArrayVertexAttribOffsetEXT (GLuint vaobj, GLuint buffer, GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride, GLintptr offset);
void glVertexArrayVertexAttribIOffsetEXT (GLuint vaobj, GLuint buffer, GLuint index, GLint size, GLenum type, GLsizei stride, GLintptr offset);
void glEnableVertexArrayEXT (GLuint vaobj, GLenum array);
void glDisableVertexArrayEXT (GLuint vaobj, GLenum array);
void glEnableVertexArrayAttribEXT (GLuint vaobj, GLuint index);
void glDisableVertexArrayAttribEXT (GLuint vaobj, GLuint index);
void glGetVertexArrayIntegervEXT (GLuint vaobj, GLenum pname, GLint *param);
void glGetVertexArrayPointervEXT (GLuint vaobj, GLenum pname, void **param);
void glGetVertexArrayIntegeri_vEXT (GLuint vaobj, GLuint index, GLenum pname, GLint *param);
void glGetVertexArrayPointeri_vEXT (GLuint vaobj, GLuint index, GLenum pname, void **param);
void *glMapNamedBufferRangeEXT (GLuint buffer, GLintptr offset, GLsizeiptr length, GLbitfield access);
void glFlushMappedNamedBufferRangeEXT (GLuint buffer, GLintptr offset, GLsizeiptr length);
void glNamedBufferStorageEXT (GLuint buffer, GLsizeiptr size, const void *data, GLbitfield flags);
void glClearNamedBufferDataEXT (GLuint buffer, GLenum internalformat, GLenum format, GLenum type, const void *data);
void glClearNamedBufferSubDataEXT (GLuint buffer, GLenum internalformat, GLsizeiptr offset, GLsizeiptr size, GLenum format, GLenum type, const void *data);
void glNamedFramebufferParameteriEXT (GLuint framebuffer, GLenum pname, GLint param);
void glGetNamedFramebufferParameterivEXT (GLuint framebuffer, GLenum pname, GLint *params);
void glProgramUniform1dEXT (GLuint program, GLint location, GLdouble x);
void glProgramUniform2dEXT (GLuint program, GLint location, GLdouble x, GLdouble y);
void glProgramUniform3dEXT (GLuint program, GLint location, GLdouble x, GLdouble y, GLdouble z);
void glProgramUniform4dEXT (GLuint program, GLint location, GLdouble x, GLdouble y, GLdouble z, GLdouble w);
void glProgramUniform1dvEXT (GLuint program, GLint location, GLsizei count, const GLdouble *value);
void glProgramUniform2dvEXT (GLuint program, GLint location, GLsizei count, const GLdouble *value);
void glProgramUniform3dvEXT (GLuint program, GLint location, GLsizei count, const GLdouble *value);
void glProgramUniform4dvEXT (GLuint program, GLint location, GLsizei count, const GLdouble *value);
void glProgramUniformMatrix2dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glProgramUniformMatrix3dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glProgramUniformMatrix4dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glProgramUniformMatrix2x3dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glProgramUniformMatrix2x4dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glProgramUniformMatrix3x2dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glProgramUniformMatrix3x4dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glProgramUniformMatrix4x2dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glProgramUniformMatrix4x3dvEXT (GLuint program, GLint location, GLsizei count, GLboolean transpose, const GLdouble *value);
void glTextureBufferRangeEXT (GLuint texture, GLenum target, GLenum internalformat, GLuint buffer, GLintptr offset, GLsizeiptr size);
void glTextureStorage1DEXT (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width);
void glTextureStorage2DEXT (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height);
void glTextureStorage3DEXT (GLuint texture, GLenum target, GLsizei levels, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth);
void glTextureStorage2DMultisampleEXT (GLuint texture, GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLboolean fixedsamplelocations);
void glTextureStorage3DMultisampleEXT (GLuint texture, GLenum target, GLsizei samples, GLenum internalformat, GLsizei width, GLsizei height, GLsizei depth, GLboolean fixedsamplelocations);
void glVertexArrayBindVertexBufferEXT (GLuint vaobj, GLuint bindingindex, GLuint buffer, GLintptr offset, GLsizei stride);
void glVertexArrayVertexAttribFormatEXT (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLboolean normalized, GLuint relativeoffset);
void glVertexArrayVertexAttribIFormatEXT (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset);
void glVertexArrayVertexAttribLFormatEXT (GLuint vaobj, GLuint attribindex, GLint size, GLenum type, GLuint relativeoffset);
void glVertexArrayVertexAttribBindingEXT (GLuint vaobj, GLuint attribindex, GLuint bindingindex);
void glVertexArrayVertexBindingDivisorEXT (GLuint vaobj, GLuint bindingindex, GLuint divisor);
void glVertexArrayVertexAttribLOffsetEXT (GLuint vaobj, GLuint buffer, GLuint index, GLint size, GLenum type, GLsizei stride, GLintptr offset);
void glTexturePageCommitmentEXT (GLuint texture, GLint level, GLint xoffset, GLint yoffset, GLint zoffset, GLsizei width, GLsizei height, GLsizei depth, GLboolean commit);
void glVertexArrayVertexAttribDivisorEXT (GLuint vaobj, GLuint index, GLuint divisor);


enum { GL_EXT_draw_instanced = 1 };
typedef void (* PFNGLDRAWARRAYSINSTANCEDEXTPROC) (GLenum mode, GLint start, GLsizei count, GLsizei primcount);
typedef void (* PFNGLDRAWELEMENTSINSTANCEDEXTPROC) (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei primcount);
void glDrawArraysInstancedEXT (GLenum mode, GLint start, GLsizei count, GLsizei primcount);
void glDrawElementsInstancedEXT (GLenum mode, GLsizei count, GLenum type, const void *indices, GLsizei primcount);

enum { GL_EXT_multiview_tessellation_geometry_shader = 1 };
enum { GL_EXT_multiview_texture_multisample = 1 };
enum { GL_EXT_multiview_timer_query = 1 };
enum {
    GL_EXT_polygon_offset_clamp       = 1,
    GL_POLYGON_OFFSET_CLAMP_EXT       = 0x8E1B
};
typedef void (* PFNGLPOLYGONOFFSETCLAMPEXTPROC) (GLfloat factor, GLfloat units, GLfloat clamp);
void glPolygonOffsetClampEXT (GLfloat factor, GLfloat units, GLfloat clamp);

enum { GL_EXT_post_depth_coverage = 1 };
enum {
    GL_EXT_raster_multisample         = 1,
    GL_RASTER_MULTISAMPLE_EXT         = 0x9327,
    GL_RASTER_SAMPLES_EXT             = 0x9328,
    GL_MAX_RASTER_SAMPLES_EXT         = 0x9329,
    GL_RASTER_FIXED_SAMPLE_LOCATIONS_EXT = 0x932A,
    GL_MULTISAMPLE_RASTERIZATION_ALLOWED_EXT = 0x932B,
    GL_EFFECTIVE_RASTER_SAMPLES_EXT   = 0x932C
};
typedef void (* PFNGLRASTERSAMPLESEXTPROC) (GLuint samples, GLboolean fixedsamplelocations);
void glRasterSamplesEXT (GLuint samples, GLboolean fixedsamplelocations);
enum {
    GL_EXT_separate_shader_objects    = 1,
    GL_ACTIVE_PROGRAM_EXT             = 0x8B8D
};
typedef void (* PFNGLUSESHADERPROGRAMEXTPROC) (GLenum type, GLuint program);
typedef void (* PFNGLACTIVEPROGRAMEXTPROC) (GLuint program);
typedef GLuint (* PFNGLCREATESHADERPROGRAMEXTPROC) (GLenum type, const GLchar *string);

void glUseShaderProgramEXT (GLenum type, GLuint program);
void glActiveProgramEXT (GLuint program);
GLuint glCreateShaderProgramEXT (GLenum type, const GLchar *string);
enum {
    GL_EXT_shader_framebuffer_fetch         = 1,
    GL_FRAGMENT_SHADER_DISCARDS_SAMPLES_EXT = 0x8A52
};

enum { GL_EXT_shader_framebuffer_fetch_non_coherent = 1 };
typedef void (* PFNGLFRAMEBUFFERFETCHBARRIEREXTPROC) (void);
void glFramebufferFetchBarrierEXT (void);

enum { GL_EXT_shader_integer_mix = 1 };
enum {
    GL_EXT_texture_compression_s3tc   = 1,
    GL_COMPRESSED_RGB_S3TC_DXT1_EXT   = 0x83F0,
    GL_COMPRESSED_RGBA_S3TC_DXT1_EXT  = 0x83F1,
    GL_COMPRESSED_RGBA_S3TC_DXT3_EXT  = 0x83F2,
    GL_COMPRESSED_RGBA_S3TC_DXT5_EXT  = 0x83F3
};

enum {
    GL_EXT_texture_filter_minmax      = 1,
    GL_TEXTURE_REDUCTION_MODE_EXT     = 0x9366,
    GL_WEIGHTED_AVERAGE_EXT           = 0x9367
};

enum {
    GL_EXT_texture_sRGB_R8            = 1,
    GL_SR8_EXT                        = 0x8FBD
};

enum {
    GL_EXT_texture_sRGB_decode        = 1,
    GL_TEXTURE_SRGB_DECODE_EXT        = 0x8A48,
    GL_DECODE_EXT                     = 0x8A49,
    GL_SKIP_DECODE_EXT                = 0x8A4A
};

enum { GL_EXT_texture_shadow_lod = 1 };
enum {
    GL_EXT_window_rectangles          = 1,
    GL_INCLUSIVE_EXT                  = 0x8F10,
    GL_EXCLUSIVE_EXT                  = 0x8F11,
    GL_WINDOW_RECTANGLE_EXT           = 0x8F12,
    GL_WINDOW_RECTANGLE_MODE_EXT      = 0x8F13,
    GL_MAX_WINDOW_RECTANGLES_EXT      = 0x8F14,
    GL_NUM_WINDOW_RECTANGLES_EXT      = 0x8F15
};
typedef void (* PFNGLWINDOWRECTANGLESEXTPROC) (GLenum mode, GLsizei count, const GLint *box);
void glWindowRectanglesEXT (GLenum mode, GLsizei count, const GLint *box);

enum {
    GL_INTEL_blackhole_render         = 1,
    GL_BLACKHOLE_RENDER_INTEL         = 0x83FC
};

enum {
    GL_INTEL_conservative_rasterization = 1,
    GL_CONSERVATIVE_RASTERIZATION_INTEL = 0x83FE
};

enum { GL_INTEL_framebuffer_CMAA = 1 };
typedef void (* PFNGLAPPLYFRAMEBUFFERATTACHMENTCMAAINTELPROC) (void);
void glApplyFramebufferAttachmentCMAAINTEL (void);

enum {
    GL_INTEL_performance_query        = 1,
    GL_PERFQUERY_SINGLE_CONTEXT_INTEL = 0x00000000,
    GL_PERFQUERY_GLOBAL_CONTEXT_INTEL = 0x00000001,
    GL_PERFQUERY_WAIT_INTEL           = 0x83FB,
    GL_PERFQUERY_FLUSH_INTEL          = 0x83FA,
    GL_PERFQUERY_DONOT_FLUSH_INTEL    = 0x83F9,
    GL_PERFQUERY_COUNTER_EVENT_INTEL  = 0x94F0,
    GL_PERFQUERY_COUNTER_DURATION_NORM_INTEL = 0x94F1,
    GL_PERFQUERY_COUNTER_DURATION_RAW_INTEL = 0x94F2,
    GL_PERFQUERY_COUNTER_THROUGHPUT_INTEL = 0x94F3,
    GL_PERFQUERY_COUNTER_RAW_INTEL    = 0x94F4,
    GL_PERFQUERY_COUNTER_TIMESTAMP_INTEL = 0x94F5,
    GL_PERFQUERY_COUNTER_DATA_UINT32_INTEL = 0x94F8,
    GL_PERFQUERY_COUNTER_DATA_UINT64_INTEL = 0x94F9,
    GL_PERFQUERY_COUNTER_DATA_FLOAT_INTEL = 0x94FA,
    GL_PERFQUERY_COUNTER_DATA_DOUBLE_INTEL = 0x94FB,
    GL_PERFQUERY_COUNTER_DATA_BOOL32_INTEL = 0x94FC,
    GL_PERFQUERY_QUERY_NAME_LENGTH_MAX_INTEL = 0x94FD,
    GL_PERFQUERY_COUNTER_NAME_LENGTH_MAX_INTEL = 0x94FE,
    GL_PERFQUERY_COUNTER_DESC_LENGTH_MAX_INTEL = 0x94FF,
    GL_PERFQUERY_GPA_EXTENDED_COUNTERS_INTEL = 0x9500
};
typedef void (* PFNGLBEGINPERFQUERYINTELPROC) (GLuint queryHandle);
typedef void (* PFNGLCREATEPERFQUERYINTELPROC) (GLuint queryId, GLuint *queryHandle);
typedef void (* PFNGLDELETEPERFQUERYINTELPROC) (GLuint queryHandle);
typedef void (* PFNGLENDPERFQUERYINTELPROC) (GLuint queryHandle);
typedef void (* PFNGLGETFIRSTPERFQUERYIDINTELPROC) (GLuint *queryId);
typedef void (* PFNGLGETNEXTPERFQUERYIDINTELPROC) (GLuint queryId, GLuint *nextQueryId);
typedef void (* PFNGLGETPERFCOUNTERINFOINTELPROC) (GLuint queryId, GLuint counterId, GLuint counterNameLength, GLchar *counterName, GLuint counterDescLength, GLchar *counterDesc, GLuint *counterOffset, GLuint *counterDataSize, GLuint *counterTypeEnum, GLuint *counterDataTypeEnum, GLuint64 *rawCounterMaxValue);
typedef void (* PFNGLGETPERFQUERYDATAINTELPROC) (GLuint queryHandle, GLuint flags, GLsizei dataSize, void *data, GLuint *bytesWritten);
typedef void (* PFNGLGETPERFQUERYIDBYNAMEINTELPROC) (GLchar *queryName, GLuint *queryId);
typedef void (* PFNGLGETPERFQUERYINFOINTELPROC) (GLuint queryId, GLuint queryNameLength, GLchar *queryName, GLuint *dataSize, GLuint *noCounters, GLuint *noInstances, GLuint *capsMask);

void glBeginPerfQueryINTEL (GLuint queryHandle);
void glCreatePerfQueryINTEL (GLuint queryId, GLuint *queryHandle);
void glDeletePerfQueryINTEL (GLuint queryHandle);
void glEndPerfQueryINTEL (GLuint queryHandle);
void glGetFirstPerfQueryIdINTEL (GLuint *queryId);
void glGetNextPerfQueryIdINTEL (GLuint queryId, GLuint *nextQueryId);
void glGetPerfCounterInfoINTEL (GLuint queryId, GLuint counterId, GLuint counterNameLength, GLchar *counterName, GLuint counterDescLength, GLchar *counterDesc, GLuint *counterOffset, GLuint *counterDataSize, GLuint *counterTypeEnum, GLuint *counterDataTypeEnum, GLuint64 *rawCounterMaxValue);
void glGetPerfQueryDataINTEL (GLuint queryHandle, GLuint flags, GLsizei dataSize, void *data, GLuint *bytesWritten);
void glGetPerfQueryIdByNameINTEL (GLchar *queryName, GLuint *queryId);
void glGetPerfQueryInfoINTEL (GLuint queryId, GLuint queryNameLength, GLchar *queryName, GLuint *dataSize, GLuint *noCounters, GLuint *noInstances, GLuint *capsMask);

enum {
    GL_MESA_framebuffer_flip_x        = 1,
    GL_FRAMEBUFFER_FLIP_X_MESA        = 0x8BBC
};

enum {
    GL_MESA_framebuffer_flip_y        = 1,
    GL_FRAMEBUFFER_FLIP_Y_MESA        = 0x8BBB
};
typedef void (* PFNGLFRAMEBUFFERPARAMETERIMESAPROC) (GLenum target, GLenum pname, GLint param);
typedef void (* PFNGLGETFRAMEBUFFERPARAMETERIVMESAPROC) (GLenum target, GLenum pname, GLint *params);

void glFramebufferParameteriMESA (GLenum target, GLenum pname, GLint param);
void glGetFramebufferParameterivMESA (GLenum target, GLenum pname, GLint *params);
enum {
    GL_MESA_framebuffer_swap_xy       = 1,
    GL_FRAMEBUFFER_SWAP_XY_MESA       = 0x8BBD
};

enum { GL_NV_bindless_multi_draw_indirect = 1 };
typedef void (* PFNGLMULTIDRAWARRAYSINDIRECTBINDLESSNVPROC) (GLenum mode, const void *indirect, GLsizei drawCount, GLsizei stride, GLint vertexBufferCount);
typedef void (* PFNGLMULTIDRAWELEMENTSINDIRECTBINDLESSNVPROC) (GLenum mode, GLenum type, const void *indirect, GLsizei drawCount, GLsizei stride, GLint vertexBufferCount);

void glMultiDrawArraysIndirectBindlessNV (GLenum mode, const void *indirect, GLsizei drawCount, GLsizei stride, GLint vertexBufferCount);
void glMultiDrawElementsIndirectBindlessNV (GLenum mode, GLenum type, const void *indirect, GLsizei drawCount, GLsizei stride, GLint vertexBufferCount);

enum { GL_NV_bindless_multi_draw_indirect_count = 1 };
typedef void (* PFNGLMULTIDRAWARRAYSINDIRECTBINDLESSCOUNTNVPROC) (GLenum mode, const void *indirect, GLsizei drawCount, GLsizei maxDrawCount, GLsizei stride, GLint vertexBufferCount);
typedef void (* PFNGLMULTIDRAWELEMENTSINDIRECTBINDLESSCOUNTNVPROC) (GLenum mode, GLenum type, const void *indirect, GLsizei drawCount, GLsizei maxDrawCount, GLsizei stride, GLint vertexBufferCount);

void glMultiDrawArraysIndirectBindlessCountNV (GLenum mode, const void *indirect, GLsizei drawCount, GLsizei maxDrawCount, GLsizei stride, GLint vertexBufferCount);
void glMultiDrawElementsIndirectBindlessCountNV (GLenum mode, GLenum type, const void *indirect, GLsizei drawCount, GLsizei maxDrawCount, GLsizei stride, GLint vertexBufferCount);

enum { GL_NV_bindless_texture = 1 };
typedef GLuint64 (* PFNGLGETTEXTUREHANDLENVPROC) (GLuint texture);
typedef GLuint64 (* PFNGLGETTEXTURESAMPLERHANDLENVPROC) (GLuint texture, GLuint sampler);
typedef void (* PFNGLMAKETEXTUREHANDLERESIDENTNVPROC) (GLuint64 handle);
typedef void (* PFNGLMAKETEXTUREHANDLENONRESIDENTNVPROC) (GLuint64 handle);
typedef GLuint64 (* PFNGLGETIMAGEHANDLENVPROC) (GLuint texture, GLint level, GLboolean layered, GLint layer, GLenum format);
typedef void (* PFNGLMAKEIMAGEHANDLERESIDENTNVPROC) (GLuint64 handle, GLenum access);
typedef void (* PFNGLMAKEIMAGEHANDLENONRESIDENTNVPROC) (GLuint64 handle);
typedef void (* PFNGLUNIFORMHANDLEUI64NVPROC) (GLint location, GLuint64 value);
typedef void (* PFNGLUNIFORMHANDLEUI64VNVPROC) (GLint location, GLsizei count, const GLuint64 *value);
typedef void (* PFNGLPROGRAMUNIFORMHANDLEUI64NVPROC) (GLuint program, GLint location, GLuint64 value);
typedef void (* PFNGLPROGRAMUNIFORMHANDLEUI64VNVPROC) (GLuint program, GLint location, GLsizei count, const GLuint64 *values);
typedef GLboolean (* PFNGLISTEXTUREHANDLERESIDENTNVPROC) (GLuint64 handle);
typedef GLboolean (* PFNGLISIMAGEHANDLERESIDENTNVPROC) (GLuint64 handle);

GLuint64 glGetTextureHandleNV (GLuint texture);
GLuint64 glGetTextureSamplerHandleNV (GLuint texture, GLuint sampler);
void glMakeTextureHandleResidentNV (GLuint64 handle);
void glMakeTextureHandleNonResidentNV (GLuint64 handle);
GLuint64 glGetImageHandleNV (GLuint texture, GLint level, GLboolean layered, GLint layer, GLenum format);
void glMakeImageHandleResidentNV (GLuint64 handle, GLenum access);
void glMakeImageHandleNonResidentNV (GLuint64 handle);
void glUniformHandleui64NV (GLint location, GLuint64 value);
void glUniformHandleui64vNV (GLint location, GLsizei count, const GLuint64 *value);
void glProgramUniformHandleui64NV (GLuint program, GLint location, GLuint64 value);
void glProgramUniformHandleui64vNV (GLuint program, GLint location, GLsizei count, const GLuint64 *values);
GLboolean glIsTextureHandleResidentNV (GLuint64 handle);
GLboolean glIsImageHandleResidentNV (GLuint64 handle);

enum {
    GL_NV_blend_equation_advanced     = 1,
    GL_BLEND_OVERLAP_NV               = 0x9281,
    GL_BLEND_PREMULTIPLIED_SRC_NV     = 0x9280,
    GL_BLUE_NV                        = 0x1905,
    GL_COLORBURN_NV                   = 0x929A,
    GL_COLORDODGE_NV                  = 0x9299,
    GL_CONJOINT_NV                    = 0x9284,
    GL_CONTRAST_NV                    = 0x92A1,
    GL_DARKEN_NV                      = 0x9297,
    GL_DIFFERENCE_NV                  = 0x929E,
    GL_DISJOINT_NV                    = 0x9283,
    GL_DST_ATOP_NV                    = 0x928F,
    GL_DST_IN_NV                      = 0x928B,
    GL_DST_NV                         = 0x9287,
    GL_DST_OUT_NV                     = 0x928D,
    GL_DST_OVER_NV                    = 0x9289,
    GL_EXCLUSION_NV                   = 0x92A0,
    GL_GREEN_NV                       = 0x1904,
    GL_HARDLIGHT_NV                   = 0x929B,
    GL_HARDMIX_NV                     = 0x92A9,
    GL_HSL_COLOR_NV                   = 0x92AF,
    GL_HSL_HUE_NV                     = 0x92AD,
    GL_HSL_LUMINOSITY_NV              = 0x92B0,
    GL_HSL_SATURATION_NV              = 0x92AE,
    GL_INVERT_OVG_NV                  = 0x92B4,
    GL_INVERT_RGB_NV                  = 0x92A3,
    GL_LIGHTEN_NV                     = 0x9298,
    GL_LINEARBURN_NV                  = 0x92A5,
    GL_LINEARDODGE_NV                 = 0x92A4,
    GL_LINEARLIGHT_NV                 = 0x92A7,
    GL_MINUS_CLAMPED_NV               = 0x92B3,
    GL_MINUS_NV                       = 0x929F,
    GL_MULTIPLY_NV                    = 0x9294,
    GL_OVERLAY_NV                     = 0x9296,
    GL_PINLIGHT_NV                    = 0x92A8,
    GL_PLUS_CLAMPED_ALPHA_NV          = 0x92B2,
    GL_PLUS_CLAMPED_NV                = 0x92B1,
    GL_PLUS_DARKER_NV                 = 0x9292,
    GL_PLUS_NV                        = 0x9291,
    GL_RED_NV                         = 0x1903,
    GL_SCREEN_NV                      = 0x9295,
    GL_SOFTLIGHT_NV                   = 0x929C,
    GL_SRC_ATOP_NV                    = 0x928E,
    GL_SRC_IN_NV                      = 0x928A,
    GL_SRC_NV                         = 0x9286,
    GL_SRC_OUT_NV                     = 0x928C,
    GL_SRC_OVER_NV                    = 0x9288,
    GL_UNCORRELATED_NV                = 0x9282,
    GL_VIVIDLIGHT_NV                  = 0x92A6,
    GL_XOR_NV                         = 0x1506
};
typedef void (* PFNGLBLENDPARAMETERINVPROC) (GLenum pname, GLint value);
typedef void (* PFNGLBLENDBARRIERNVPROC) (void);

void glBlendParameteriNV (GLenum pname, GLint value);
void glBlendBarrierNV (void);

enum {
    GL_NV_blend_equation_advanced_coherent = 1,
    GL_BLEND_ADVANCED_COHERENT_NV     = 0x9285
};

enum {
    GL_NV_blend_minmax_factor         = 1,
    GL_FACTOR_MIN_AMD                 = 0x901C,
    GL_FACTOR_MAX_AMD                 = 0x901D
};

enum {
    GL_NV_clip_space_w_scaling        = 1,
    GL_VIEWPORT_POSITION_W_SCALE_NV   = 0x937C,
    GL_VIEWPORT_POSITION_W_SCALE_X_COEFF_NV = 0x937D,
    GL_VIEWPORT_POSITION_W_SCALE_Y_COEFF_NV = 0x937E
};
typedef void (* PFNGLVIEWPORTPOSITIONWSCALENVPROC) (GLuint index, GLfloat xcoeff, GLfloat ycoeff);
void glViewportPositionWScaleNV (GLuint index, GLfloat xcoeff, GLfloat ycoeff);

enum {
    GL_NV_command_list                = 1,
    GL_TERMINATE_SEQUENCE_COMMAND_NV  = 0x0000,
    GL_NOP_COMMAND_NV                 = 0x0001,
    GL_DRAW_ELEMENTS_COMMAND_NV       = 0x0002,
    GL_DRAW_ARRAYS_COMMAND_NV         = 0x0003,
    GL_DRAW_ELEMENTS_STRIP_COMMAND_NV = 0x0004,
    GL_DRAW_ARRAYS_STRIP_COMMAND_NV   = 0x0005,
    GL_DRAW_ELEMENTS_INSTANCED_COMMAND_NV = 0x0006,
    GL_DRAW_ARRAYS_INSTANCED_COMMAND_NV = 0x0007,
    GL_ELEMENT_ADDRESS_COMMAND_NV     = 0x0008,
    GL_ATTRIBUTE_ADDRESS_COMMAND_NV   = 0x0009,
    GL_UNIFORM_ADDRESS_COMMAND_NV     = 0x000A,
    GL_BLEND_COLOR_COMMAND_NV         = 0x000B,
    GL_STENCIL_REF_COMMAND_NV         = 0x000C,
    GL_LINE_WIDTH_COMMAND_NV          = 0x000D,
    GL_POLYGON_OFFSET_COMMAND_NV      = 0x000E,
    GL_ALPHA_REF_COMMAND_NV           = 0x000F,
    GL_VIEWPORT_COMMAND_NV            = 0x0010,
    GL_SCISSOR_COMMAND_NV             = 0x0011,
    GL_FRONT_FACE_COMMAND_NV          = 0x0012
};
typedef void (* PFNGLCREATESTATESNVPROC) (GLsizei n, GLuint *states);
typedef void (* PFNGLDELETESTATESNVPROC) (GLsizei n, const GLuint *states);
typedef GLboolean (* PFNGLISSTATENVPROC) (GLuint state);
typedef void (* PFNGLSTATECAPTURENVPROC) (GLuint state, GLenum mode);
typedef GLuint (* PFNGLGETCOMMANDHEADERNVPROC) (GLenum tokenID, GLuint size);
typedef GLushort (* PFNGLGETSTAGEINDEXNVPROC) (GLenum shadertype);
typedef void (* PFNGLDRAWCOMMANDSNVPROC) (GLenum primitiveMode, GLuint buffer, const GLintptr *indirects, const GLsizei *sizes, GLuint count);
typedef void (* PFNGLDRAWCOMMANDSADDRESSNVPROC) (GLenum primitiveMode, const GLuint64 *indirects, const GLsizei *sizes, GLuint count);
typedef void (* PFNGLDRAWCOMMANDSSTATESNVPROC) (GLuint buffer, const GLintptr *indirects, const GLsizei *sizes, const GLuint *states, const GLuint *fbos, GLuint count);
typedef void (* PFNGLDRAWCOMMANDSSTATESADDRESSNVPROC) (const GLuint64 *indirects, const GLsizei *sizes, const GLuint *states, const GLuint *fbos, GLuint count);
typedef void (* PFNGLCREATECOMMANDLISTSNVPROC) (GLsizei n, GLuint *lists);
typedef void (* PFNGLDELETECOMMANDLISTSNVPROC) (GLsizei n, const GLuint *lists);
typedef GLboolean (* PFNGLISCOMMANDLISTNVPROC) (GLuint list);
typedef void (* PFNGLLISTDRAWCOMMANDSSTATESCLIENTNVPROC) (GLuint list, GLuint segment, const void **indirects, const GLsizei *sizes, const GLuint *states, const GLuint *fbos, GLuint count);
typedef void (* PFNGLCOMMANDLISTSEGMENTSNVPROC) (GLuint list, GLuint segments);
typedef void (* PFNGLCOMPILECOMMANDLISTNVPROC) (GLuint list);
typedef void (* PFNGLCALLCOMMANDLISTNVPROC) (GLuint list);

void glCreateStatesNV (GLsizei n, GLuint *states);
void glDeleteStatesNV (GLsizei n, const GLuint *states);
GLboolean glIsStateNV (GLuint state);
void glStateCaptureNV (GLuint state, GLenum mode);
GLuint glGetCommandHeaderNV (GLenum tokenID, GLuint size);
GLushort glGetStageIndexNV (GLenum shadertype);
void glDrawCommandsNV (GLenum primitiveMode, GLuint buffer, const GLintptr *indirects, const GLsizei *sizes, GLuint count);
void glDrawCommandsAddressNV (GLenum primitiveMode, const GLuint64 *indirects, const GLsizei *sizes, GLuint count);
void glDrawCommandsStatesNV (GLuint buffer, const GLintptr *indirects, const GLsizei *sizes, const GLuint *states, const GLuint *fbos, GLuint count);
void glDrawCommandsStatesAddressNV (const GLuint64 *indirects, const GLsizei *sizes, const GLuint *states, const GLuint *fbos, GLuint count);
void glCreateCommandListsNV (GLsizei n, GLuint *lists);
void glDeleteCommandListsNV (GLsizei n, const GLuint *lists);
GLboolean glIsCommandListNV (GLuint list);
void glListDrawCommandsStatesClientNV (GLuint list, GLuint segment, const void **indirects, const GLsizei *sizes, const GLuint *states, const GLuint *fbos, GLuint count);
void glCommandListSegmentsNV (GLuint list, GLuint segments);
void glCompileCommandListNV (GLuint list);
void glCallCommandListNV (GLuint list);

enum { GL_NV_compute_shader_derivatives = 1 };

enum {
    GL_NV_conditional_render          = 1,
    GL_QUERY_WAIT_NV                  = 0x8E13,
    GL_QUERY_NO_WAIT_NV               = 0x8E14,
    GL_QUERY_BY_REGION_WAIT_NV        = 0x8E15,
    GL_QUERY_BY_REGION_NO_WAIT_NV     = 0x8E16
};
typedef void (* PFNGLBEGINCONDITIONALRENDERNVPROC) (GLuint id, GLenum mode);
typedef void (* PFNGLENDCONDITIONALRENDERNVPROC) (void);

void glBeginConditionalRenderNV (GLuint id, GLenum mode);
void glEndConditionalRenderNV (void);

enum {
    GL_NV_conservative_raster = 1,
    GL_CONSERVATIVE_RASTERIZATION_NV  = 0x9346,
    GL_SUBPIXEL_PRECISION_BIAS_X_BITS_NV = 0x9347,
    GL_SUBPIXEL_PRECISION_BIAS_Y_BITS_NV = 0x9348,
    GL_MAX_SUBPIXEL_PRECISION_BIAS_BITS_NV = 0x9349
};
typedef void (* PFNGLSUBPIXELPRECISIONBIASNVPROC) (GLuint xbits, GLuint ybits);
void glSubpixelPrecisionBiasNV (GLuint xbits, GLuint ybits);

enum {
    GL_NV_conservative_raster_dilate = 1,
    GL_CONSERVATIVE_RASTER_DILATE_NV  = 0x9379,
    GL_CONSERVATIVE_RASTER_DILATE_RANGE_NV = 0x937A,
    GL_CONSERVATIVE_RASTER_DILATE_GRANULARITY_NV = 0x937B
};
typedef void (* PFNGLCONSERVATIVERASTERPARAMETERFNVPROC) (GLenum pname, GLfloat value);
void glConservativeRasterParameterfNV (GLenum pname, GLfloat value);

enum {
    GL_NV_conservative_raster_pre_snap  = 1,
    GL_CONSERVATIVE_RASTER_MODE_PRE_SNAP_NV = 0x9550
};

enum {
    GL_NV_conservative_raster_pre_snap_triangles = 1,
    GL_CONSERVATIVE_RASTER_MODE_NV    = 0x954D,
    GL_CONSERVATIVE_RASTER_MODE_POST_SNAP_NV = 0x954E,
    GL_CONSERVATIVE_RASTER_MODE_PRE_SNAP_TRIANGLES_NV = 0x954F
};
typedef void (* PFNGLCONSERVATIVERASTERPARAMETERINVPROC) (GLenum pname, GLint param);
void glConservativeRasterParameteriNV (GLenum pname, GLint param);

enum { GL_NV_conservative_raster_underestimation = 1 };
enum {
    GL_NV_depth_buffer_float = 1,
    GL_DEPTH_COMPONENT32F_NV          = 0x8DAB,
    GL_DEPTH32F_STENCIL8_NV           = 0x8DAC,
    GL_FLOAT_32_UNSIGNED_INT_24_8_REV_NV = 0x8DAD,
    GL_DEPTH_BUFFER_FLOAT_MODE_NV     = 0x8DAF
};
typedef void (* PFNGLDEPTHRANGEDNVPROC) (GLdouble zNear, GLdouble zFar);
typedef void (* PFNGLCLEARDEPTHDNVPROC) (GLdouble depth);
typedef void (* PFNGLDEPTHBOUNDSDNVPROC) (GLdouble zmin, GLdouble zmax);
void glDepthRangedNV (GLdouble zNear, GLdouble zFar);
void glClearDepthdNV (GLdouble depth);
void glDepthBoundsdNV (GLdouble zmin, GLdouble zmax);

enum { GL_NV_draw_vulkan_image = 1 };
typedef void ( *GLVULKANPROCNV)(void);
typedef void (* PFNGLDRAWVKIMAGENVPROC) (GLuint64 vkImage, GLuint sampler, GLfloat x0, GLfloat y0, GLfloat x1, GLfloat y1, GLfloat z, GLfloat s0, GLfloat t0, GLfloat s1, GLfloat t1);
typedef GLVULKANPROCNV (* PFNGLGETVKPROCADDRNVPROC) (const GLchar *name);
typedef void (* PFNGLWAITVKSEMAPHORENVPROC) (GLuint64 vkSemaphore);
typedef void (* PFNGLSIGNALVKSEMAPHORENVPROC) (GLuint64 vkSemaphore);
typedef void (* PFNGLSIGNALVKFENCENVPROC) (GLuint64 vkFence);

void glDrawVkImageNV (GLuint64 vkImage, GLuint sampler, GLfloat x0, GLfloat y0, GLfloat x1, GLfloat y1, GLfloat z, GLfloat s0, GLfloat t0, GLfloat s1, GLfloat t1);
GLVULKANPROCNV glGetVkProcAddrNV (const GLchar *name);
void glWaitVkSemaphoreNV (GLuint64 vkSemaphore);
void glSignalVkSemaphoreNV (GLuint64 vkSemaphore);
void glSignalVkFenceNV (GLuint64 vkFence);

enum {
    GL_NV_fill_rectangle = 1,
    GL_FILL_RECTANGLE_NV              = 0x933C
};

enum {
    GL_NV_fragment_coverage_to_color  = 1,
    GL_FRAGMENT_COVERAGE_TO_COLOR_NV  = 0x92DD,
    GL_FRAGMENT_COVERAGE_COLOR_NV     = 0x92DE
};
typedef void (* PFNGLFRAGMENTCOVERAGECOLORNVPROC) (GLuint color);
void glFragmentCoverageColorNV (GLuint color);

enum { GL_NV_fragment_shader_barycentric = 1 };
enum { GL_NV_fragment_shader_interlock = 1 };
enum {
    GL_NV_framebuffer_mixed_samples   = 1,
    GL_COVERAGE_MODULATION_TABLE_NV   = 0x9331,
    GL_COLOR_SAMPLES_NV               = 0x8E20,
    GL_DEPTH_SAMPLES_NV               = 0x932D,
    GL_STENCIL_SAMPLES_NV             = 0x932E,
    GL_MIXED_DEPTH_SAMPLES_SUPPORTED_NV = 0x932F,
    GL_MIXED_STENCIL_SAMPLES_SUPPORTED_NV = 0x9330,
    GL_COVERAGE_MODULATION_NV         = 0x9332,
    GL_COVERAGE_MODULATION_TABLE_SIZE_NV = 0x9333
};
typedef void (* PFNGLCOVERAGEMODULATIONTABLENVPROC) (GLsizei n, const GLfloat *v);
typedef void (* PFNGLGETCOVERAGEMODULATIONTABLENVPROC) (GLsizei bufSize, GLfloat *v);
typedef void (* PFNGLCOVERAGEMODULATIONNVPROC) (GLenum components);

void glCoverageModulationTableNV (GLsizei n, const GLfloat *v);
void glGetCoverageModulationTableNV (GLsizei bufSize, GLfloat *v);
void glCoverageModulationNV (GLenum components);

enum {
    GL_NV_framebuffer_multisample_coverage = 1,
    GL_RENDERBUFFER_COVERAGE_SAMPLES_NV = 0x8CAB,
    GL_RENDERBUFFER_COLOR_SAMPLES_NV  = 0x8E10,
    GL_MAX_MULTISAMPLE_COVERAGE_MODES_NV = 0x8E11,
    GL_MULTISAMPLE_COVERAGE_MODES_NV  = 0x8E12
};
typedef void (* PFNGLRENDERBUFFERSTORAGEMULTISAMPLECOVERAGENVPROC) (GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLenum internalformat, GLsizei width, GLsizei height);
void glRenderbufferStorageMultisampleCoverageNV (GLenum target, GLsizei coverageSamples, GLsizei colorSamples, GLenum internalformat, GLsizei width, GLsizei height);

enum { GL_NV_geometry_shader_passthrough = 1 };

enum { GL_NV_gpu_shader5 = 1 };
typedef int64_t GLint64EXT;
enum {
    GL_INT64_NV                       = 0x140E,
    GL_UNSIGNED_INT64_NV              = 0x140F,
    GL_INT8_NV                        = 0x8FE0,
    GL_INT8_VEC2_NV                   = 0x8FE1,
    GL_INT8_VEC3_NV                   = 0x8FE2,
    GL_INT8_VEC4_NV                   = 0x8FE3,
    GL_INT16_NV                       = 0x8FE4,
    GL_INT16_VEC2_NV                  = 0x8FE5,
    GL_INT16_VEC3_NV                  = 0x8FE6,
    GL_INT16_VEC4_NV                  = 0x8FE7,
    GL_INT64_VEC2_NV                  = 0x8FE9,
    GL_INT64_VEC3_NV                  = 0x8FEA,
    GL_INT64_VEC4_NV                  = 0x8FEB,
    GL_UNSIGNED_INT8_NV               = 0x8FEC,
    GL_UNSIGNED_INT8_VEC2_NV          = 0x8FED,
    GL_UNSIGNED_INT8_VEC3_NV          = 0x8FEE,
    GL_UNSIGNED_INT8_VEC4_NV          = 0x8FEF,
    GL_UNSIGNED_INT16_NV              = 0x8FF0,
    GL_UNSIGNED_INT16_VEC2_NV         = 0x8FF1,
    GL_UNSIGNED_INT16_VEC3_NV         = 0x8FF2,
    GL_UNSIGNED_INT16_VEC4_NV         = 0x8FF3,
    GL_UNSIGNED_INT64_VEC2_NV         = 0x8FF5,
    GL_UNSIGNED_INT64_VEC3_NV         = 0x8FF6,
    GL_UNSIGNED_INT64_VEC4_NV         = 0x8FF7,
    GL_FLOAT16_NV                     = 0x8FF8,
    GL_FLOAT16_VEC2_NV                = 0x8FF9,
    GL_FLOAT16_VEC3_NV                = 0x8FFA,
    GL_FLOAT16_VEC4_NV                = 0x8FFB
};
typedef void (* PFNGLUNIFORM1I64NVPROC) (GLint location, GLint64EXT x);
typedef void (* PFNGLUNIFORM2I64NVPROC) (GLint location, GLint64EXT x, GLint64EXT y);
typedef void (* PFNGLUNIFORM3I64NVPROC) (GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z);
typedef void (* PFNGLUNIFORM4I64NVPROC) (GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z, GLint64EXT w);
typedef void (* PFNGLUNIFORM1I64VNVPROC) (GLint location, GLsizei count, const GLint64EXT *value);
typedef void (* PFNGLUNIFORM2I64VNVPROC) (GLint location, GLsizei count, const GLint64EXT *value);
typedef void (* PFNGLUNIFORM3I64VNVPROC) (GLint location, GLsizei count, const GLint64EXT *value);
typedef void (* PFNGLUNIFORM4I64VNVPROC) (GLint location, GLsizei count, const GLint64EXT *value);
typedef void (* PFNGLUNIFORM1UI64NVPROC) (GLint location, GLuint64EXT x);
typedef void (* PFNGLUNIFORM2UI64NVPROC) (GLint location, GLuint64EXT x, GLuint64EXT y);
typedef void (* PFNGLUNIFORM3UI64NVPROC) (GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z);
typedef void (* PFNGLUNIFORM4UI64NVPROC) (GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z, GLuint64EXT w);
typedef void (* PFNGLUNIFORM1UI64VNVPROC) (GLint location, GLsizei count, const GLuint64EXT *value);
typedef void (* PFNGLUNIFORM2UI64VNVPROC) (GLint location, GLsizei count, const GLuint64EXT *value);
typedef void (* PFNGLUNIFORM3UI64VNVPROC) (GLint location, GLsizei count, const GLuint64EXT *value);
typedef void (* PFNGLUNIFORM4UI64VNVPROC) (GLint location, GLsizei count, const GLuint64EXT *value);
typedef void (* PFNGLGETUNIFORMI64VNVPROC) (GLuint program, GLint location, GLint64EXT *params);
typedef void (* PFNGLPROGRAMUNIFORM1I64NVPROC) (GLuint program, GLint location, GLint64EXT x);
typedef void (* PFNGLPROGRAMUNIFORM2I64NVPROC) (GLuint program, GLint location, GLint64EXT x, GLint64EXT y);
typedef void (* PFNGLPROGRAMUNIFORM3I64NVPROC) (GLuint program, GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z);
typedef void (* PFNGLPROGRAMUNIFORM4I64NVPROC) (GLuint program, GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z, GLint64EXT w);
typedef void (* PFNGLPROGRAMUNIFORM1I64VNVPROC) (GLuint program, GLint location, GLsizei count, const GLint64EXT *value);
typedef void (* PFNGLPROGRAMUNIFORM2I64VNVPROC) (GLuint program, GLint location, GLsizei count, const GLint64EXT *value);
typedef void (* PFNGLPROGRAMUNIFORM3I64VNVPROC) (GLuint program, GLint location, GLsizei count, const GLint64EXT *value);
typedef void (* PFNGLPROGRAMUNIFORM4I64VNVPROC) (GLuint program, GLint location, GLsizei count, const GLint64EXT *value);
typedef void (* PFNGLPROGRAMUNIFORM1UI64NVPROC) (GLuint program, GLint location, GLuint64EXT x);
typedef void (* PFNGLPROGRAMUNIFORM2UI64NVPROC) (GLuint program, GLint location, GLuint64EXT x, GLuint64EXT y);
typedef void (* PFNGLPROGRAMUNIFORM3UI64NVPROC) (GLuint program, GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z);
typedef void (* PFNGLPROGRAMUNIFORM4UI64NVPROC) (GLuint program, GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z, GLuint64EXT w);
typedef void (* PFNGLPROGRAMUNIFORM1UI64VNVPROC) (GLuint program, GLint location, GLsizei count, const GLuint64EXT *value);
typedef void (* PFNGLPROGRAMUNIFORM2UI64VNVPROC) (GLuint program, GLint location, GLsizei count, const GLuint64EXT *value);
typedef void (* PFNGLPROGRAMUNIFORM3UI64VNVPROC) (GLuint program, GLint location, GLsizei count, const GLuint64EXT *value);
typedef void (* PFNGLPROGRAMUNIFORM4UI64VNVPROC) (GLuint program, GLint location, GLsizei count, const GLuint64EXT *value);

void glUniform1i64NV (GLint location, GLint64EXT x);
void glUniform2i64NV (GLint location, GLint64EXT x, GLint64EXT y);
void glUniform3i64NV (GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z);
void glUniform4i64NV (GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z, GLint64EXT w);
void glUniform1i64vNV (GLint location, GLsizei count, const GLint64EXT *value);
void glUniform2i64vNV (GLint location, GLsizei count, const GLint64EXT *value);
void glUniform3i64vNV (GLint location, GLsizei count, const GLint64EXT *value);
void glUniform4i64vNV (GLint location, GLsizei count, const GLint64EXT *value);
void glUniform1ui64NV (GLint location, GLuint64EXT x);
void glUniform2ui64NV (GLint location, GLuint64EXT x, GLuint64EXT y);
void glUniform3ui64NV (GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z);
void glUniform4ui64NV (GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z, GLuint64EXT w);
void glUniform1ui64vNV (GLint location, GLsizei count, const GLuint64EXT *value);
void glUniform2ui64vNV (GLint location, GLsizei count, const GLuint64EXT *value);
void glUniform3ui64vNV (GLint location, GLsizei count, const GLuint64EXT *value);
void glUniform4ui64vNV (GLint location, GLsizei count, const GLuint64EXT *value);
void glGetUniformi64vNV (GLuint program, GLint location, GLint64EXT *params);
void glProgramUniform1i64NV (GLuint program, GLint location, GLint64EXT x);
void glProgramUniform2i64NV (GLuint program, GLint location, GLint64EXT x, GLint64EXT y);
void glProgramUniform3i64NV (GLuint program, GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z);
void glProgramUniform4i64NV (GLuint program, GLint location, GLint64EXT x, GLint64EXT y, GLint64EXT z, GLint64EXT w);
void glProgramUniform1i64vNV (GLuint program, GLint location, GLsizei count, const GLint64EXT *value);
void glProgramUniform2i64vNV (GLuint program, GLint location, GLsizei count, const GLint64EXT *value);
void glProgramUniform3i64vNV (GLuint program, GLint location, GLsizei count, const GLint64EXT *value);
void glProgramUniform4i64vNV (GLuint program, GLint location, GLsizei count, const GLint64EXT *value);
void glProgramUniform1ui64NV (GLuint program, GLint location, GLuint64EXT x);
void glProgramUniform2ui64NV (GLuint program, GLint location, GLuint64EXT x, GLuint64EXT y);
void glProgramUniform3ui64NV (GLuint program, GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z);
void glProgramUniform4ui64NV (GLuint program, GLint location, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z, GLuint64EXT w);
void glProgramUniform1ui64vNV (GLuint program, GLint location, GLsizei count, const GLuint64EXT *value);
void glProgramUniform2ui64vNV (GLuint program, GLint location, GLsizei count, const GLuint64EXT *value);
void glProgramUniform3ui64vNV (GLuint program, GLint location, GLsizei count, const GLuint64EXT *value);
void glProgramUniform4ui64vNV (GLuint program, GLint location, GLsizei count, const GLuint64EXT *value);

enum {
    GL_NV_internalformat_sample_query = 1,
    GL_MULTISAMPLES_NV                = 0x9371,
    GL_SUPERSAMPLE_SCALE_X_NV         = 0x9372,
    GL_SUPERSAMPLE_SCALE_Y_NV         = 0x9373,
    GL_CONFORMANT_NV                  = 0x9374
};
typedef void (* PFNGLGETINTERNALFORMATSAMPLEIVNVPROC) (GLenum target, GLenum internalformat, GLsizei samples, GLenum pname, GLsizei count, GLint *params);
void glGetInternalformatSampleivNV (GLenum target, GLenum internalformat, GLsizei samples, GLenum pname, GLsizei count, GLint *params);

enum {
    GL_NV_memory_attachment           = 1,
    GL_ATTACHED_MEMORY_OBJECT_NV      = 0x95A4,
    GL_ATTACHED_MEMORY_OFFSET_NV      = 0x95A5,
    GL_MEMORY_ATTACHABLE_ALIGNMENT_NV = 0x95A6,
    GL_MEMORY_ATTACHABLE_SIZE_NV      = 0x95A7,
    GL_MEMORY_ATTACHABLE_NV           = 0x95A8,
    GL_DETACHED_MEMORY_INCARNATION_NV = 0x95A9,
    GL_DETACHED_TEXTURES_NV           = 0x95AA,
    GL_DETACHED_BUFFERS_NV            = 0x95AB,
    GL_MAX_DETACHED_TEXTURES_NV       = 0x95AC,
    GL_MAX_DETACHED_BUFFERS_NV        = 0x95AD
};
typedef void (* PFNGLGETMEMORYOBJECTDETACHEDRESOURCESUIVNVPROC) (GLuint memory, GLenum pname, GLint first, GLsizei count, GLuint *params);
typedef void (* PFNGLRESETMEMORYOBJECTPARAMETERNVPROC) (GLuint memory, GLenum pname);
typedef void (* PFNGLTEXATTACHMEMORYNVPROC) (GLenum target, GLuint memory, GLuint64 offset);
typedef void (* PFNGLBUFFERATTACHMEMORYNVPROC) (GLenum target, GLuint memory, GLuint64 offset);
typedef void (* PFNGLTEXTUREATTACHMEMORYNVPROC) (GLuint texture, GLuint memory, GLuint64 offset);
typedef void (* PFNGLNAMEDBUFFERATTACHMEMORYNVPROC) (GLuint buffer, GLuint memory, GLuint64 offset);

void glGetMemoryObjectDetachedResourcesuivNV (GLuint memory, GLenum pname, GLint first, GLsizei count, GLuint *params);
void glResetMemoryObjectParameterNV (GLuint memory, GLenum pname);
void glTexAttachMemoryNV (GLenum target, GLuint memory, GLuint64 offset);
void glBufferAttachMemoryNV (GLenum target, GLuint memory, GLuint64 offset);
void glTextureAttachMemoryNV (GLuint texture, GLuint memory, GLuint64 offset);
void glNamedBufferAttachMemoryNV (GLuint buffer, GLuint memory, GLuint64 offset);

enum {
    GL_NV_mesh_shader                 = 1,
    GL_MESH_SHADER_NV                 = 0x9559,
    GL_TASK_SHADER_NV                 = 0x955A,
    GL_MAX_MESH_UNIFORM_BLOCKS_NV     = 0x8E60,
    GL_MAX_MESH_TEXTURE_IMAGE_UNITS_NV = 0x8E61,
    GL_MAX_MESH_IMAGE_UNIFORMS_NV     = 0x8E62,
    GL_MAX_MESH_UNIFORM_COMPONENTS_NV = 0x8E63,
    GL_MAX_MESH_ATOMIC_COUNTER_BUFFERS_NV = 0x8E64,
    GL_MAX_MESH_ATOMIC_COUNTERS_NV    = 0x8E65,
    GL_MAX_MESH_SHADER_STORAGE_BLOCKS_NV = 0x8E66,
    GL_MAX_COMBINED_MESH_UNIFORM_COMPONENTS_NV = 0x8E67,
    GL_MAX_TASK_UNIFORM_BLOCKS_NV     = 0x8E68,
    GL_MAX_TASK_TEXTURE_IMAGE_UNITS_NV = 0x8E69,
    GL_MAX_TASK_IMAGE_UNIFORMS_NV     = 0x8E6A,
    GL_MAX_TASK_UNIFORM_COMPONENTS_NV = 0x8E6B,
    GL_MAX_TASK_ATOMIC_COUNTER_BUFFERS_NV = 0x8E6C,
    GL_MAX_TASK_ATOMIC_COUNTERS_NV    = 0x8E6D,
    GL_MAX_TASK_SHADER_STORAGE_BLOCKS_NV = 0x8E6E,
    GL_MAX_COMBINED_TASK_UNIFORM_COMPONENTS_NV = 0x8E6F,
    GL_MAX_MESH_WORK_GROUP_INVOCATIONS_NV = 0x95A2,
    GL_MAX_TASK_WORK_GROUP_INVOCATIONS_NV = 0x95A3,
    GL_MAX_MESH_TOTAL_MEMORY_SIZE_NV  = 0x9536,
    GL_MAX_TASK_TOTAL_MEMORY_SIZE_NV  = 0x9537,
    GL_MAX_MESH_OUTPUT_VERTICES_NV    = 0x9538,
    GL_MAX_MESH_OUTPUT_PRIMITIVES_NV  = 0x9539,
    GL_MAX_TASK_OUTPUT_COUNT_NV       = 0x953A,
    GL_MAX_DRAW_MESH_TASKS_COUNT_NV   = 0x953D,
    GL_MAX_MESH_VIEWS_NV              = 0x9557,
    GL_MESH_OUTPUT_PER_VERTEX_GRANULARITY_NV = 0x92DF,
    GL_MESH_OUTPUT_PER_PRIMITIVE_GRANULARITY_NV = 0x9543,
    GL_MAX_MESH_WORK_GROUP_SIZE_NV    = 0x953B,
    GL_MAX_TASK_WORK_GROUP_SIZE_NV    = 0x953C,
    GL_MESH_WORK_GROUP_SIZE_NV        = 0x953E,
    GL_TASK_WORK_GROUP_SIZE_NV        = 0x953F,
    GL_MESH_VERTICES_OUT_NV           = 0x9579,
    GL_MESH_PRIMITIVES_OUT_NV         = 0x957A,
    GL_MESH_OUTPUT_TYPE_NV            = 0x957B,
    GL_UNIFORM_BLOCK_REFERENCED_BY_MESH_SHADER_NV = 0x959C,
    GL_UNIFORM_BLOCK_REFERENCED_BY_TASK_SHADER_NV = 0x959D,
    GL_REFERENCED_BY_MESH_SHADER_NV   = 0x95A0,
    GL_REFERENCED_BY_TASK_SHADER_NV   = 0x95A1,
    GL_MESH_SHADER_BIT_NV             = 0x00000040,
    GL_TASK_SHADER_BIT_NV             = 0x00000080,
    GL_MESH_SUBROUTINE_NV             = 0x957C,
    GL_TASK_SUBROUTINE_NV             = 0x957D,
    GL_MESH_SUBROUTINE_UNIFORM_NV     = 0x957E,
    GL_TASK_SUBROUTINE_UNIFORM_NV     = 0x957F,
    GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_MESH_SHADER_NV = 0x959E,
    GL_ATOMIC_COUNTER_BUFFER_REFERENCED_BY_TASK_SHADER_NV = 0x959F
};
typedef void (* PFNGLDRAWMESHTASKSNVPROC) (GLuint first, GLuint count);
typedef void (* PFNGLDRAWMESHTASKSINDIRECTNVPROC) (GLintptr indirect);
typedef void (* PFNGLMULTIDRAWMESHTASKSINDIRECTNVPROC) (GLintptr indirect, GLsizei drawcount, GLsizei stride);
typedef void (* PFNGLMULTIDRAWMESHTASKSINDIRECTCOUNTNVPROC) (GLintptr indirect, GLintptr drawcount, GLsizei maxdrawcount, GLsizei stride);
void glDrawMeshTasksNV (GLuint first, GLuint count);
void glDrawMeshTasksIndirectNV (GLintptr indirect);
void glMultiDrawMeshTasksIndirectNV (GLintptr indirect, GLsizei drawcount, GLsizei stride);
void glMultiDrawMeshTasksIndirectCountNV (GLintptr indirect, GLintptr drawcount, GLsizei maxdrawcount, GLsizei stride);

enum {
    GL_NV_path_rendering              = 1,
    GL_PATH_FORMAT_SVG_NV             = 0x9070,
    GL_PATH_FORMAT_PS_NV              = 0x9071,
    GL_STANDARD_FONT_NAME_NV          = 0x9072,
    GL_SYSTEM_FONT_NAME_NV            = 0x9073,
    GL_FILE_NAME_NV                   = 0x9074,
    GL_PATH_STROKE_WIDTH_NV           = 0x9075,
    GL_PATH_END_CAPS_NV               = 0x9076,
    GL_PATH_INITIAL_END_CAP_NV        = 0x9077,
    GL_PATH_TERMINAL_END_CAP_NV       = 0x9078,
    GL_PATH_JOIN_STYLE_NV             = 0x9079,
    GL_PATH_MITER_LIMIT_NV            = 0x907A,
    GL_PATH_DASH_CAPS_NV              = 0x907B,
    GL_PATH_INITIAL_DASH_CAP_NV       = 0x907C,
    GL_PATH_TERMINAL_DASH_CAP_NV      = 0x907D,
    GL_PATH_DASH_OFFSET_NV            = 0x907E,
    GL_PATH_CLIENT_LENGTH_NV          = 0x907F,
    GL_PATH_FILL_MODE_NV              = 0x9080,
    GL_PATH_FILL_MASK_NV              = 0x9081,
    GL_PATH_FILL_COVER_MODE_NV        = 0x9082,
    GL_PATH_STROKE_COVER_MODE_NV      = 0x9083,
    GL_PATH_STROKE_MASK_NV            = 0x9084,
    GL_COUNT_UP_NV                    = 0x9088,
    GL_COUNT_DOWN_NV                  = 0x9089,
    GL_PATH_OBJECT_BOUNDING_BOX_NV    = 0x908A,
    GL_CONVEX_HULL_NV                 = 0x908B,
    GL_BOUNDING_BOX_NV                = 0x908D,
    GL_TRANSLATE_X_NV                 = 0x908E,
    GL_TRANSLATE_Y_NV                 = 0x908F,
    GL_TRANSLATE_2D_NV                = 0x9090,
    GL_TRANSLATE_3D_NV                = 0x9091,
    GL_AFFINE_2D_NV                   = 0x9092,
    GL_AFFINE_3D_NV                   = 0x9094,
    GL_TRANSPOSE_AFFINE_2D_NV         = 0x9096,
    GL_TRANSPOSE_AFFINE_3D_NV         = 0x9098,
    GL_UTF8_NV                        = 0x909A,
    GL_UTF16_NV                       = 0x909B,
    GL_BOUNDING_BOX_OF_BOUNDING_BOXES_NV = 0x909C,
    GL_PATH_COMMAND_COUNT_NV          = 0x909D,
    GL_PATH_COORD_COUNT_NV            = 0x909E,
    GL_PATH_DASH_ARRAY_COUNT_NV       = 0x909F,
    GL_PATH_COMPUTED_LENGTH_NV        = 0x90A0,
    GL_PATH_FILL_BOUNDING_BOX_NV      = 0x90A1,
    GL_PATH_STROKE_BOUNDING_BOX_NV    = 0x90A2,
    GL_SQUARE_NV                      = 0x90A3,
    GL_ROUND_NV                       = 0x90A4,
    GL_TRIANGULAR_NV                  = 0x90A5,
    GL_BEVEL_NV                       = 0x90A6,
    GL_MITER_REVERT_NV                = 0x90A7,
    GL_MITER_TRUNCATE_NV              = 0x90A8,
    GL_SKIP_MISSING_GLYPH_NV          = 0x90A9,
    GL_USE_MISSING_GLYPH_NV           = 0x90AA,
    GL_PATH_ERROR_POSITION_NV         = 0x90AB,
    GL_ACCUM_ADJACENT_PAIRS_NV        = 0x90AD,
    GL_ADJACENT_PAIRS_NV              = 0x90AE,
    GL_FIRST_TO_REST_NV               = 0x90AF,
    GL_PATH_GEN_MODE_NV               = 0x90B0,
    GL_PATH_GEN_COEFF_NV              = 0x90B1,
    GL_PATH_GEN_COMPONENTS_NV         = 0x90B3,
    GL_PATH_STENCIL_FUNC_NV           = 0x90B7,
    GL_PATH_STENCIL_REF_NV            = 0x90B8,
    GL_PATH_STENCIL_VALUE_MASK_NV     = 0x90B9,
    GL_PATH_STENCIL_DEPTH_OFFSET_FACTOR_NV = 0x90BD,
    GL_PATH_STENCIL_DEPTH_OFFSET_UNITS_NV = 0x90BE,
    GL_PATH_COVER_DEPTH_FUNC_NV       = 0x90BF,
    GL_PATH_DASH_OFFSET_RESET_NV      = 0x90B4,
    GL_MOVE_TO_RESETS_NV              = 0x90B5,
    GL_MOVE_TO_CONTINUES_NV           = 0x90B6,
    GL_CLOSE_PATH_NV                  = 0x00,
    GL_MOVE_TO_NV                     = 0x02,
    GL_RELATIVE_MOVE_TO_NV            = 0x03,
    GL_LINE_TO_NV                     = 0x04,
    GL_RELATIVE_LINE_TO_NV            = 0x05,
    GL_HORIZONTAL_LINE_TO_NV          = 0x06,
    GL_RELATIVE_HORIZONTAL_LINE_TO_NV = 0x07,
    GL_VERTICAL_LINE_TO_NV            = 0x08,
    GL_RELATIVE_VERTICAL_LINE_TO_NV   = 0x09,
    GL_QUADRATIC_CURVE_TO_NV          = 0x0A,
    GL_RELATIVE_QUADRATIC_CURVE_TO_NV = 0x0B,
    GL_CUBIC_CURVE_TO_NV              = 0x0C,
    GL_RELATIVE_CUBIC_CURVE_TO_NV     = 0x0D,
    GL_SMOOTH_QUADRATIC_CURVE_TO_NV   = 0x0E,
    GL_RELATIVE_SMOOTH_QUADRATIC_CURVE_TO_NV = 0x0F,
    GL_SMOOTH_CUBIC_CURVE_TO_NV       = 0x10,
    GL_RELATIVE_SMOOTH_CUBIC_CURVE_TO_NV = 0x11,
    GL_SMALL_CCW_ARC_TO_NV            = 0x12,
    GL_RELATIVE_SMALL_CCW_ARC_TO_NV   = 0x13,
    GL_SMALL_CW_ARC_TO_NV             = 0x14,
    GL_RELATIVE_SMALL_CW_ARC_TO_NV    = 0x15,
    GL_LARGE_CCW_ARC_TO_NV            = 0x16,
    GL_RELATIVE_LARGE_CCW_ARC_TO_NV   = 0x17,
    GL_LARGE_CW_ARC_TO_NV             = 0x18,
    GL_RELATIVE_LARGE_CW_ARC_TO_NV    = 0x19,
    GL_RESTART_PATH_NV                = 0xF0,
    GL_DUP_FIRST_CUBIC_CURVE_TO_NV    = 0xF2,
    GL_DUP_LAST_CUBIC_CURVE_TO_NV     = 0xF4,
    GL_RECT_NV                        = 0xF6,
    GL_CIRCULAR_CCW_ARC_TO_NV         = 0xF8,
    GL_CIRCULAR_CW_ARC_TO_NV          = 0xFA,
    GL_CIRCULAR_TANGENT_ARC_TO_NV     = 0xFC,
    GL_ARC_TO_NV                      = 0xFE,
    GL_RELATIVE_ARC_TO_NV             = 0xFF,
    GL_BOLD_BIT_NV                    = 0x01,
    GL_ITALIC_BIT_NV                  = 0x02,
    GL_GLYPH_WIDTH_BIT_NV             = 0x01,
    GL_GLYPH_HEIGHT_BIT_NV            = 0x02,
    GL_GLYPH_HORIZONTAL_BEARING_X_BIT_NV = 0x04,
    GL_GLYPH_HORIZONTAL_BEARING_Y_BIT_NV = 0x08,
    GL_GLYPH_HORIZONTAL_BEARING_ADVANCE_BIT_NV = 0x10,
    GL_GLYPH_VERTICAL_BEARING_X_BIT_NV = 0x20,
    GL_GLYPH_VERTICAL_BEARING_Y_BIT_NV = 0x40,
    GL_GLYPH_VERTICAL_BEARING_ADVANCE_BIT_NV = 0x80,
    GL_GLYPH_HAS_KERNING_BIT_NV       = 0x100,
    GL_FONT_X_MIN_BOUNDS_BIT_NV       = 0x00010000,
    GL_FONT_Y_MIN_BOUNDS_BIT_NV       = 0x00020000,
    GL_FONT_X_MAX_BOUNDS_BIT_NV       = 0x00040000,
    GL_FONT_Y_MAX_BOUNDS_BIT_NV       = 0x00080000,
    GL_FONT_UNITS_PER_EM_BIT_NV       = 0x00100000,
    GL_FONT_ASCENDER_BIT_NV           = 0x00200000,
    GL_FONT_DESCENDER_BIT_NV          = 0x00400000,
    GL_FONT_HEIGHT_BIT_NV             = 0x00800000,
    GL_FONT_MAX_ADVANCE_WIDTH_BIT_NV  = 0x01000000,
    GL_FONT_MAX_ADVANCE_HEIGHT_BIT_NV = 0x02000000,
    GL_FONT_UNDERLINE_POSITION_BIT_NV = 0x04000000,
    GL_FONT_UNDERLINE_THICKNESS_BIT_NV = 0x08000000,
    GL_FONT_HAS_KERNING_BIT_NV        = 0x10000000,
    GL_ROUNDED_RECT_NV                = 0xE8,
    GL_RELATIVE_ROUNDED_RECT_NV       = 0xE9,
    GL_ROUNDED_RECT2_NV               = 0xEA,
    GL_RELATIVE_ROUNDED_RECT2_NV      = 0xEB,
    GL_ROUNDED_RECT4_NV               = 0xEC,
    GL_RELATIVE_ROUNDED_RECT4_NV      = 0xED,
    GL_ROUNDED_RECT8_NV               = 0xEE,
    GL_RELATIVE_ROUNDED_RECT8_NV      = 0xEF,
    GL_RELATIVE_RECT_NV               = 0xF7,
    GL_FONT_GLYPHS_AVAILABLE_NV       = 0x9368,
    GL_FONT_TARGET_UNAVAILABLE_NV     = 0x9369,
    GL_FONT_UNAVAILABLE_NV            = 0x936A,
    GL_FONT_UNINTELLIGIBLE_NV         = 0x936B,
    GL_CONIC_CURVE_TO_NV              = 0x1A,
    GL_RELATIVE_CONIC_CURVE_TO_NV     = 0x1B,
    GL_FONT_NUM_GLYPH_INDICES_BIT_NV  = 0x20000000,
    GL_STANDARD_FONT_FORMAT_NV        = 0x936C,
    GL_PATH_PROJECTION_NV             = 0x1701,
    GL_PATH_MODELVIEW_NV              = 0x1700,
    GL_PATH_MODELVIEW_STACK_DEPTH_NV  = 0x0BA3,
    GL_PATH_MODELVIEW_MATRIX_NV       = 0x0BA6,
    GL_PATH_MAX_MODELVIEW_STACK_DEPTH_NV = 0x0D36,
    GL_PATH_TRANSPOSE_MODELVIEW_MATRIX_NV = 0x84E3,
    GL_PATH_PROJECTION_STACK_DEPTH_NV = 0x0BA4,
    GL_PATH_PROJECTION_MATRIX_NV      = 0x0BA7,
    GL_PATH_MAX_PROJECTION_STACK_DEPTH_NV = 0x0D38,
    GL_PATH_TRANSPOSE_PROJECTION_MATRIX_NV = 0x84E4,
    GL_FRAGMENT_INPUT_NV              = 0x936D
};
typedef GLuint (* PFNGLGENPATHSNVPROC) (GLsizei range);
typedef void (* PFNGLDELETEPATHSNVPROC) (GLuint path, GLsizei range);
typedef GLboolean (* PFNGLISPATHNVPROC) (GLuint path);
typedef void (* PFNGLPATHCOMMANDSNVPROC) (GLuint path, GLsizei numCommands, const GLubyte *commands, GLsizei numCoords, GLenum coordType, const void *coords);
typedef void (* PFNGLPATHCOORDSNVPROC) (GLuint path, GLsizei numCoords, GLenum coordType, const void *coords);
typedef void (* PFNGLPATHSUBCOMMANDSNVPROC) (GLuint path, GLsizei commandStart, GLsizei commandsToDelete, GLsizei numCommands, const GLubyte *commands, GLsizei numCoords, GLenum coordType, const void *coords);
typedef void (* PFNGLPATHSUBCOORDSNVPROC) (GLuint path, GLsizei coordStart, GLsizei numCoords, GLenum coordType, const void *coords);
typedef void (* PFNGLPATHSTRINGNVPROC) (GLuint path, GLenum format, GLsizei length, const void *pathString);
typedef void (* PFNGLPATHGLYPHSNVPROC) (GLuint firstPathName, GLenum fontTarget, const void *fontName, GLbitfield fontStyle, GLsizei numGlyphs, GLenum type, const void *charcodes, GLenum handleMissingGlyphs, GLuint pathParameterTemplate, GLfloat emScale);
typedef void (* PFNGLPATHGLYPHRANGENVPROC) (GLuint firstPathName, GLenum fontTarget, const void *fontName, GLbitfield fontStyle, GLuint firstGlyph, GLsizei numGlyphs, GLenum handleMissingGlyphs, GLuint pathParameterTemplate, GLfloat emScale);
typedef void (* PFNGLWEIGHTPATHSNVPROC) (GLuint resultPath, GLsizei numPaths, const GLuint *paths, const GLfloat *weights);
typedef void (* PFNGLCOPYPATHNVPROC) (GLuint resultPath, GLuint srcPath);
typedef void (* PFNGLINTERPOLATEPATHSNVPROC) (GLuint resultPath, GLuint pathA, GLuint pathB, GLfloat weight);
typedef void (* PFNGLTRANSFORMPATHNVPROC) (GLuint resultPath, GLuint srcPath, GLenum transformType, const GLfloat *transformValues);
typedef void (* PFNGLPATHPARAMETERIVNVPROC) (GLuint path, GLenum pname, const GLint *value);
typedef void (* PFNGLPATHPARAMETERINVPROC) (GLuint path, GLenum pname, GLint value);
typedef void (* PFNGLPATHPARAMETERFVNVPROC) (GLuint path, GLenum pname, const GLfloat *value);
typedef void (* PFNGLPATHPARAMETERFNVPROC) (GLuint path, GLenum pname, GLfloat value);
typedef void (* PFNGLPATHDASHARRAYNVPROC) (GLuint path, GLsizei dashCount, const GLfloat *dashArray);
typedef void (* PFNGLPATHSTENCILFUNCNVPROC) (GLenum func, GLint ref, GLuint mask);
typedef void (* PFNGLPATHSTENCILDEPTHOFFSETNVPROC) (GLfloat factor, GLfloat units);
typedef void (* PFNGLSTENCILFILLPATHNVPROC) (GLuint path, GLenum fillMode, GLuint mask);
typedef void (* PFNGLSTENCILSTROKEPATHNVPROC) (GLuint path, GLint reference, GLuint mask);
typedef void (* PFNGLSTENCILFILLPATHINSTANCEDNVPROC) (GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLenum fillMode, GLuint mask, GLenum transformType, const GLfloat *transformValues);
typedef void (* PFNGLSTENCILSTROKEPATHINSTANCEDNVPROC) (GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLint reference, GLuint mask, GLenum transformType, const GLfloat *transformValues);
typedef void (* PFNGLPATHCOVERDEPTHFUNCNVPROC) (GLenum func);
typedef void (* PFNGLCOVERFILLPATHNVPROC) (GLuint path, GLenum coverMode);
typedef void (* PFNGLCOVERSTROKEPATHNVPROC) (GLuint path, GLenum coverMode);
typedef void (* PFNGLCOVERFILLPATHINSTANCEDNVPROC) (GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLenum coverMode, GLenum transformType, const GLfloat *transformValues);
typedef void (* PFNGLCOVERSTROKEPATHINSTANCEDNVPROC) (GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLenum coverMode, GLenum transformType, const GLfloat *transformValues);
typedef void (* PFNGLGETPATHPARAMETERIVNVPROC) (GLuint path, GLenum pname, GLint *value);
typedef void (* PFNGLGETPATHPARAMETERFVNVPROC) (GLuint path, GLenum pname, GLfloat *value);
typedef void (* PFNGLGETPATHCOMMANDSNVPROC) (GLuint path, GLubyte *commands);
typedef void (* PFNGLGETPATHCOORDSNVPROC) (GLuint path, GLfloat *coords);
typedef void (* PFNGLGETPATHDASHARRAYNVPROC) (GLuint path, GLfloat *dashArray);
typedef void (* PFNGLGETPATHMETRICSNVPROC) (GLbitfield metricQueryMask, GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLsizei stride, GLfloat *metrics);
typedef void (* PFNGLGETPATHMETRICRANGENVPROC) (GLbitfield metricQueryMask, GLuint firstPathName, GLsizei numPaths, GLsizei stride, GLfloat *metrics);
typedef void (* PFNGLGETPATHSPACINGNVPROC) (GLenum pathListMode, GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLfloat advanceScale, GLfloat kerningScale, GLenum transformType, GLfloat *returnedSpacing);
typedef GLboolean (* PFNGLISPOINTINFILLPATHNVPROC) (GLuint path, GLuint mask, GLfloat x, GLfloat y);
typedef GLboolean (* PFNGLISPOINTINSTROKEPATHNVPROC) (GLuint path, GLfloat x, GLfloat y);
typedef GLfloat (* PFNGLGETPATHLENGTHNVPROC) (GLuint path, GLsizei startSegment, GLsizei numSegments);
typedef GLboolean (* PFNGLPOINTALONGPATHNVPROC) (GLuint path, GLsizei startSegment, GLsizei numSegments, GLfloat distance, GLfloat *x, GLfloat *y, GLfloat *tangentX, GLfloat *tangentY);
typedef void (* PFNGLMATRIXLOAD3X2FNVPROC) (GLenum matrixMode, const GLfloat *m);
typedef void (* PFNGLMATRIXLOAD3X3FNVPROC) (GLenum matrixMode, const GLfloat *m);
typedef void (* PFNGLMATRIXLOADTRANSPOSE3X3FNVPROC) (GLenum matrixMode, const GLfloat *m);
typedef void (* PFNGLMATRIXMULT3X2FNVPROC) (GLenum matrixMode, const GLfloat *m);
typedef void (* PFNGLMATRIXMULT3X3FNVPROC) (GLenum matrixMode, const GLfloat *m);
typedef void (* PFNGLMATRIXMULTTRANSPOSE3X3FNVPROC) (GLenum matrixMode, const GLfloat *m);
typedef void (* PFNGLSTENCILTHENCOVERFILLPATHNVPROC) (GLuint path, GLenum fillMode, GLuint mask, GLenum coverMode);
typedef void (* PFNGLSTENCILTHENCOVERSTROKEPATHNVPROC) (GLuint path, GLint reference, GLuint mask, GLenum coverMode);
typedef void (* PFNGLSTENCILTHENCOVERFILLPATHINSTANCEDNVPROC) (GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLenum fillMode, GLuint mask, GLenum coverMode, GLenum transformType, const GLfloat *transformValues);
typedef void (* PFNGLSTENCILTHENCOVERSTROKEPATHINSTANCEDNVPROC) (GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLint reference, GLuint mask, GLenum coverMode, GLenum transformType, const GLfloat *transformValues);
typedef GLenum (* PFNGLPATHGLYPHINDEXRANGENVPROC) (GLenum fontTarget, const void *fontName, GLbitfield fontStyle, GLuint pathParameterTemplate, GLfloat emScale, GLuint baseAndCount[2]);
typedef GLenum (* PFNGLPATHGLYPHINDEXARRAYNVPROC) (GLuint firstPathName, GLenum fontTarget, const void *fontName, GLbitfield fontStyle, GLuint firstGlyphIndex, GLsizei numGlyphs, GLuint pathParameterTemplate, GLfloat emScale);
typedef GLenum (* PFNGLPATHMEMORYGLYPHINDEXARRAYNVPROC) (GLuint firstPathName, GLenum fontTarget, GLsizeiptr fontSize, const void *fontData, GLsizei faceIndex, GLuint firstGlyphIndex, GLsizei numGlyphs, GLuint pathParameterTemplate, GLfloat emScale);
typedef void (* PFNGLPROGRAMPATHFRAGMENTINPUTGENNVPROC) (GLuint program, GLint location, GLenum genMode, GLint components, const GLfloat *coeffs);
typedef void (* PFNGLGETPROGRAMRESOURCEFVNVPROC) (GLuint program, GLenum programInterface, GLuint index, GLsizei propCount, const GLenum *props, GLsizei count, GLsizei *length, GLfloat *params);

GLuint glGenPathsNV (GLsizei range);
void glDeletePathsNV (GLuint path, GLsizei range);
GLboolean glIsPathNV (GLuint path);
void glPathCommandsNV (GLuint path, GLsizei numCommands, const GLubyte *commands, GLsizei numCoords, GLenum coordType, const void *coords);
void glPathCoordsNV (GLuint path, GLsizei numCoords, GLenum coordType, const void *coords);
void glPathSubCommandsNV (GLuint path, GLsizei commandStart, GLsizei commandsToDelete, GLsizei numCommands, const GLubyte *commands, GLsizei numCoords, GLenum coordType, const void *coords);
void glPathSubCoordsNV (GLuint path, GLsizei coordStart, GLsizei numCoords, GLenum coordType, const void *coords);
void glPathStringNV (GLuint path, GLenum format, GLsizei length, const void *pathString);
void glPathGlyphsNV (GLuint firstPathName, GLenum fontTarget, const void *fontName, GLbitfield fontStyle, GLsizei numGlyphs, GLenum type, const void *charcodes, GLenum handleMissingGlyphs, GLuint pathParameterTemplate, GLfloat emScale);
void glPathGlyphRangeNV (GLuint firstPathName, GLenum fontTarget, const void *fontName, GLbitfield fontStyle, GLuint firstGlyph, GLsizei numGlyphs, GLenum handleMissingGlyphs, GLuint pathParameterTemplate, GLfloat emScale);
void glWeightPathsNV (GLuint resultPath, GLsizei numPaths, const GLuint *paths, const GLfloat *weights);
void glCopyPathNV (GLuint resultPath, GLuint srcPath);
void glInterpolatePathsNV (GLuint resultPath, GLuint pathA, GLuint pathB, GLfloat weight);
void glTransformPathNV (GLuint resultPath, GLuint srcPath, GLenum transformType, const GLfloat *transformValues);
void glPathParameterivNV (GLuint path, GLenum pname, const GLint *value);
void glPathParameteriNV (GLuint path, GLenum pname, GLint value);
void glPathParameterfvNV (GLuint path, GLenum pname, const GLfloat *value);
void glPathParameterfNV (GLuint path, GLenum pname, GLfloat value);
void glPathDashArrayNV (GLuint path, GLsizei dashCount, const GLfloat *dashArray);
void glPathStencilFuncNV (GLenum func, GLint ref, GLuint mask);
void glPathStencilDepthOffsetNV (GLfloat factor, GLfloat units);
void glStencilFillPathNV (GLuint path, GLenum fillMode, GLuint mask);
void glStencilStrokePathNV (GLuint path, GLint reference, GLuint mask);
void glStencilFillPathInstancedNV (GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLenum fillMode, GLuint mask, GLenum transformType, const GLfloat *transformValues);
void glStencilStrokePathInstancedNV (GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLint reference, GLuint mask, GLenum transformType, const GLfloat *transformValues);
void glPathCoverDepthFuncNV (GLenum func);
void glCoverFillPathNV (GLuint path, GLenum coverMode);
void glCoverStrokePathNV (GLuint path, GLenum coverMode);
void glCoverFillPathInstancedNV (GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLenum coverMode, GLenum transformType, const GLfloat *transformValues);
void glCoverStrokePathInstancedNV (GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLenum coverMode, GLenum transformType, const GLfloat *transformValues);
void glGetPathParameterivNV (GLuint path, GLenum pname, GLint *value);
void glGetPathParameterfvNV (GLuint path, GLenum pname, GLfloat *value);
void glGetPathCommandsNV (GLuint path, GLubyte *commands);
void glGetPathCoordsNV (GLuint path, GLfloat *coords);
void glGetPathDashArrayNV (GLuint path, GLfloat *dashArray);
void glGetPathMetricsNV (GLbitfield metricQueryMask, GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLsizei stride, GLfloat *metrics);
void glGetPathMetricRangeNV (GLbitfield metricQueryMask, GLuint firstPathName, GLsizei numPaths, GLsizei stride, GLfloat *metrics);
void glGetPathSpacingNV (GLenum pathListMode, GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLfloat advanceScale, GLfloat kerningScale, GLenum transformType, GLfloat *returnedSpacing);
GLboolean glIsPointInFillPathNV (GLuint path, GLuint mask, GLfloat x, GLfloat y);
GLboolean glIsPointInStrokePathNV (GLuint path, GLfloat x, GLfloat y);
GLfloat glGetPathLengthNV (GLuint path, GLsizei startSegment, GLsizei numSegments);
GLboolean glPointAlongPathNV (GLuint path, GLsizei startSegment, GLsizei numSegments, GLfloat distance, GLfloat *x, GLfloat *y, GLfloat *tangentX, GLfloat *tangentY);
void glMatrixLoad3x2fNV (GLenum matrixMode, const GLfloat *m);
void glMatrixLoad3x3fNV (GLenum matrixMode, const GLfloat *m);
void glMatrixLoadTranspose3x3fNV (GLenum matrixMode, const GLfloat *m);
void glMatrixMult3x2fNV (GLenum matrixMode, const GLfloat *m);
void glMatrixMult3x3fNV (GLenum matrixMode, const GLfloat *m);
void glMatrixMultTranspose3x3fNV (GLenum matrixMode, const GLfloat *m);
void glStencilThenCoverFillPathNV (GLuint path, GLenum fillMode, GLuint mask, GLenum coverMode);
void glStencilThenCoverStrokePathNV (GLuint path, GLint reference, GLuint mask, GLenum coverMode);
void glStencilThenCoverFillPathInstancedNV (GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLenum fillMode, GLuint mask, GLenum coverMode, GLenum transformType, const GLfloat *transformValues);
void glStencilThenCoverStrokePathInstancedNV (GLsizei numPaths, GLenum pathNameType, const void *paths, GLuint pathBase, GLint reference, GLuint mask, GLenum coverMode, GLenum transformType, const GLfloat *transformValues);
GLenum glPathGlyphIndexRangeNV (GLenum fontTarget, const void *fontName, GLbitfield fontStyle, GLuint pathParameterTemplate, GLfloat emScale, GLuint baseAndCount[2]);
GLenum glPathGlyphIndexArrayNV (GLuint firstPathName, GLenum fontTarget, const void *fontName, GLbitfield fontStyle, GLuint firstGlyphIndex, GLsizei numGlyphs, GLuint pathParameterTemplate, GLfloat emScale);
GLenum glPathMemoryGlyphIndexArrayNV (GLuint firstPathName, GLenum fontTarget, GLsizeiptr fontSize, const void *fontData, GLsizei faceIndex, GLuint firstGlyphIndex, GLsizei numGlyphs, GLuint pathParameterTemplate, GLfloat emScale);
void glProgramPathFragmentInputGenNV (GLuint program, GLint location, GLenum genMode, GLint components, const GLfloat *coeffs);
void glGetProgramResourcefvNV (GLuint program, GLenum programInterface, GLuint index, GLsizei propCount, const GLenum *props, GLsizei count, GLsizei *length, GLfloat *params);

enum {
    GL_NV_path_rendering_shared_edge  = 1,
    GL_SHARED_EDGE_NV                 = 0xC0
};

enum {
    GL_NV_representative_fragment_test = 1,
    GL_REPRESENTATIVE_FRAGMENT_TEST_NV = 0x937F
};

enum {
    GL_NV_sample_locations = 1,
    GL_SAMPLE_LOCATION_SUBPIXEL_BITS_NV = 0x933D,
    GL_SAMPLE_LOCATION_PIXEL_GRID_WIDTH_NV = 0x933E,
    GL_SAMPLE_LOCATION_PIXEL_GRID_HEIGHT_NV = 0x933F,
    GL_PROGRAMMABLE_SAMPLE_LOCATION_TABLE_SIZE_NV = 0x9340,
    GL_SAMPLE_LOCATION_NV             = 0x8E50,
    GL_PROGRAMMABLE_SAMPLE_LOCATION_NV = 0x9341,
    GL_FRAMEBUFFER_PROGRAMMABLE_SAMPLE_LOCATIONS_NV = 0x9342,
    GL_FRAMEBUFFER_SAMPLE_LOCATION_PIXEL_GRID_NV = 0x9343
};
typedef void (* PFNGLFRAMEBUFFERSAMPLELOCATIONSFVNVPROC) (GLenum target, GLuint start, GLsizei count, const GLfloat *v);
typedef void (* PFNGLNAMEDFRAMEBUFFERSAMPLELOCATIONSFVNVPROC) (GLuint framebuffer, GLuint start, GLsizei count, const GLfloat *v);
typedef void (* PFNGLRESOLVEDEPTHVALUESNVPROC) (void);
void glFramebufferSampleLocationsfvNV (GLenum target, GLuint start, GLsizei count, const GLfloat *v);
void glNamedFramebufferSampleLocationsfvNV (GLuint framebuffer, GLuint start, GLsizei count, const GLfloat *v);
void glResolveDepthValuesNV (void);

enum { GL_NV_sample_mask_override_coverage = 1 };
enum {
    GL_NV_scissor_exclusive           = 1,
    GL_SCISSOR_TEST_EXCLUSIVE_NV      = 0x9555,
    GL_SCISSOR_BOX_EXCLUSIVE_NV       = 0x9556
};
typedef void (* PFNGLSCISSOREXCLUSIVENVPROC) (GLint x, GLint y, GLsizei width, GLsizei height);
typedef void (* PFNGLSCISSOREXCLUSIVEARRAYVNVPROC) (GLuint first, GLsizei count, const GLint *v);
void glScissorExclusiveNV (GLint x, GLint y, GLsizei width, GLsizei height);
void glScissorExclusiveArrayvNV (GLuint first, GLsizei count, const GLint *v);

enum { GL_NV_shader_atomic_counters = 1 };
enum { GL_NV_shader_atomic_float = 1 };
enum { GL_NV_shader_atomic_float64 = 1 };
enum { GL_NV_shader_atomic_fp16_vector = 1 };
enum { GL_NV_shader_atomic_int64 = 1 };
enum {
    GL_NV_shader_buffer_load          = 1,
    GL_BUFFER_GPU_ADDRESS_NV          = 0x8F1D,
    GL_GPU_ADDRESS_NV                 = 0x8F34,
    GL_MAX_SHADER_BUFFER_ADDRESS_NV   = 0x8F35
};
typedef void (* PFNGLMAKEBUFFERRESIDENTNVPROC) (GLenum target, GLenum access);
typedef void (* PFNGLMAKEBUFFERNONRESIDENTNVPROC) (GLenum target);
typedef GLboolean (* PFNGLISBUFFERRESIDENTNVPROC) (GLenum target);
typedef void (* PFNGLMAKENAMEDBUFFERRESIDENTNVPROC) (GLuint buffer, GLenum access);
typedef void (* PFNGLMAKENAMEDBUFFERNONRESIDENTNVPROC) (GLuint buffer);
typedef GLboolean (* PFNGLISNAMEDBUFFERRESIDENTNVPROC) (GLuint buffer);
typedef void (* PFNGLGETBUFFERPARAMETERUI64VNVPROC) (GLenum target, GLenum pname, GLuint64EXT *params);
typedef void (* PFNGLGETNAMEDBUFFERPARAMETERUI64VNVPROC) (GLuint buffer, GLenum pname, GLuint64EXT *params);
typedef void (* PFNGLGETINTEGERUI64VNVPROC) (GLenum value, GLuint64EXT *result);
typedef void (* PFNGLUNIFORMUI64NVPROC) (GLint location, GLuint64EXT value);
typedef void (* PFNGLUNIFORMUI64VNVPROC) (GLint location, GLsizei count, const GLuint64EXT *value);
typedef void (* PFNGLGETUNIFORMUI64VNVPROC) (GLuint program, GLint location, GLuint64EXT *params);
typedef void (* PFNGLPROGRAMUNIFORMUI64NVPROC) (GLuint program, GLint location, GLuint64EXT value);
typedef void (* PFNGLPROGRAMUNIFORMUI64VNVPROC) (GLuint program, GLint location, GLsizei count, const GLuint64EXT *value);

void glMakeBufferResidentNV (GLenum target, GLenum access);
void glMakeBufferNonResidentNV (GLenum target);
GLboolean glIsBufferResidentNV (GLenum target);
void glMakeNamedBufferResidentNV (GLuint buffer, GLenum access);
void glMakeNamedBufferNonResidentNV (GLuint buffer);
GLboolean glIsNamedBufferResidentNV (GLuint buffer);
void glGetBufferParameterui64vNV (GLenum target, GLenum pname, GLuint64EXT *params);
void glGetNamedBufferParameterui64vNV (GLuint buffer, GLenum pname, GLuint64EXT *params);
void glGetIntegerui64vNV (GLenum value, GLuint64EXT *result);
void glUniformui64NV (GLint location, GLuint64EXT value);
void glUniformui64vNV (GLint location, GLsizei count, const GLuint64EXT *value);
void glGetUniformui64vNV (GLuint program, GLint location, GLuint64EXT *params);
void glProgramUniformui64NV (GLuint program, GLint location, GLuint64EXT value);
void glProgramUniformui64vNV (GLuint program, GLint location, GLsizei count, const GLuint64EXT *value);

enum {
    GL_NV_shader_buffer_store              = 1,
    GL_SHADER_GLOBAL_ACCESS_BARRIER_BIT_NV = 0x00000010
};

enum {
    GL_NV_shader_subgroup_partitioned      = 1,
    GL_SUBGROUP_FEATURE_PARTITIONED_BIT_NV = 0x00000100
};

enum { GL_NV_shader_texture_footprint = 1 };
enum {
    GL_NV_shader_thread_group         = 1,
    GL_WARP_SIZE_NV                   = 0x9339,
    GL_WARPS_PER_SM_NV                = 0x933A,
    GL_SM_COUNT_NV                    = 0x933B
};

enum { GL_NV_shader_thread_shuffle = 1 };
enum {
    GL_NV_shading_rate_image          = 1,
    GL_SHADING_RATE_IMAGE_NV          = 0x9563,
    GL_SHADING_RATE_NO_INVOCATIONS_NV = 0x9564,
    GL_SHADING_RATE_1_INVOCATION_PER_PIXEL_NV = 0x9565,
    GL_SHADING_RATE_1_INVOCATION_PER_1X2_PIXELS_NV = 0x9566,
    GL_SHADING_RATE_1_INVOCATION_PER_2X1_PIXELS_NV = 0x9567,
    GL_SHADING_RATE_1_INVOCATION_PER_2X2_PIXELS_NV = 0x9568,
    GL_SHADING_RATE_1_INVOCATION_PER_2X4_PIXELS_NV = 0x9569,
    GL_SHADING_RATE_1_INVOCATION_PER_4X2_PIXELS_NV = 0x956A,
    GL_SHADING_RATE_1_INVOCATION_PER_4X4_PIXELS_NV = 0x956B,
    GL_SHADING_RATE_2_INVOCATIONS_PER_PIXEL_NV = 0x956C,
    GL_SHADING_RATE_4_INVOCATIONS_PER_PIXEL_NV = 0x956D,
    GL_SHADING_RATE_8_INVOCATIONS_PER_PIXEL_NV = 0x956E,
    GL_SHADING_RATE_16_INVOCATIONS_PER_PIXEL_NV = 0x956F,
    GL_SHADING_RATE_IMAGE_BINDING_NV  = 0x955B,
    GL_SHADING_RATE_IMAGE_TEXEL_WIDTH_NV = 0x955C,
    GL_SHADING_RATE_IMAGE_TEXEL_HEIGHT_NV = 0x955D,
    GL_SHADING_RATE_IMAGE_PALETTE_SIZE_NV = 0x955E,
    GL_MAX_COARSE_FRAGMENT_SAMPLES_NV = 0x955F,
    GL_SHADING_RATE_SAMPLE_ORDER_DEFAULT_NV = 0x95AE,
    GL_SHADING_RATE_SAMPLE_ORDER_PIXEL_MAJOR_NV = 0x95AF,
    GL_SHADING_RATE_SAMPLE_ORDER_SAMPLE_MAJOR_NV = 0x95B0
};
typedef void (* PFNGLBINDSHADINGRATEIMAGENVPROC) (GLuint texture);
typedef void (* PFNGLGETSHADINGRATEIMAGEPALETTENVPROC) (GLuint viewport, GLuint entry, GLenum *rate);
typedef void (* PFNGLGETSHADINGRATESAMPLELOCATIONIVNVPROC) (GLenum rate, GLuint samples, GLuint index, GLint *location);
typedef void (* PFNGLSHADINGRATEIMAGEBARRIERNVPROC) (GLboolean synchronize);
typedef void (* PFNGLSHADINGRATEIMAGEPALETTENVPROC) (GLuint viewport, GLuint first, GLsizei count, const GLenum *rates);
typedef void (* PFNGLSHADINGRATESAMPLEORDERNVPROC) (GLenum order);
typedef void (* PFNGLSHADINGRATESAMPLEORDERCUSTOMNVPROC) (GLenum rate, GLuint samples, const GLint *locations);

void glBindShadingRateImageNV (GLuint texture);
void glGetShadingRateImagePaletteNV (GLuint viewport, GLuint entry, GLenum *rate);
void glGetShadingRateSampleLocationivNV (GLenum rate, GLuint samples, GLuint index, GLint *location);
void glShadingRateImageBarrierNV (GLboolean synchronize);
void glShadingRateImagePaletteNV (GLuint viewport, GLuint first, GLsizei count, const GLenum *rates);
void glShadingRateSampleOrderNV (GLenum order);
void glShadingRateSampleOrderCustomNV (GLenum rate, GLuint samples, const GLint *locations);

enum { GL_NV_stereo_view_rendering = 1 };

enum { GL_NV_texture_barrier = 1 };
typedef void (* PFNGLTEXTUREBARRIERNVPROC) (void);
void glTextureBarrierNV (void);

enum { GL_NV_texture_rectangle_compressed = 1 };
enum {
    GL_NV_uniform_buffer_unified_memory = 1,
    GL_UNIFORM_BUFFER_UNIFIED_NV      = 0x936E,
    GL_UNIFORM_BUFFER_ADDRESS_NV      = 0x936F,
    GL_UNIFORM_BUFFER_LENGTH_NV       = 0x9370
};

enum { GL_NV_vertex_attrib_integer_64bit = 1 };
typedef void (* PFNGLVERTEXATTRIBL1I64NVPROC) (GLuint index, GLint64EXT x);
typedef void (* PFNGLVERTEXATTRIBL2I64NVPROC) (GLuint index, GLint64EXT x, GLint64EXT y);
typedef void (* PFNGLVERTEXATTRIBL3I64NVPROC) (GLuint index, GLint64EXT x, GLint64EXT y, GLint64EXT z);
typedef void (* PFNGLVERTEXATTRIBL4I64NVPROC) (GLuint index, GLint64EXT x, GLint64EXT y, GLint64EXT z, GLint64EXT w);
typedef void (* PFNGLVERTEXATTRIBL1I64VNVPROC) (GLuint index, const GLint64EXT *v);
typedef void (* PFNGLVERTEXATTRIBL2I64VNVPROC) (GLuint index, const GLint64EXT *v);
typedef void (* PFNGLVERTEXATTRIBL3I64VNVPROC) (GLuint index, const GLint64EXT *v);
typedef void (* PFNGLVERTEXATTRIBL4I64VNVPROC) (GLuint index, const GLint64EXT *v);
typedef void (* PFNGLVERTEXATTRIBL1UI64NVPROC) (GLuint index, GLuint64EXT x);
typedef void (* PFNGLVERTEXATTRIBL2UI64NVPROC) (GLuint index, GLuint64EXT x, GLuint64EXT y);
typedef void (* PFNGLVERTEXATTRIBL3UI64NVPROC) (GLuint index, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z);
typedef void (* PFNGLVERTEXATTRIBL4UI64NVPROC) (GLuint index, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z, GLuint64EXT w);
typedef void (* PFNGLVERTEXATTRIBL1UI64VNVPROC) (GLuint index, const GLuint64EXT *v);
typedef void (* PFNGLVERTEXATTRIBL2UI64VNVPROC) (GLuint index, const GLuint64EXT *v);
typedef void (* PFNGLVERTEXATTRIBL3UI64VNVPROC) (GLuint index, const GLuint64EXT *v);
typedef void (* PFNGLVERTEXATTRIBL4UI64VNVPROC) (GLuint index, const GLuint64EXT *v);
typedef void (* PFNGLGETVERTEXATTRIBLI64VNVPROC) (GLuint index, GLenum pname, GLint64EXT *params);
typedef void (* PFNGLGETVERTEXATTRIBLUI64VNVPROC) (GLuint index, GLenum pname, GLuint64EXT *params);
typedef void (* PFNGLVERTEXATTRIBLFORMATNVPROC) (GLuint index, GLint size, GLenum type, GLsizei stride);

void glVertexAttribL1i64NV (GLuint index, GLint64EXT x);
void glVertexAttribL2i64NV (GLuint index, GLint64EXT x, GLint64EXT y);
void glVertexAttribL3i64NV (GLuint index, GLint64EXT x, GLint64EXT y, GLint64EXT z);
void glVertexAttribL4i64NV (GLuint index, GLint64EXT x, GLint64EXT y, GLint64EXT z, GLint64EXT w);
void glVertexAttribL1i64vNV (GLuint index, const GLint64EXT *v);
void glVertexAttribL2i64vNV (GLuint index, const GLint64EXT *v);
void glVertexAttribL3i64vNV (GLuint index, const GLint64EXT *v);
void glVertexAttribL4i64vNV (GLuint index, const GLint64EXT *v);
void glVertexAttribL1ui64NV (GLuint index, GLuint64EXT x);
void glVertexAttribL2ui64NV (GLuint index, GLuint64EXT x, GLuint64EXT y);
void glVertexAttribL3ui64NV (GLuint index, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z);
void glVertexAttribL4ui64NV (GLuint index, GLuint64EXT x, GLuint64EXT y, GLuint64EXT z, GLuint64EXT w);
void glVertexAttribL1ui64vNV (GLuint index, const GLuint64EXT *v);
void glVertexAttribL2ui64vNV (GLuint index, const GLuint64EXT *v);
void glVertexAttribL3ui64vNV (GLuint index, const GLuint64EXT *v);
void glVertexAttribL4ui64vNV (GLuint index, const GLuint64EXT *v);
void glGetVertexAttribLi64vNV (GLuint index, GLenum pname, GLint64EXT *params);
void glGetVertexAttribLui64vNV (GLuint index, GLenum pname, GLuint64EXT *params);
void glVertexAttribLFormatNV (GLuint index, GLint size, GLenum type, GLsizei stride);

enum {
    GL_NV_vertex_buffer_unified_memory = 1,
    GL_VERTEX_ATTRIB_ARRAY_UNIFIED_NV = 0x8F1E,
    GL_ELEMENT_ARRAY_UNIFIED_NV       = 0x8F1F,
    GL_VERTEX_ATTRIB_ARRAY_ADDRESS_NV = 0x8F20,
    GL_VERTEX_ARRAY_ADDRESS_NV        = 0x8F21,
    GL_NORMAL_ARRAY_ADDRESS_NV        = 0x8F22,
    GL_COLOR_ARRAY_ADDRESS_NV         = 0x8F23,
    GL_INDEX_ARRAY_ADDRESS_NV         = 0x8F24,
    GL_TEXTURE_COORD_ARRAY_ADDRESS_NV = 0x8F25,
    GL_EDGE_FLAG_ARRAY_ADDRESS_NV     = 0x8F26,
    GL_SECONDARY_COLOR_ARRAY_ADDRESS_NV = 0x8F27,
    GL_FOG_COORD_ARRAY_ADDRESS_NV     = 0x8F28,
    GL_ELEMENT_ARRAY_ADDRESS_NV       = 0x8F29,
    GL_VERTEX_ATTRIB_ARRAY_LENGTH_NV  = 0x8F2A,
    GL_VERTEX_ARRAY_LENGTH_NV         = 0x8F2B,
    GL_NORMAL_ARRAY_LENGTH_NV         = 0x8F2C,
    GL_COLOR_ARRAY_LENGTH_NV          = 0x8F2D,
    GL_INDEX_ARRAY_LENGTH_NV          = 0x8F2E,
    GL_TEXTURE_COORD_ARRAY_LENGTH_NV  = 0x8F2F,
    GL_EDGE_FLAG_ARRAY_LENGTH_NV      = 0x8F30,
    GL_SECONDARY_COLOR_ARRAY_LENGTH_NV = 0x8F31,
    GL_FOG_COORD_ARRAY_LENGTH_NV      = 0x8F32,
    GL_ELEMENT_ARRAY_LENGTH_NV        = 0x8F33,
    GL_DRAW_INDIRECT_UNIFIED_NV       = 0x8F40,
    GL_DRAW_INDIRECT_ADDRESS_NV       = 0x8F41,
    GL_DRAW_INDIRECT_LENGTH_NV        = 0x8F42
};
typedef void (* PFNGLBUFFERADDRESSRANGENVPROC) (GLenum pname, GLuint index, GLuint64EXT address, GLsizeiptr length);
typedef void (* PFNGLVERTEXFORMATNVPROC) (GLint size, GLenum type, GLsizei stride);
typedef void (* PFNGLNORMALFORMATNVPROC) (GLenum type, GLsizei stride);
typedef void (* PFNGLCOLORFORMATNVPROC) (GLint size, GLenum type, GLsizei stride);
typedef void (* PFNGLINDEXFORMATNVPROC) (GLenum type, GLsizei stride);
typedef void (* PFNGLTEXCOORDFORMATNVPROC) (GLint size, GLenum type, GLsizei stride);
typedef void (* PFNGLEDGEFLAGFORMATNVPROC) (GLsizei stride);
typedef void (* PFNGLSECONDARYCOLORFORMATNVPROC) (GLint size, GLenum type, GLsizei stride);
typedef void (* PFNGLFOGCOORDFORMATNVPROC) (GLenum type, GLsizei stride);
typedef void (* PFNGLVERTEXATTRIBFORMATNVPROC) (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride);
typedef void (* PFNGLVERTEXATTRIBIFORMATNVPROC) (GLuint index, GLint size, GLenum type, GLsizei stride);
typedef void (* PFNGLGETINTEGERUI64I_VNVPROC) (GLenum value, GLuint index, GLuint64EXT *result);

void glBufferAddressRangeNV (GLenum pname, GLuint index, GLuint64EXT address, GLsizeiptr length);
void glVertexFormatNV (GLint size, GLenum type, GLsizei stride);
void glNormalFormatNV (GLenum type, GLsizei stride);
void glColorFormatNV (GLint size, GLenum type, GLsizei stride);
void glIndexFormatNV (GLenum type, GLsizei stride);
void glTexCoordFormatNV (GLint size, GLenum type, GLsizei stride);
void glEdgeFlagFormatNV (GLsizei stride);
void glSecondaryColorFormatNV (GLint size, GLenum type, GLsizei stride);
void glFogCoordFormatNV (GLenum type, GLsizei stride);
void glVertexAttribFormatNV (GLuint index, GLint size, GLenum type, GLboolean normalized, GLsizei stride);
void glVertexAttribIFormatNV (GLuint index, GLint size, GLenum type, GLsizei stride);
void glGetIntegerui64i_vNV (GLenum value, GLuint index, GLuint64EXT *result);

enum { GL_NV_viewport_array2 = 1 };
enum {
    GL_NV_viewport_swizzle            = 1,
    GL_VIEWPORT_SWIZZLE_POSITIVE_X_NV = 0x9350,
    GL_VIEWPORT_SWIZZLE_NEGATIVE_X_NV = 0x9351,
    GL_VIEWPORT_SWIZZLE_POSITIVE_Y_NV = 0x9352,
    GL_VIEWPORT_SWIZZLE_NEGATIVE_Y_NV = 0x9353,
    GL_VIEWPORT_SWIZZLE_POSITIVE_Z_NV = 0x9354,
    GL_VIEWPORT_SWIZZLE_NEGATIVE_Z_NV = 0x9355,
    GL_VIEWPORT_SWIZZLE_POSITIVE_W_NV = 0x9356,
    GL_VIEWPORT_SWIZZLE_NEGATIVE_W_NV = 0x9357,
    GL_VIEWPORT_SWIZZLE_X_NV          = 0x9358,
    GL_VIEWPORT_SWIZZLE_Y_NV          = 0x9359,
    GL_VIEWPORT_SWIZZLE_Z_NV          = 0x935A,
    GL_VIEWPORT_SWIZZLE_W_NV          = 0x935B
};
typedef void (* PFNGLVIEWPORTSWIZZLENVPROC) (GLuint index, GLenum swizzlex, GLenum swizzley, GLenum swizzlez, GLenum swizzlew);
void glViewportSwizzleNV (GLuint index, GLenum swizzlex, GLenum swizzley, GLenum swizzlez, GLenum swizzlew);

enum {
    GL_OVR_multiview = 1,
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_NUM_VIEWS_OVR = 0x9630,
    GL_FRAMEBUFFER_ATTACHMENT_TEXTURE_BASE_VIEW_INDEX_OVR = 0x9632,
    GL_MAX_VIEWS_OVR                  = 0x9631,
    GL_FRAMEBUFFER_INCOMPLETE_VIEW_TARGETS_OVR = 0x9633
};
typedef void (* PFNGLFRAMEBUFFERTEXTUREMULTIVIEWOVRPROC) (GLenum target, GLenum attachment, GLuint texture, GLint level, GLint baseViewIndex, GLsizei numViews);
void glFramebufferTextureMultiviewOVR (GLenum target, GLenum attachment, GLuint texture, GLint level, GLint baseViewIndex, GLsizei numViews);

enum { GL_OVR_multiview2 = 1 };

]])

return ffi.load(ffi.os == "Windows" and "opengl32" or "GL")