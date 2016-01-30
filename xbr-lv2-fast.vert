#version 330 core

/*
   Hyllian's xBR-lv1-noblend Shader

   Copyright (C) 2011-2014 Hyllian - sergiogdb@gmail.com

   Permission is hereby granted, free of charge, to any person obtaining a copy
   of this software and associated documentation files (the "Software"), to deal
   in the Software without restriction, including without limitation the rights
   to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
   copies of the Software, and to permit persons to whom the Software is
   furnished to do so, subject to the following conditions:

   The above copyright notice and this permission notice shall be included in
   all copies or substantial portions of the Software.

   THE SOFTWARE IS PROVIDED "AS IS", WITHVAR WARRANTY OF ANY KIND, EXPRESS OR
   IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
   FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
   AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
   LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
   OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
   THE SOFTWARE.

*/

layout(location = 0) in vec4 position;
layout(location = 1) in vec2 texCoord;

layout (std140) uniform program
{
	vec2 video_size;
	vec2 texture_size;
	vec2 output_size;
} IN;


out vertex
{
	vec4 color;
	vec4 t1;
	vec4 t2;
	vec4 t3;

} VAR;



void main()
{
	gl_Position = position;

	vec2 ps = vec2(1.0 / IN.texture_size.x, 1.0 / IN.texture_size.y);
	float dx = ps.x;
	float dy = ps.y;

	//		A1	B1	C1
	// A0	A	B	C	C4
	// D0	D	E	F	F4
	// G0	G	H	I	I4
	//		G5	H5	I5

	VAR.texCoord = texCoord;
	VAR.t1 = texCoord.xxxy + vec4(-dx, 0, dx, -dy);	//	A	B	C
	VAR.t2 = texCoord.xxxy + vec4(-dx, 0, dx, 0);	//	D	E	F
	VAR.t3 = texCoord.xxxy + vec4(-dx, 0, dx, dy);	//	G	H	I
}