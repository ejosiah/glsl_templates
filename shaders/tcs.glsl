#version 450 core
#pragma debug(on)
#pragma optimize(off)

layout (vertices = 4) out;	// set size ouf gl_out, and how many times tcs will be executed

in int gl_PatchVerticesIn; // number of vertices in the input patch value is set by glPatchParameteri(GLenum pname, GLint value);
in int gl_InvocationID // invocation index for the output vertex of the current tcs
in int gl_PrimitiveID	// primitive index of the current input patch

out int gl_PatchVerticesOut;	// number of vertices in the output patch, value is set by layout above


in gl_PerVertex {
	vec4 gl_Position;
	float gl_PointSize;
	float gl_ClipDistance[];
	float gl_CullDistance[];
} gl_in[gl_PatchVerticesIn];

out gl_PerVertex {
	vec4 gl_Position;
	float gl_PointSize;
	float gl_ClipDistance[];
	float gl_CullDistance[];
} gl_out[gl_PatchVerticesOut];

patch out float gl_TessLevelOuter[4];
patch out float gl_TessLevelInner[2];

void main()
{
	gl_out[gl_InvocationID].gl_Position = gl_in[gl_InvocationID].gl_Position;
	
}