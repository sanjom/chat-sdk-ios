//
//  BLocationViewController.m
//  Chat SDK
//
//  Created by Benjamin Smiley-andrews on 16/04/2014.
//  Copyright (c) 2014 deluge. All rights reserved.
//

#import "BLocationViewController.h"
#import <ChatSDK/ChatCore.h>
#import <ChatSDK/ChatUI.h>

@interface BLocationViewController ()

@end

@implementation BLocationViewController

@synthesize mapView;
@synthesize region;
@synthesize annotation;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    
    self = [super initWithNibName:@"BLocationViewController" bundle:[NSBundle chatUIBundle]];
    if (self) {
        self.title = [NSBundle t:bLocation];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:[NSBundle t:bBack] style:UIBarButtonItemStylePlain target:self action:@selector(backButtonPressed)];
    
    self.navigationItem.rightBarButtonItem = [[UIBarButtonItem alloc] initWithTitle:[NSBundle t:bOpenInMaps] style:UIBarButtonItemStylePlain target:self action:@selector(openInGoogleMaps)];

}

-(void) viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    
    [mapView setRegion:region animated:NO];
    [mapView addAnnotation:annotation];
    [mapView selectAnnotation:annotation animated:NO];
}

-(void) backButtonPressed {
    [self dismissViewControllerAnimated:YES completion:Nil];
}

-(void) openInGoogleMaps {
    NSString * location = [NSString stringWithFormat:@"https://maps.google.com/maps?q=%f,%f&%iz", region.center.latitude, region.center.longitude, 15];
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:location]];
}

@end
