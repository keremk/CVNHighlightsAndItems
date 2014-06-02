//
//  CVNSampleItemViewCell.h
//  CVNHighlightsAndItemsDemo
//
//  Created by Kerem Karatal on 5/31/14.
//  Copyright (c) 2014 CodingVentures. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CVNPaperView/CVNPaperViewCell.h>

@interface CVNSampleItemViewCell : CVNPaperViewCell
@property (weak, nonatomic) IBOutlet UIImageView *itemImage;
@property (weak, nonatomic) IBOutlet UILabel *itemTitle;

@end
