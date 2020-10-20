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

struct Foo{
    vec4 v;
    int x;
}

layout(rgba32f, binding=0) uniform image2D scene_img;
layout(binding = 1) uniform uimage1D counter;

layout(std430, binding=0) buffer Data{ // binding from 0 .. 3 i.e data[0], data[1], data[2], data[3]
    int buf[]
} data[4]; 

layout(std430, binding = 4) buffer FOO_BUFFER{
    Foo foo[];
}

layout(std430, binding = 5) buffer FOO_BUFFER{
    int storage_buffer;
}

layout(binding=0, offset=0) uniform atomic_uint atomic_counter00;
layout(binding=0, offset=4) uniform atomic_uint atomic_counter01;
layout(binding=0, offset=8) uniform atomic_uint	atomic_counter01;

layout(binding=1, offset=0) uniform atomic_uint atomic_counter10;
layout(binding=1, offset=4) uniform atomic_uint atomic_counter11;

void main(){
    ivec2 pos = ivec2(gl_GlobalInvocationID.xy);

//******************************************* Image **************************************************************************
    imageStore(scene_img, pos, vec4(1));

    vec4 val = imageLoad(scene_image, pos);
    
    int position = 0;
    uint value = 5;

    uint current_value = imageLoad(counter, position);

    uint previous_value = imageAtomicAdd(counter, position, value);

    previous_value = imageAtomicMin(counter, position, value);

    previous_value = imageAtomicMax(counter, position, value);

    // Xor|And
    previous_value = imageAtomicXor(counter, position, value);

    previous_value = imageAtomicExchange(counter, position, value);

    uint compare = 0; // store value if compare == current_value
    previous_value = imageAtomicCompSwap(counter, position, compare, value);

//*********************************************** Storage Buffer *************************************************************    

    // storage buffer atomic ops sames as image without image prefix i.e
    int value = 5;
    int index = 0;
    int previous_value = atomicAdd(storage_buffer[index], value);

//************************************************ Atomic Counters ***********************************************************
    // increment and get previous value
    uint val = atomicCounterIncrement(atomic_counter00);
    
    // decrement and get previous value
    uint val = atomicCounterDecrement(atomic_counter00);
    
    // get current value
    uint val = atomicCounter(atomic_counter00)
}