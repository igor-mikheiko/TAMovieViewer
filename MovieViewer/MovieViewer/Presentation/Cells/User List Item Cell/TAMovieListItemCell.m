//
//  TAMovieListItemCell.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/24/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAMovieListItemCell.h"

@interface TAMovieListItemCell ()

@property (nonatomic, weak) IBOutlet UIButton *removeButton;

@end

@implementation TAMovieListItemCell {
    __weak TAMovieListItemViewModel *_model;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
}

- (void)bindWithModel:(TAMovieListItemViewModel *)model
{
    _model = model;
    _model.viewDelegate = self;

    self.textLabel.text = model.title;
}

- (IBAction)removeAction:(id)sender
{
    [_model performRemoveFromList];
}

#pragma mark - TAMovieListItemViewDelegate

- (void)updateView
{
    [self bindWithModel:_model];
}

@end
