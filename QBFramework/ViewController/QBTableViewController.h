//
//  QBTableViewController.h
//  Base
//
//  Created by tian on 15/3/12.
//  Copyright (c) 2015年 tian. All rights reserved.
//

#import "QBViewController.h"

#import "QBLoadMoreCell.h"

@interface QBTableViewController : QBViewController <UITableViewDataSource, UITableViewDelegate, QBLoadMoreCellDelegate>

- (id)initWithStyle:(UITableViewStyle)style;

@property (nonatomic, strong)  UITableView *tableView;

@property (nonatomic, assign, readwrite)  BOOL  hasPullRefresh;
@property (nonatomic, assign, readwrite) BOOL hasLoadMoreView;
@property (nonatomic, strong)  QBLoadMoreCell  *loadMoreCell;

- (void)back;

- (void)reloadView;//刷新数据
- (void)pullToRefresh;//下拉数据

- (void)triggerPullToRefresh;
- (void)triggerLoadMore;

- (BOOL)isLoadMoreViewNeeded;//是否还有更多数据
@end
