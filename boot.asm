format pe dll efi
entry main
section '.text' code executable readable
include 'EFI.INC'
main:
include 'WIN32AXP.INC'
xor    ax,ax
mov    ss,ax
mov    sp,0x7c00
sti    
push   ax
pop    es
push   ax
pop    ds
cld    
mov    si,0x7c1b
mov    di,0x61b
push   ax
push   di
mov    cx,0x1e5
rep 
movsb
retf   
mov    bp,0x7be
mov    cl,0x4
cmp    [BP+00],ch
jl     0x0000002e
jne    0x0000003a
add    bp,0x10
;loop   0620
int    0x18
mov    si,bp
add    si,0x10
dec    cx
je     0x0000004f
cmp    [SI],ch
je     0x00000030
;mov    al,[07B5]
mov    ah,0x7
mov    si,ax
lodsb
cmp    al,0x0
je     0x00000042
mov    bx,0x7
mov    ah,0xe
int    0x10
jmp    0x00000041
mov    [BP+10],CL
call   0x0000009b
jae    0x00000081
inc    BYTE [bp+0x10]
cmp    BYTE [bp+0x4],0xb
je     0x0000006b
cmp    [bp+0x4],0xc
je     0x0000006b
mov    al,0x7b6
jne    0x0000003d
add    [bp+0x2],0x6
add    [bp+0x8],0x6
adc    [bp+0xa],0x0
call   0x0000009b
jae    0x00000081
mov    al,[0x7b6]
jmp    0x0000003d
cmp    [0x7dfe],0xaa55
je     0x00000094
cmp    [bp+0x10],0x0
je     0x00000057
mov    al,[0x7b7]
jmp    0x0000003d
mov    di,sp
push   ds
push   di
mov    si,bp
retf   
mov    di,0x5
mov    dl,[bp+0x0]
mov    ah,0x8
int    0x13
jb     0x000000ca
mov    al,cl
and    al,0x3f
cbw    
mov    bl,dh
mov    bh,ah
inc    bx
mul    bx
mov    dx,cx
xchg   dh,dl
mov    cl,0x6
shr    dh,cl
inc    dx
mul    dx
cmp    [bp+0xa],dx
ja     0x000000e6
jb     0x000000ca
cmp    [bp+0x8],ax
jae    0x000000e6
mov    ax,0x201
mov    bx,0x7c00
mov    cx,[bp+0x2]
mov    dx,[bp+0x0]
int    0x13
jae    0x0000012b
dec    di
je     0x0000012b
xor    ah,ah
mov    dl,[bp+0x0]
int    0x13
jmp    0x000000ca
mov    dl,[bp+0x0]
pusha  
mov    bx,0x55aa
mov    ah,0x41
int    0x13
jb     0x00000129
cmp    bx,0xaa55
jne    0x00000129
test   cl,0x1
je     0x00000129
popa   
pusha  
push   0x0
push   0x0
push   [bp+0xa]
push   [bp+0x8]
push   0x0
push   0x7c00
push   0x1
push   0x10
mov    ah,0x42
mov    si,sp
int    0x13
popa   
popa   
jae    0x0000012b
dec    di
je     0x0000012b
xor    ah,ah
mov    dl,[bp+0x0]
int    0x13
jmp    0x000000ff
popa   
stc    
ret    
section '.data' data readable writeable
