//
//  CVNHighlightsViewController.m
//  Pods
//
//  Created by Kerem Karatal on 5/18/14.
//
//

#import "CVNHighlightsViewController.h"
#import "CVNHighlightsCell.h"
#import <CVNKenBurnsImageView/CVNKenBurnsImageView.h>
#import "CVNPaperViewController.h"

@interface CVNHighlightsViewController ()
@property(nonatomic, strong) UIPageControl *pageControl;
@end

@implementation CVNHighlightsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
      // Custom initialization
  }
  return self;
}

- (id) initWithFrame:(CGRect)frame {
  self = [super init];
  if (self) {
    [self setupCollectionViewWithFrame:(CGRect) frame];
    self.collectionView.dataSource = self;
    [self.collectionView registerClass:[CVNHighlightsCell class] forCellWithReuseIdentifier:@"HighlightsCell"];
  }
  return self;
}

- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
  [self addPageControl];
  [self updateNumberOfPages:4];
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void) setupCollectionViewWithFrame:(CGRect) frame {
  UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
  flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
  flowLayout.itemSize = frame.size;
  flowLayout.minimumInteritemSpacing = 0.0f;
  flowLayout.minimumLineSpacing = 0.0f;
  UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame collectionViewLayout:flowLayout];
  collectionView.pagingEnabled = YES;
  collectionView.delegate = self;
  self.collectionView = collectionView;
}

- (void) addPageControl {
  if (self.pageControl == nil) {
    UIPageControl *pageControl = [[UIPageControl alloc] initWithFrame:CGRectZero];
    pageControl.tintColor = [UIColor whiteColor];
    self.pageControl = pageControl;
    [self.view insertSubview:pageControl aboveSubview:self.collectionView];
  }
}

- (void) updateNumberOfPages:(NSUInteger) pages {
  if (self.pageControl == nil) {
    [self addPageControl];
  }
  CGSize size = [self.pageControl sizeForNumberOfPages:pages];
  CGFloat centeredX = self.view.bounds.size.width - size.width / 2;
  CGFloat y = self.view.bounds.size.height - size.height - 10.0;
  CGRect frame = CGRectMake(centeredX, y, size.width, size.height);
  [self.pageControl setFrame:frame];
}

#pragma mark - UICollectionViewDataSource Methods

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
  NSInteger sectionCount = [self.dataSource numberOfSectionsInPaperViewController:self.paperViewController];
  [self updateNumberOfPages:sectionCount];
  return [self.dataSource numberOfSectionsInPaperViewController:self.paperViewController];
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return 1;
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  // Create a cell with the KenBurns view and the highlight images
  NSArray *highlightImages = [self.dataSource paperViewController:self.paperViewController
                                             highlightsForSection:indexPath.row];
  
  CVNHighlightsCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"HighlightsCell"
                                                                      forIndexPath:indexPath];
  
  cell.images = highlightImages;
  return cell;
}

#pragma mark - ScrollViewDelegate

- (void) scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
  CGFloat offset = scrollView.contentOffset.x;
  UICollectionViewFlowLayout *layout = (UICollectionViewFlowLayout *) self.collectionView.collectionViewLayout;
  CGFloat spacing = layout.itemSize.width - layout.minimumLineSpacing;
  NSUInteger selectedItemNo = ceil(offset/spacing);
  NSLog(@"Stopped at %f, Selected = %d", offset, selectedItemNo);
  [self.paperViewController didSelectSection:selectedItemNo];
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
