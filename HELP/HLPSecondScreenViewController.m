//
//  HLPSecondScreenViewController.m
//  HELP
//
//  Created by WildSpirit on 17.05.14.
//  Copyright (c) 2014 WildSpirit. All rights reserved.
//

#import "HLPSecondScreenViewController.h"

#import "HLPPosition.h"

@interface HLPSecondScreenViewController () <GMSMapViewDelegate>
@property (weak, nonatomic) IBOutlet GMSMapView *mapView;
@property (weak, nonatomic) IBOutlet UIButton *addressButton;
@end

@implementation HLPSecondScreenViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [[HLPPosition sharedHLPPositionManager] findCurrentLocation];
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:[[HLPPosition sharedHLPPositionManager] coordinates].latitude longitude:[[HLPPosition sharedHLPPositionManager] coordinates].longitude zoom:6];
    
    GMSMapView * mapView_ = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    
    self.mapView = mapView_;
    
    GMSMarker *marker = [[GMSMarker alloc] init];
    marker.position = camera.target;
    marker.snippet = @"Вы здесь";
    marker.map = self.mapView;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
