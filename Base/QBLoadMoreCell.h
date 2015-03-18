//
//  QBLoadMoreCell.h
//  Base
//
//  Created by tian on 15/3/12.
//  Copyright (c) 2015年 tian. All rights reserved.
//

#import <UIKit/UIKit.h>
@class QBLoadMoreCell;
@protocol  QBLoadMoreCellDelegate<NSObject>

- (void)loadMoreViewCellDidTriggerLoad:(QBLoadMoreCell *)cell;
- (BOOL)loadMoreViewCellDataSourceIsLoading:(QBLoadMoreCell *)cell;
@end

@interface QBLoadMoreCell : UITableViewCell

@property   (nonatomic, assign) id<QBLoadMoreCellDelegate>  delegate;

- (void)loadMoreScrollViewDidEndDragging:(UIScrollView *)scrollView;

// Tell load more view to end
- (void)loadMoreScrollViewDataSourceDidFinishedLoading:(UIScrollView *)scrollView;
+ (CGFloat)height;
@end
