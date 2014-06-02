//
//  CVNViewController.m
//  CVNHighlightsAndItemsDemo
//
//  Created by Kerem Karatal on 5/17/14.
//  Copyright (c) 2014 CodingVentures. All rights reserved.
//

#import "CVNViewController.h"
#import "CVNSampleItemViewCell.h"
#import <AFNetworking/UIImageView+AFNetworking.h>

@interface CVNViewController ()
@property(nonatomic, strong) NSArray *fakeData;
@end

static NSString * const kSection = @"section";
static NSString * const kItems = @"items";
static NSString * const kTitle = @"title";
static NSString * const kImage = @"image";
static NSString * const kHighlights = @"highlights";

@implementation CVNViewController

- (void)viewDidLoad {
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  self.fakeData = @[@{kSection: @"Condimentum",
                      kHighlights:@[
                          @"http://www.goldenstreetapartments.com/wp-content/uploads/2013/08/istanbulbg-01.jpg",
                          @"http://www.priorityonejets.com/wp-content/uploads/2013/04/jet-charter-to-istanbul.jpg",
                          @"http://somosolimpicos.com/wp-content/uploads/2013/09/estambul.jpg"
                          ],
                      kItems: @[
                          @{kTitle: @"Etiam porta sem malesuada magna mollis euismod.",
                            kImage: @"http://www.goldenstreetapartments.com/wp-content/uploads/2013/08/istanbulbg-01.jpg"
                            },
                          @{kTitle: @"Aenean lacinia bibendum nulla sed consectetur.",
                            kImage: @"http://www.priorityonejets.com/wp-content/uploads/2013/04/jet-charter-to-istanbul.jpg"
                            },
                          @{kTitle: @"Curabitur blandit tempus porttitor.",
                            kImage: @"http://somosolimpicos.com/wp-content/uploads/2013/09/estambul.jpg"
                            },
                          @{kTitle: @"Fusce dapibus, tellus ac cursus commodo, tortor mauris condimentum nibh, ut fermentum massa justo sit amet risus."
                            }
                          ]
                      },
                    @{kSection: @"Risus Malesuada",
                      kHighlights: @[
                          @"http://istanbulstreets.files.wordpress.com/2010/10/istanbul_through_my_eyes-5.jpg",
                          @"http://medicatrans.com/wp-content/uploads/2013/10/istanbul2.jpg",
                          @"http://www.semesteratsea.org/wp-content/uploads/2012/08/001.jpg"
                          ],
                      kItems: @[
                          @{kTitle: @"Nulla vitae elit libero, a pharetra augue.",
                            kImage: @"http://www.semesteratsea.org/wp-content/uploads/2012/08/001.jpg"
                            },
                          @{kTitle: @"Maecenas faucibus mollis interdum."
                            },
                          @{kTitle: @"Morbi leo risus, porta ac consectetur ac, vestibulum at eros.",
                            kImage: @"http://istanbulstreets.files.wordpress.com/2010/10/istanbul_through_my_eyes-5.jpg"
                            },
                          @{kTitle: @"Duis mollis, est non commodo luctus, nisi erat porttitor ligula, eget lacinia odio sem nec elit."
                            },
                          @{kTitle: @"Aenean eu leo quam. Pellentesque ornare sem lacinia quam venenatis vestibulum.",
                            kImage: @"http://medicatrans.com/wp-content/uploads/2013/10/istanbul2.jpg"
                            }
                          ]
                      }
                    ];
  UINib *cellNib = [UINib nibWithNibName:@"CVNSampleItemViewCell" bundle:[NSBundle mainBundle]];
  [self.itemsView registerNib:cellNib forCellWithReuseIdentifier:@"PaperViewCell"];
  self.dataSource = self;
}

- (void)didReceiveMemoryWarning {
  [super didReceiveMemoryWarning];
  // Dispose of any resources that can be recreated.
  
}

#pragma CVNPaperViewDataSource Methods

- (NSInteger) numberOfSectionsInPaperViewController:(CVNPaperViewController *) paperViewController {
  return [self.fakeData count];
}

- (NSInteger) paperViewController:(CVNPaperViewController *) paperViewController
           numberOfItemsInSection:(NSInteger) section {
  return [self.fakeData[section][kItems] count];
}

- (CVNPaperViewCell *) paperViewController:(CVNPaperViewController *) paperViewController
               itemsCellForItemAtIndexPath:(NSIndexPath *)indexPath {
  
  CVNSampleItemViewCell *cell = [self.itemsView dequeueReusableCellWithReuseIdentifier:@"PaperViewCell" forIndexPath:indexPath];
  
  NSArray *items = self.fakeData[indexPath.section][kItems];
  NSDictionary *item = items[indexPath.row];
  
  if (item[kImage]) {
    [cell.itemImage setImageWithURL:[NSURL URLWithString:item[kImage]]];
  } else {
    [cell.itemImage setImage:nil];
  }
  
  cell.itemTitle.text = item[kTitle];
  
  return cell;
}

- (NSArray *) paperViewController:(CVNPaperViewController *) paperViewController
             highlightsForSection:(NSInteger) section {
  return self.fakeData[section][kHighlights];
}


@end
