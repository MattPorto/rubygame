/*
 * Rubygame -- Ruby code and bindings to SDL to facilitate game creation
 * Copyright (C) 2004-2006  John 'jacius' Croisant
 *
 * This library is free software; you can redistribute it and/or
 * modify it under the terms of the GNU Lesser General Public
 * License as published by the Free Software Foundation; either
 * version 2.1 of the License, or (at your option) any later version.
 * 
 * This library is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
 * Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public
 * License along with this library; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA  02111-1307  USA
 *
 */

#ifndef _RUBYGAME_SCREEN_H
#define _RUBYGAME_SCREEN_H

extern void Rubygame_Init_Screen();

extern VALUE cScreen;

extern VALUE rbgm_screen_setmode(int, VALUE*, VALUE);
extern VALUE rbgm_screen_getsurface(VALUE);
extern VALUE rbgm_screen_new(VALUE);

extern VALUE rbgm_screen_getcaption(VALUE);
extern VALUE rbgm_screen_setcaption(int, VALUE*, VALUE);

extern VALUE rbgm_screen_update(int, VALUE*, VALUE);
extern VALUE rbgm_screen_updaterects(VALUE, VALUE);
extern VALUE rbgm_screen_flip(VALUE);

extern VALUE rbgm_screen_getshowcursor(VALUE);
extern VALUE rbgm_screen_setshowcursor(VALUE, VALUE);

#endif
