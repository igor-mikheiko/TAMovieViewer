//
//  TAMovieCell.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAMovieCell.h"

@interface TAMovieCell ()

@property (nonatomic, weak) IBOutlet UIButton *favoriteButton;
@property (nonatomic, weak) IBOutlet UIButton *watchedButton;

@end

@implementation TAMovieCell {
    __weak TADiscoveryMovieViewModel *_model;
}

- (void)awakeFromNib
{
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated
{
//    [super setSelected:selected animated:animated];
//
//    // Configure the view for the selected state
}

- (void)bindWithModel:(TADiscoveryMovieViewModel *)model
{
    _model = model;
    _model.viewDelegate = self;

    self.textLabel.text = model.title;

    [self.favoriteButton setSelected:model.isFavorite];
    [self.watchedButton setSelected:model.isWatched];
}

- (IBAction)favoriteAction:(id)sender
{
    if ([sender isSelected]) {
        [_model performRemoveFromFavoriteAction];
    } else {
        [_model performAddToFavoriteAction];
    }
}

- (IBAction)watchedAction:(id)sender
{
    if ([sender isSelected]) {
        [_model performRemoveFromWatchedAction];
    } else {
        [_model performAddToWatchedAction];
    }
}

#pragma mark - TADiscoveryMovieViewDelegate

- (void)updateView
{
    [self bindWithModel:_model];
}

@end
