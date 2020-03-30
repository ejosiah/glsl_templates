glGenTextures(1, &scene_img);
glBindTexture(GL_TEXTURE_2D, scene_img);
glTexStorage2D(GL_TEXTURE_2D, 1, GL_RGBA32F, _width, _height);

glActiveTexture(GL_TEXTURE0);
glBindTexture(GL_TEXTURE_2D, scene_img);
glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
s.sendUniform1ui("scene_img", scene_img);
// layout(rgba32f, binding=0) uniform image2D scene_img;