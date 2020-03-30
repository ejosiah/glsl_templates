#version 450 core
#pragma debug(on)
#pragma optimize(off)

// Here, the input type is triangles and the output type is
// triangle strips.
layout(points) in;
layout(lines) in;
layout(triangles) in;
layout(line_adjacency) in;
layout(triangles_adjacency) in;

layout(triangle_strip, max_vertices = 3) out;

in gl_PerVertex {
	vec4 gl_Position;
	float gl_PointSize;
	float gl_ClipDistance[];
	float gl_CullDistance[];
} gl_in[];

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