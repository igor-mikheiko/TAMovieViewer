//
//  TATableViewController.h
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewController.h"
#import "TATableViewModelProtocol.h"

FOUNDATION_EXPORT NSString *const TATableViewControllerNibName;

@protocol TATableViewController <NSObject>

@property (nonatomic, strong, readonly) NSObject<TATableViewModelProtocol> *viewModel;

@end

@interface TATableViewController : TAViewController <TATableViewController, UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, weak, readonly) UITableView *tableView;

@property (nonatomic, strong, readonly) NSArray *data;

@end
