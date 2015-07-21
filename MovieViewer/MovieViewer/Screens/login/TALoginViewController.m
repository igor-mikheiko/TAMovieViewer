//
//  TALoginViewController.m
//  MovieViewer
//
//  Created by Alex Rudyak on 7/20/15.
//  Copyright (c) 2015 *instinctools. All rights reserved.
//

#import "TALoginViewController.h"
#import "TALoginViewModel.h"

@interface TALoginViewController () <TALoginViewDelegate>

@property (weak, nonatomic) IBOutlet UITextField *loginTestField;
@property (weak, nonatomic) IBOutlet UITextField *passwordTextField;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;

@end

@implementation TALoginViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.

    [UIView transitionWithView:self.loginTestField duration:.25f options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.loginTestField.text = self.viewModel.loginString;
    } completion:nil];
    [UIView transitionWithView:self.passwordTextField duration:.25f options:UIViewAnimationOptionCurveEaseIn animations:^{
        self.passwordTextField.text = self.viewModel.passwordString;
    } completion:nil];
}

- (IBAction)logInAction:(id)sender
{
    [self.viewModel setLoginString:self.loginTestField.text];
    [self.viewModel setPasswordString:self.passwordTextField.text];

    [self.viewModel performLoginAction];
}

- (IBAction)registrationAction:(id)sender
{

}

#pragma mark - TALoginViewDelegate

- (void)loginActionSuccessed
{
    [UIView transitionWithView:self.statusLabel duration:.3f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.statusLabel.hidden = NO;
        self.statusLabel.textColor = [UIColor greenColor];
        self.statusLabel.text = @"Success";
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.2f delay:2.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.statusLabel.hidden = YES;
        } completion:nil];
    }];
}

- (void)loginActionFailedWithError:(NSError *)error
{
    [UIView transitionWithView:self.statusLabel duration:.3f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
        self.statusLabel.hidden = NO;
        self.statusLabel.textColor = [UIColor redColor];
        self.statusLabel.text = [NSString stringWithFormat:@"Error: %@", [error localizedDescription] ?: @"smth. happend"];
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:.2f delay:2.5f options:UIViewAnimationOptionTransitionCrossDissolve animations:^{
            self.statusLabel.hidden = YES;
        } completion:nil];
    }];
}

@end
