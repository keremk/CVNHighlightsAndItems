//
//  CVNItemsViewController.h
//  Pods
//
//  Created by Kerem Karatal on 5/18/14.
//
//

#import <UIKit/UIKit.h>
#import "CVNCommon.h"

@class CVNPaperViewController;
@interface CVNItemsViewController :  UICollectionViewController
@property(nonatomic, assign) id<CVNPaperViewDataSource> dataSource;
@property(nonatomic, weak) CVNPaperViewController *paperViewController;

- (id) initWithFrame:(CGRect)frame;
@end
