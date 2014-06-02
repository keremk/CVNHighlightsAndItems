//
//  CVNHighlightsAndItemsViewController.m
//  Pods
//
//  Created by Kerem Karatal on 5/18/14.
//
//

#import "CVNPaperViewController.h"
#import "CVNHighlightsViewController.h"
#import "CVNItemsViewController.h"
#import "CVNHighlightsCell.h"

@interface CVNPaperViewController ()
@property(nonatomic, strong) CVNHighlightsViewController *highlightsVC;
@property(nonatomic, strong) CVNItemsViewController *itemsVC;
@property(nonatomic, assign) CGFloat highlightsViewHeight;
@end

static const CGFloat kdefaultHightlightsViewHeightRatio = 1.61803398875; // Golden Ratio

@implementation CVNPaperViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
  }
  return self;
}

- (void) awakeFromNib {
  [super awakeFromNib];
}

- (void) commonInit {
  CGFloat screenHeight = self.view.bounds.size.height;
  self.highlightsViewHeight = screenHeight / kdefaultHightlightsViewHeightRatio;
  
  [self presentHighlightsViewController];
  [self presentItemsViewController];
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self commonInit];  
}

- (void) setDataSource:(id<CVNPaperViewDataSource>)dataSource {
  if (self.dataSource != dataSource) {
    _dataSource = dataSource;
    self.highlightsVC.dataSource = dataSource;
    self.itemsVC.dataSource = dataSource;
  }
}

- (void) presentHighlightsViewController {
  CGRect viewBounds = self.view.bounds;
  CGRect frame = CGRectMake(0.0, 0.0, viewBounds.size.width, self.highlightsViewHeight);

  if(self.highlightsVC){
    [self removeChildViewController:self.highlightsVC];
  }
  CVNHighlightsViewController *highlightsVC = [[CVNHighlightsViewController alloc] initWithFrame:frame];
  self.highlightsVC = highlightsVC;
  self.highlightsVC.dataSource = self.dataSource;
  self.highlightsVC.paperViewController = self;

  [self presentChildViewController:self.highlightsVC inFrame:frame];
}

- (void) presentItemsViewController {
  CGRect viewBounds = self.view.bounds;
  CGRect frame = CGRectMake(0.0, self.highlightsViewHeight, viewBounds.size.width, viewBounds.size.height - self.highlightsViewHeight);

  if(self.itemsVC) {
    [self removeChildViewController:self.itemsVC];
  }
  CVNItemsViewController *itemsVC = [[CVNItemsViewController alloc] initWithFrame:frame];
  self.itemsVC = itemsVC;
  self.itemsVC.paperViewController = self;
  self.itemsVC.dataSource = self.dataSource;
  _itemsView = itemsVC.collectionView;
  [self presentChildViewController:self.itemsVC inFrame:frame];
}


-(void) presentChildViewController:(UIViewController *)viewController inFrame:(CGRect) frame {
  [self addChildViewController:viewController];
  viewController.view.frame = frame;
  [self.view addSubview:viewController.view];
  [viewController didMoveToParentViewController:self];
}

- (void) removeChildViewController:(UIViewController *) viewController {
  [viewController willMoveToParentViewController:nil];
  [viewController.view removeFromSuperview];
  [viewController removeFromParentViewController];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void) didSelectSection:(NSUInteger)section {
  NSLog(@"Section %d selected", section);
  NSIndexPath *scrollToIndex = [NSIndexPath indexPathForRow:0 inSection:section];
  [self.itemsVC.collectionView scrollToItemAtIndexPath:scrollToIndex
                                      atScrollPosition:UICollectionViewScrollPositionLeft
                                              animated:YES];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
