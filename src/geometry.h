#define GL_MAX_GEOMETRY_OUTPUT_VERTICES 256

/*
	specify provoking mode for geometry shader inputs marked
	with flat keyword for flat interpolation
	provokeMode:
		GL_LAST_VERTEX_CONVENTION
		GL_FIRST_VERTEX_CONVENTION
*/
void glProvokingVertex(GLenum provokeMode);


/*
	Set the bounds of a specific viewport. glViewportIndexedf() sets the
	bounds of the viewport determined by index to the rectangle whose upper
	left is at (x, y) and whose width and height are w and h, respectively.
*/
void glViewportIndexedf(GLuint index, GLfloat x, GLfloat y,Lfloat w, GLfloat h);

/*
 performs the same action, but with x, y, w, and h
 taken from the first through fourth elements of the array v.
*/
void glViewportIndexedfv(GLuint index, const GLfloat * v);

/*
	 sets the depth extent of the viewport indexed by
	 index. n and f represent the near and far planes, respectively.
*/
void glDepthRangeIndexed(GLuint index, GLclampd n,GLclampd f);

void glViewportArrayv(GLuint first, GLsizei count, const GLfloat * v);
void glDepthRangeArrayv(GLuint first, GLsizei count, const GLdouble * v);