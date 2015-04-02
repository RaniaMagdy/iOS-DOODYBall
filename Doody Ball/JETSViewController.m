//
//  JETSViewController.m
//  Doody Ball
//
//  Created by JETS on 3/31/15.
//  Copyright (c) 2015 JETS. All rights reserved.
//

#import "JETSViewController.h"

@interface JETSViewController ()

@end

@implementation JETSViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    
    CGSize size=self.view.bounds.size;
    printf("W%f",size.width);
    printf("H%f",size.height);
    printf("X%f",self.view.bounds.origin.x);
    printf("Y%f",self.view.bounds.origin.y);
    
   // [_logo addSubview:(UIView *)]
    
    self.logoLabel=[[UILabel alloc]initWithFrame:CGRectMake(50, 0, 150, 35)];
    [self.logoLabel setBackgroundColor:[UIColor clearColor]];
    [self.logoLabel setTextColor:[UIColor redColor]];
    [self.logoLabel setFont:[UIFont fontWithName:@"Papyrus" size:34]];
    [self.logoLabel setText:@"DOODY"];
    [self.view addSubview:self.logoLabel];
    
    self.animator=[[UIDynamicAnimator alloc]initWithReferenceView:self.view];
    [self demoGravity];

    
    
    // Load images
    NSArray *imageNames = @[@"doody1.png", @"doody2.png", @"doody3.png", @"doody4.png"];
    
    NSMutableArray *images = [[NSMutableArray alloc] init];
    for (int i = 0; i < imageNames.count; i++) {
        [images addObject:[UIImage imageNamed:[imageNames objectAtIndex:i]]];
    }
    
    // Normal Animation
    /*
    UIImageView *animationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(60, 95, 86, 193)];
    animationImageView.animationImages = images;
    animationImageView.animationDuration = 0.5;
    
    [self.view addSubview:animationImageView];
    [animationImageView startAnimating];
    */
    
    // Slow motion animation
    UIImageView *slowAnimationImageView = [[UIImageView alloc] initWithFrame:CGRectMake(110, 220, 86, 130)];
    slowAnimationImageView.animationImages = images;
    slowAnimationImageView.animationDuration = 5;
    
    [self.view addSubview:slowAnimationImageView];
    [slowAnimationImageView startAnimating];


}

-(void)demoGravity{
    UIGravityBehavior* gravity=[[UIGravityBehavior alloc]initWithItems:@[self.logoLabel]];
    UICollisionBehavior* collisionBehavior=[[UICollisionBehavior alloc]initWithItems:@[self.logoLabel]];
    UIDynamicItemBehavior* ballBehavior=[[UIDynamicItemBehavior alloc]initWithItems:@[self.logoLabel]];
    
    
    [collisionBehavior addBoundaryWithIdentifier:@"bottom" fromPoint:CGPointMake(self.view.bounds.origin.x, self.view.bounds.origin.y+self.view.bounds.size.height-210)  toPoint:CGPointMake(self.view.bounds.origin.x+self.view.bounds.size.width, self.view.bounds.origin.y+self.view.bounds.size.height-210)];
    
    ballBehavior.elasticity=0.75;
    
    [self.animator addBehavior:ballBehavior];
    [self.animator addBehavior:collisionBehavior];
    [self.animator addBehavior:gravity];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
