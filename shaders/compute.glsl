#version 450 core
#pragma debug(on)
#pragma optimize(off)

// workgroup dimensions
in uvec3 gl_NumWorkGroups;
const uvec3 gl_WorkGroupSize;
// workgroup and invocation IDs
in uvec3 gl_WorkGroupID;
in uvec3 gl_LocalInvocationID;
// derived variables
in uvec3 gl_GlobalInvocationID;
in uint gl_LocalInvocationIndex;

layout(local_size_x = 32, local_size_y = 32, local_size_z = 1) in;

/*
        glGenTextures(1, &scene_img);
		glBindTexture(GL_TEXTURE_2D, scene_img);
		glTexStorage2D(GL_TEXTURE_2D, 1, GL_RGBA32F, _width, _height);

        glActiveTexture(GL_TEXTURE0);
        glBindTexture(GL_TEXTURE_2D, scene_img);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_S, GL_CLAMP_TO_EDGE);
        glTexParameteri(GL_TEXTURE_2D, GL_TEXTURE_WRAP_T, GL_CLAMP_TO_EDGE);
        s.sendUniform1ui("scene_img", scene_img);

*/
layout(rgba32f, binding=0) uniform image2D scene_img;

void main(){
    ivec2 pos = ivec2(gl_GlobalInvocationID.xy);
    imageStore(scene_img, pos, vec4(1));
}