#version 450 core
#pragma debug(on)
#pragma optimize(off)

layout(quads, equal_spacing, cw) in;		// (u, v) in range [0, 1]
layout(triangles, fractional_even_spacing, ccw) in;	// (a, b, c) in range [0, 1] & a + b + c = 1
layout(isolines, fractional_odd_spacing, cw) in;	// (u, v) in range [0, 1)

in gl_PerVertex {
	vec4 gl_Position;	// patch vertex
	float gl_PointSize;
	float gl_ClipDistance[];
	float gl_CullDistance[];
} gl_in[gl_MaxPatchVertices];

in int gl_PatchVerticesIn;
in int gl_PrimitiveID;
in vec3 gl_TessCoord;		// TPG (u,v) coordinate

patch in float gl_TessLevelOuter[4];
patch in float gl_TessLevelInner[2];

out gl_PerVertex {
	vec4 gl_Position;
	float gl_PointSize;
	float gl_ClipDistance[];
	float gl_CullDistance[];
};

void main(){
	
}