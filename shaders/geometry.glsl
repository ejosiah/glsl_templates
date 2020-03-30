#version 450 core
#pragma debug(on)
#pragma optimize(off)

// Here, the input type is triangles and the output type is
// triangle strips.
layout(points) in;					// size 1
layout(lines) in;					// size 2
layout(triangles) in;					// size 3
layout(line_adjacency) in;				// size 4
layout(triangles_adjacency) in;				// size 6

layout(triangle_strip, max_vertices = 3) out;

const int gl_MaxGeometryOutputVertices;

in int gl_PrimitiveIDIn;
in int gl_InvocationID;	// used for instancing

out int gl_PrimitiveID;
out int gl_Layer;			// used for layered rendering
out int gl_ViewportIndex;		// viewport array index;

in gl_PerVertex {
	vec4 gl_Position;
	float gl_PointSize;
	float gl_ClipDistance[];
	float gl_CullDistance[];
} gl_in[];

out gl_PerVertex
{
	vec4 gl_Position;
	float gl_PointSize;
	float gl_ClipDistance[];
	float gl_CullDistance[];
};

in vec4 position[];			// out vec4 position from previous state
in vec3 normal[];			// out vec4 normal from previous state
in vec4 color[];			// out vec4 color from previous state
in vec2 tex_coord[];			// out vec2 tex_coord from previous state

/*
interface block output from previous stage
out VS_GS_INTERFACE
{
	out vec4 position;
	out vec3 normal;
	out vec4 color;
	out vec2 tex_coord[4];
} vs_out;
*/

in VS_GS_INTERFACE
{
	out vec4 position;
	out vec3 normal;
	out vec4 color;
	out vec2 tex_coord[4];
} gs_in[];

void main(void)
{
	int n;
	// Loop over the input vertices
	for (n = 0; n < gl_in.length(); n++){
		// Copy the input position to the output
		gl_Position = gl_in[0].gl_Position;
		// Emit the vertex
		EmitVertex();
	}
	// End the primitive. This is not strictly necessary and is
	// only here for illustrative purposes.
	EndPrimitive();
}
