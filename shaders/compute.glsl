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
layout(rgba32f, binding=0) uniform image2D scene_img;

void main(){
    ivec2 pos = ivec2(gl_GlobalInvocationID.xy);
    imageStore(scene_img, pos, vec4(1));
}