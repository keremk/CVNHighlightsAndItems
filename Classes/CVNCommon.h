//
//  CVNCommon.h
//  Pods
//
//  Created by Kerem Karatal on 6/1/14.
//
//

#ifndef Pods_CVNCommon_h
#define Pods_CVNCommon_h

@class CVNPaperViewController;
@class CVNPaperViewCell;
@protocol CVNPaperViewDataSource <NSObject>
- (NSInteger) numberOfSectionsInPaperViewController:(CVNPaperViewController *) paperViewController;
- (NSInteger) paperViewController:(CVNPaperViewController *) paperViewController
           numberOfItemsInSection:(NSInteger) section;
- (CVNPaperViewCell *) paperViewController:(CVNPaperViewController *) paperViewController
               itemsCellForItemAtIndexPath:(NSIndexPath *)indexPath;
- (NSArray *) paperViewController:(CVNPaperViewController *) paperViewController
             highlightsForSection:(NSInteger) section;
@end
#endif
