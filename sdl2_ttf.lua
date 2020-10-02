local ffi = require("ffi")
ffi.cdef([[
/*
  SDL_ttf:  A companion library to SDL for working with TrueType (tm) fonts
  Copyright (C) 2001-2019 Sam Lantinga <slouken@libsdl.org>

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

/* This library is a wrapper around the excellent FreeType 2.0 library,
   available at:
    http://www.freetype.org/
*/

/* Note: In many places, SDL_ttf will say "glyph" when it means "code point."
   Unicode is hard, we learn as we go, and we apologize for adding to the
   confusion. */
/* Printable format: "%d.%d.%d", MAJOR, MINOR, PATCHLEVEL
*/
enum {
    SDL_TTF_MAJOR_VERSION   = 2,
    SDL_TTF_MINOR_VERSION   = 0,
    SDL_TTF_PATCHLEVEL      = 15
};

/* This function gets the version of the dynamically linked SDL_ttf library.
   it should NOT be used to fill a version structure, instead you should
   use the SDL_TTF_VERSION() macro.
 */
const SDL_version * TTF_Linked_Version(void);

/* ZERO WIDTH NO-BREAKSPACE (Unicode byte order mark) */
enum {
    UNICODE_BOM_NATIVE  = 0xFEFF,
    UNICODE_BOM_SWAPPED = 0xFFFE
};
/* This function tells the library whether UNICODE text is generally
   byteswapped.  A UNICODE BOM character in a string will override
   this setting for the remainder of that string.
*/
void TTF_ByteSwappedUNICODE(int swapped);

/* The internal structure containing font information */
typedef struct _TTF_Font TTF_Font;

/* Initialize the TTF engine - returns 0 if successful, -1 on error */
int TTF_Init(void);

/* Open a font file and create a font of the specified point size.
 * Some .fon fonts will have several sizes embedded in the file, so the
 * point size becomes the index of choosing which size.  If the value
 * is too high, the last indexed size will be the default. */
TTF_Font * TTF_OpenFont(const char *file, int ptsize);
TTF_Font * TTF_OpenFontIndex(const char *file, int ptsize, long index);
TTF_Font * TTF_OpenFontRW(SDL_RWops *src, int freesrc, int ptsize);
TTF_Font * TTF_OpenFontIndexRW(SDL_RWops *src, int freesrc, int ptsize, long index);

/* Set and retrieve the font style */
enum {
    TTF_STYLE_NORMAL        = 0x00,
    TTF_STYLE_BOLD          = 0x01,
    TTF_STYLE_ITALIC        = 0x02,
    TTF_STYLE_UNDERLINE     = 0x04,
    TTF_STYLE_STRIKETHROUGH = 0x08
};
int TTF_GetFontStyle(const TTF_Font *font);
void TTF_SetFontStyle(TTF_Font *font, int style);
int TTF_GetFontOutline(const TTF_Font *font);
void TTF_SetFontOutline(TTF_Font *font, int outline);

/* Set and retrieve FreeType hinter settings */
enum {
    TTF_HINTING_NORMAL    = 0,
    TTF_HINTING_LIGHT     = 1,
    TTF_HINTING_MONO      = 2,
    TTF_HINTING_NONE      = 3
};
int TTF_GetFontHinting(const TTF_Font *font);
void TTF_SetFontHinting(TTF_Font *font, int hinting);

/* Get the total height of the font - usually equal to point size */
int TTF_FontHeight(const TTF_Font *font);

/* Get the offset from the baseline to the top of the font
   This is a positive value, relative to the baseline.
 */
int TTF_FontAscent(const TTF_Font *font);

/* Get the offset from the baseline to the bottom of the font
   This is a negative value, relative to the baseline.
 */
int TTF_FontDescent(const TTF_Font *font);

/* Get the recommended spacing between lines of text for this font */
int TTF_FontLineSkip(const TTF_Font *font);

/* Get/Set whether or not kerning is allowed for this font */
int TTF_GetFontKerning(const TTF_Font *font);
void TTF_SetFontKerning(TTF_Font *font, int allowed);

/* Get the number of faces of the font */
long TTF_FontFaces(const TTF_Font *font);

/* Get the font face attributes, if any */
int TTF_FontFaceIsFixedWidth(const TTF_Font *font);
char * TTF_FontFaceFamilyName(const TTF_Font *font);
char * TTF_FontFaceStyleName(const TTF_Font *font);

/* Check wether a glyph is provided by the font or not */
int TTF_GlyphIsProvided(const TTF_Font *font, Uint16 ch);

/* Get the metrics (dimensions) of a glyph
   To understand what these metrics mean, here is a useful link:
    http://freetype.sourceforge.net/freetype2/docs/tutorial/step2.html
 */
int TTF_GlyphMetrics(TTF_Font *font, Uint16 ch,
                     int *minx, int *maxx,
                                     int *miny, int *maxy, int *advance);

/* Get the dimensions of a rendered string of text */
int TTF_SizeText(TTF_Font *font, const char *text, int *w, int *h);
int TTF_SizeUTF8(TTF_Font *font, const char *text, int *w, int *h);
int TTF_SizeUNICODE(TTF_Font *font, const Uint16 *text, int *w, int *h);

/* Create an 8-bit palettized surface and render the given text at
   fast quality with the given font and color.  The 0 pixel is the
   colorkey, giving a transparent background, and the 1 pixel is set
   to the text color.
   This function returns the new surface, or NULL if there was an error.
*/
SDL_Surface * TTF_RenderText_Solid(TTF_Font *font,
                const char *text, SDL_Color fg);
SDL_Surface * TTF_RenderUTF8_Solid(TTF_Font *font,
                const char *text, SDL_Color fg);
SDL_Surface * TTF_RenderUNICODE_Solid(TTF_Font *font,
                const Uint16 *text, SDL_Color fg);

/* Create an 8-bit palettized surface and render the given glyph at
   fast quality with the given font and color.  The 0 pixel is the
   colorkey, giving a transparent background, and the 1 pixel is set
   to the text color.  The glyph is rendered without any padding or
   centering in the X direction, and aligned normally in the Y direction.
   This function returns the new surface, or NULL if there was an error.
*/
SDL_Surface * TTF_RenderGlyph_Solid(TTF_Font *font,
                    Uint16 ch, SDL_Color fg);

/* Create an 8-bit palettized surface and render the given text at
   high quality with the given font and colors.  The 0 pixel is background,
   while other pixels have varying degrees of the foreground color.
   This function returns the new surface, or NULL if there was an error.
*/
SDL_Surface * TTF_RenderText_Shaded(TTF_Font *font,
                const char *text, SDL_Color fg, SDL_Color bg);
SDL_Surface * TTF_RenderUTF8_Shaded(TTF_Font *font,
                const char *text, SDL_Color fg, SDL_Color bg);
SDL_Surface * TTF_RenderUNICODE_Shaded(TTF_Font *font,
                const Uint16 *text, SDL_Color fg, SDL_Color bg);

/* Create an 8-bit palettized surface and render the given glyph at
   high quality with the given font and colors.  The 0 pixel is background,
   while other pixels have varying degrees of the foreground color.
   The glyph is rendered without any padding or centering in the X
   direction, and aligned normally in the Y direction.
   This function returns the new surface, or NULL if there was an error.
*/
SDL_Surface * TTF_RenderGlyph_Shaded(TTF_Font *font,
                Uint16 ch, SDL_Color fg, SDL_Color bg);

/* Create a 32-bit ARGB surface and render the given text at high quality,
   using alpha blending to dither the font with the given color.
   This function returns the new surface, or NULL if there was an error.
*/
SDL_Surface * TTF_RenderText_Blended(TTF_Font *font,
                const char *text, SDL_Color fg);
SDL_Surface * TTF_RenderUTF8_Blended(TTF_Font *font,
                const char *text, SDL_Color fg);
SDL_Surface * TTF_RenderUNICODE_Blended(TTF_Font *font,
                const Uint16 *text, SDL_Color fg);


/* Create a 32-bit ARGB surface and render the given text at high quality,
   using alpha blending to dither the font with the given color.
   Text is wrapped to multiple lines on line endings and on word boundaries
   if it extends beyond wrapLength in pixels.
   This function returns the new surface, or NULL if there was an error.
*/
SDL_Surface * TTF_RenderText_Blended_Wrapped(TTF_Font *font,
                const char *text, SDL_Color fg, Uint32 wrapLength);
SDL_Surface * TTF_RenderUTF8_Blended_Wrapped(TTF_Font *font,
                const char *text, SDL_Color fg, Uint32 wrapLength);
SDL_Surface * TTF_RenderUNICODE_Blended_Wrapped(TTF_Font *font,
                const Uint16 *text, SDL_Color fg, Uint32 wrapLength);

/* Create a 32-bit ARGB surface and render the given glyph at high quality,
   using alpha blending to dither the font with the given color.
   The glyph is rendered without any padding or centering in the X
   direction, and aligned normally in the Y direction.
   This function returns the new surface, or NULL if there was an error.
*/
SDL_Surface * TTF_RenderGlyph_Blended(TTF_Font *font,
                        Uint16 ch, SDL_Color fg);

/* Close an opened font file */
void TTF_CloseFont(TTF_Font *font);

/* De-initialize the TTF engine */
void TTF_Quit(void);

/* Check if the TTF engine is initialized */
int TTF_WasInit(void);

/* Get the kerning size of two glyphs indices */
/* DEPRECATED: this function requires FreeType font indexes, not glyphs,
   by accident, which we don't expose through this API, so it could give
   wildly incorrect results, especially with non-ASCII values.
   Going forward, please use TTF_GetFontKerningSizeGlyphs() instead, which
   does what you probably expected this function to do. */
int TTF_GetFontKerningSize(TTF_Font *font, int prev_index, int index);

/* Get the kerning size of two glyphs */
int TTF_GetFontKerningSizeGlyphs(TTF_Font *font, Uint16 previous_ch, Uint16 ch);
]])
return ffi.load("SDL2_ttf")