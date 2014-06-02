//
//  CVNHighlightsAndItemsViewController.h
//  Pods
//
//  Created by Kerem Karatal on 5/18/14.
//
//

#import <UIKit/UIKit.h>
#import "CVNPaperViewCell.h"
#import "CVNCommon.h"

@interface CVNPaperViewController : UIViewController 
@property(nonatomic, assign) id<CVNPaperViewDataSource> dataSource;
@property(nonatomic, readonly) UICollectionView *itemsView;

- (void) didSelectSection:(NSUInteger) section;
@end
