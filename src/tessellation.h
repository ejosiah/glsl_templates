/*
	Specifies the number of vertices in a patch using value. pname must be set to GL_PATCH_VERTICES
	A GL_INVALID_ENUM error is generated if value is less than zero or greater than GL_MAX_PATCH_VERTICES.
	The default number of vertices for a patch is three. If the number of vertices for a patch is less that value, 
	the patch is ignored, and no geometry will be generated.
*/
void glPatchParameteri(GLenum pname, GLint value);


/*
	Sets outter and innter tessellation levels when no tcs is defined
	pname takes any one of:
		GL_PATCH_DEFAULT_OUTER_LEVEL
		GL_PATCH-DEFAULT_INNER_LEVEL

	When pname is GL_PATCH_DEFAULT_OUTER_LEVEL, values must be an array of 
	four floating-point values that specify the four outer tessellation levels.
	Similarly, when pname is GL_PATCH_DEFAULT_INNER_LEVEL, values must be an 
	array of two floating-point values that specify the two inner tessellation levels.
*/
void glPatchParameterfv(GLenum pname, const GLfloat *values);




void speficyTesellationPatches(){
	GLfloat vertices [][2] = {
		{-0.75, -0.25}, {-0.25, -0.25}, {-0.25, 0.25}, {-0.75, 0.25},
		{ 0.25, -0.25}, { 0.75, -0.25}, { 0.75, 0.25}, { 0.25, 0.25}
	};
	glBindVertexArray(VAO);
	glBindBuffer(GL_ARRAY_BUFFER, VBO);
	glBufferData(GL_ARRAY_BUFFER, sizeof(vertices), vertices,
	GL_STATIC_DRAW);
	glVertexAttribPointer(vPos, 2, GL_FLOAT, GL_FALSE, 0, BUFFER_OFFSET(0));

	// number of elements in gl_in same as defined below
	glPatchParameteri(GL_PATCH_VERTICES, 4);
	
	glDrawArrays(GL_PATCHES, 0, 8);
}