//
//  TAViewController.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAViewController.h"

@interface TAViewController ()

@end

@implementation TAViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil viewModel:(TAViewModel *)viewModel
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        _viewModel = viewModel;
        if ([_viewModel respondsToSelector:@selector(setViewDelegate:)]) {
            _viewModel.viewDelegate = self;
        }
    }
    return self;
}

- (instancetype)initWithViewModel:(TAViewModel *)viewModel
{
    self = [super init];
    if (self) {
        _viewModel = viewModel;
        if ([_viewModel respondsToSelector:@selector(setViewDelegate:)]) {
            _viewModel.viewDelegate = self;
        }
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
