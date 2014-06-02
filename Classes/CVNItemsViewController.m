//
//  CVNItemsViewController.m
//  Pods
//
//  Created by Kerem Karatal on 5/18/14.
//
//

#import "CVNItemsViewController.h"
#import "CVNPaperViewUtils.h"

@interface CVNItemsViewController ()

@end

static const CGFloat kdefaultItemsWidth = 150.0f;

@implementation CVNItemsViewController

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
  }
  return self;
}


- (void)viewDidLoad {
  [super viewDidLoad];
  // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
}

- (void) setupCollectionViewWithFrame:(CGRect) frame{
  UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
  flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
  flowLayout.itemSize = CGSizeMake(kdefaultItemsWidth, frame.size.height);
  UIEdgeInsets edgeInsets = UIEdgeInsetsMake(10.0f, 5.0f, 0.0f, 5.0f);
  flowLayout.sectionInset = edgeInsets;
  flowLayout.minimumInteritemSpacing = 5.0f;
  flowLayout.minimumLineSpacing = 5.0f;
  
  UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:frame
                                                        collectionViewLayout:flowLayout];
  self.collectionView = collectionView;
  self.collectionView.backgroundColor = UIColorFromRGB(0x5A6378);
}

#pragma mark - UICollectionViewDataSource Methods

- (NSInteger) collectionView:(UICollectionView *)collectionView
      numberOfItemsInSection:(NSInteger)section {
  return [self.dataSource paperViewController:self.paperViewController numberOfItemsInSection:section];
}

- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
  return [self.dataSource numberOfSectionsInPaperViewController:self.paperViewController];
}

- (UICollectionViewCell *) collectionView:(UICollectionView *)collectionView
                   cellForItemAtIndexPath:(NSIndexPath *)indexPath {
  return (UICollectionViewCell *)[self.dataSource paperViewController:self.paperViewController
                                          itemsCellForItemAtIndexPath: indexPath];
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
