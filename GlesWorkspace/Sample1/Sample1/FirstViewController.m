//
//  FirstViewController.m
//  Sample1
//
//  Created by  dingxiuwei on 2017/5/25.
//  Copyright © 2017年  dingxiuwei. All rights reserved.
//

#import "FirstViewController.h"

@interface FirstViewController ()
{
    GLuint name;
}
@property(nonatomic,strong)GLKBaseEffect *baseEffect;
@end

@implementation FirstViewController
//type for vertex
typedef struct
{
    GLKVector3 position;
}Vertex;
//MDLVertexAttributeData

//set data
static Vertex VertexData[3] = {
    //    {-0.5f, -0.5f, 0.0},
    //    {0.5f, -0.5f, 0.0},
    //    {-0.5f,  0.5f, 0.0},
    
    {{-0.5f, -0.5f, 0.0}}, // lower left corner
    {{ 0.5f, -0.5f, 0.0}}, // lower right corner
    {{-0.5f,  0.5f, 0.0}}  // upper left corner
};

- (void)viewDidLoad
{
    GLKView* glView = (GLKView*)self.view;
    glView.context = [[EAGLContext alloc] initWithAPI:kEAGLRenderingAPIOpenGLES2];
    [EAGLContext setCurrentContext:glView.context];
    self.baseEffect = [[GLKBaseEffect alloc] init];
    self.baseEffect.useConstantColor = GL_TRUE;
    self.baseEffect.constantColor = GLKVector4Make(
                                                   1.0f, // Red
                                                   1.0f, // Green
                                                   1.0f, // Blue
                                                   1.0f);// Alpha
    glClearColor(0.0f, 0.0f, 0.0f, 1.0f); // background color
    glGenBuffers(1, &name);
    glBindBuffer(GL_ARRAY_BUFFER, name);
    glBufferData(GL_ARRAY_BUFFER, sizeof(VertexData), VertexData, GL_STATIC_DRAW);
}

#pragma GLKViewDelegate <NSObject>
/*
 Required method for implementing GLKViewDelegate. This draw method variant should be used when not subclassing GLKView.
 This method will not be called if the GLKView object has been subclassed and implements -(void)drawRect:(CGRect)rect.
 */
- (void)glkView:(GLKView *)view drawInRect:(CGRect)rect
{
    [self.baseEffect prepareToDraw];
    glClear(GL_COLOR_BUFFER_BIT);
    glEnableVertexAttribArray(GLKVertexAttribPosition);
    glVertexAttribPointer(GLKVertexAttribPosition,3, GL_FLOAT, GL_FALSE, 3, NULL);
    //    offsetof(Vertex, position)
    glDrawArrays(GL_TRIANGLES, 0, 3);
}
@end
