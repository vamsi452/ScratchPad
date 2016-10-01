//
//  ScratchPadView.m
//  ScratchPad
//
//  Created by Vamsi Kallepalli on 9/28/16.
//  Copyright © 2016 Vamsi Kallepalli. All rights reserved.
//

#import "ScratchPadView.h"

@implementation ScratchPadView

{
    UIBezierPath *path; // (3)
    UISegmentedControl *segmentedControl;
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect { //5
    [[UIColor whiteColor] setStroke];
    [path stroke];
}

- (IBAction)clearPath:(id)sender {
    [path removeAllPoints];
    [self setNeedsDisplay];
}
- (IBAction)setStroke:(id)sender {
    switch ([sender selectedSegmentIndex])
    {
        case 0:
        {
            [path setLineWidth:1.0];
            break;
        }
        case 1:
        {
            [path setLineWidth:2.0];
            break;
        }
        case 2:
        {
            [path setLineWidth:3.0];
            break;
        }
        case 3:
        {
            [path setLineWidth:4.0];
            break;
        }
        case 4:
        {
            [path setLineWidth:5.0];
            break;
        }
        case 5:
        {
            [path setLineWidth:6.0];
            break;
        }
        case 6:
        {
            [path setLineWidth:7.0];
            break;
        }
        case 7:
        {
            [path setLineWidth:8.0];
            break;
        }
    };
    [self setNeedsDisplay];
}

- (id)initWithCoder:(NSCoder *)aDecoder // (1)
{
    if (self = [super initWithCoder:aDecoder])
    {
        [self setMultipleTouchEnabled:NO]; // (2)
        [self setBackgroundColor:[UIColor blackColor]];
        self.alpha = 0.7;
        path = [UIBezierPath bezierPath];
        [path setLineWidth:2.0];
    }
    //self.backgroundColor = [Functions getTransparentBackgroundColorForPopups];
    return self;
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path moveToPoint:p];
}
- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    UITouch *touch = [touches anyObject];
    CGPoint p = [touch locationInView:self];
    [path addLineToPoint:p]; // (4)
    [self setNeedsDisplay];
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesMoved:touches withEvent:event];
}
- (void)touchesCancelled:(NSSet *)touches withEvent:(UIEvent *)event
{
    [self touchesEnded:touches withEvent:event];
}

@end
