//
//  CVNHighlightsCell.m
//  Pods
//
//  Created by Kerem Karatal on 5/26/14.
//
//

#import "CVNHighlightsCell.h"
#import <CVNKenBurnsImageView/CVNKenBurnsImageView.h>

@interface CVNHighlightsCell()
@property(nonatomic, strong) CVNKenBurnsImageView *imageView;
@end

@implementation CVNHighlightsCell

- (id)initWithFrame:(CGRect)frame {
  self = [super initWithFrame:frame];
  if (self) {
    // Initialization code
//    NSLog(@"Highlights Frame: %f, %f", frame.origin.x, frame.origin.y);
    CGRect imageFrame = CGRectMake(0.0, 0.0, frame.size.width, frame.size.height);
    CVNKenBurnsImageView *imageView = [[CVNKenBurnsImageView alloc] initWithFrame:imageFrame];
    self.imageView = imageView;
    [self addSubview:imageView];
  }
  return self;
}

- (void) setImages:(NSArray *)images {
  if (self.images != images) {
    _images = images;
    self.imageView.animationImages = images;
    [self.imageView startAnimating];
  }
}

@end
