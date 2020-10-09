local ffi = require("ffi")
ffi.cdef([[
/*
** Copyright (c) 2008-2018 The Khronos Group Inc.
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
typedef int32_t                 khronos_int32_t;
typedef uint32_t                khronos_uint32_t;
typedef int64_t                 khronos_int64_t;
typedef uint64_t                khronos_uint64_t;
enum {
    KHRONOS_SUPPORT_INT64   = 1,
    KHRONOS_SUPPORT_FLOAT   = 1
};

typedef signed   char          khronos_int8_t;
typedef unsigned char          khronos_uint8_t;
typedef signed   short int     khronos_int16_t;
typedef unsigned short int     khronos_uint16_t;
]])

if ffi.os == "Windows" and ffi.arch == "x64" then
  ffi.cdef([[
    typedef signed   long long int khronos_intptr_t;
    typedef unsigned long long int khronos_uintptr_t;
    typedef signed   long long int khronos_ssize_t;
    typedef unsigned long long int khronos_usize_t;
  ]])
else
  ffi.cdef([[
    typedef signed   long  int     khronos_intptr_t;
    typedef unsigned long  int     khronos_uintptr_t;
    typedef signed   long  int     khronos_ssize_t;
    typedef unsigned long  int     khronos_usize_t;
  ]])
end

ffi.cdef([[
typedef float khronos_float_t;

typedef khronos_uint64_t       khronos_utime_nanoseconds_t;
typedef khronos_int64_t        khronos_stime_nanoseconds_t;

enum { KHRONOS_MAX_ENUM = 0x7FFFFFFF };

typedef enum {
    KHRONOS_FALSE = 0,
    KHRONOS_TRUE  = 1,
    KHRONOS_BOOLEAN_ENUM_FORCE_SIZE = KHRONOS_MAX_ENUM
} khronos_boolean_enum_t;
]])