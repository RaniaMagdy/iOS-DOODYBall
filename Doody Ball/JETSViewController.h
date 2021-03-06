//
//  JETSViewController.h
//  Doody Ball
//
//  Created by JETS on 3/31/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JETSViewController : UIViewController <UIDynamicAnimatorDelegate>

@property (nonatomic,strong) UIView* logo;
@property (nonatomic,strong) UILabel* logoLabel;
@property (nonatomic,strong) UIDynamicAnimator* animator;

@end
