//
//  TAMovieCell.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/21/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TAMovieCell.h"

@implementation TAMovieCell

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

- (void)bindWithModel:(TADiscoverItemObject *)model
{
    self.textLabel.text = model.title;
}

@end
