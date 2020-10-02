local ffi = require("ffi")
ffi.cdef([[
/*
  SDL_rtf:  A companion library to SDL for displaying RTF format text
  Copyright (C) 2003-2020 Sam Lantinga <slouken@libsdl.org>

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
enum {
    SDL_RTF_MAJOR_VERSION   = 2,
    SDL_RTF_MINOR_VERSION   = 0,
    SDL_RTF_PATCHLEVEL      = 0,
};
typedef struct _RTF_Context RTF_Context;
typedef enum
{
    RTF_FontDefault,    /* Unknown or default font */
    RTF_FontRoman,      /* Proportionally spaced serif fonts,
                           e.g. Times New Roman, Palatino */
    RTF_FontSwiss,      /* Proportionally spaced sans serif fonts,
                           e.g. Arial */
    RTF_FontModern,     /* Fixed pitch serif and sans serif fonts,
                           e.g. Courier New, Pica */
    RTF_FontScript,     /* Script fonts, e.g. Cursive */
    RTF_FontDecor,      /* Decorative fonts, e.g. Zapf Chancery */
    RTF_FontTech,       /* Technical, symbol, and math fonts,
                           e.g. Symbol */
    RTF_FontBidi        /* Bidirectional fonts, like Arabic or Hebrew */
}
RTF_FontFamily;

typedef enum
{
    RTF_FontNormal    = 0x00,
    RTF_FontBold      = 0x01,
    RTF_FontItalic    = 0x02,
    RTF_FontUnderline = 0x04
}
RTF_FontStyle;

/* Various functions that need to be provided to give SDL_rtf font support */

enum { RTF_FONT_ENGINE_VERSION = 1 };

typedef struct _RTF_FontEngine
{
    int version;
    void *(*CreateFont)(const char *name, RTF_FontFamily family, int charset, int size, int style);
    int (*GetLineSpacing)(void *font);
    int (*GetCharacterOffsets)(void *font, const char *text, int *byteOffsets, int *pixelOffsets, int maxOffsets);
    SDL_Texture *(*RenderText)(void *font, SDL_Renderer *renderer, const char *text, SDL_Color fg);
    void (*FreeFont)(void *font);
} RTF_FontEngine;
RTF_Context * RTF_CreateContext(SDL_Renderer *renderer, RTF_FontEngine *fontEngine);

int RTF_Load(RTF_Context *ctx, const char *file);
int RTF_Load_RW(RTF_Context *ctx, SDL_RWops *src, int freesrc);
const char * RTF_GetTitle(RTF_Context *ctx);
const char * RTF_GetSubject(RTF_Context *ctx);
const char * RTF_GetAuthor(RTF_Context *ctx);
int RTF_GetHeight(RTF_Context *ctx, int width);
void RTF_Render(RTF_Context *ctx, SDL_Rect *rect, int yOffset);

/* Free an RTF display context */
void RTF_FreeContext(RTF_Context *ctx);
]])

return ffi.load("SDL_rtf")