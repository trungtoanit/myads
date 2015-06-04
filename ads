Quảng cáo admob


#define ID_ADMOB_FULL @"xxxx"
#define ID_ADMOB_BANER @"Banner"
@import GoogleMobileAds;



Khai báo 2 biến 

GADInterstitial *interstitial;
GADBannerView *bannerView_;
 
 
 - (void)adViewDidReceiveAd:(GADBannerView *)adView {
    NSLog(@"adViewDidReceiveAd");
    [self.view bringSubviewToFront:bannerView_];
    
    
    [UIView animateWithDuration:1 animations:^{
        CGRect frame =self.mTableView.frame;
        self.mTableView.frame = CGRectMake(frame.origin.x, frame.origin.y, frame.size.
                                           width, [UIScreen mainScreen].bounds.size.height-bannerView_.frame.size.height);
       bannerView_.frame = CGRectMake(0,[UIScreen mainScreen].bounds.size.height-bannerView_.frame.size.height-self.tabBarController.tabBar.frame.size.height , bannerView_.frame.size.width, bannerView_.frame.size.height);
    }];
    
}
-(void)LoadBanner{
    CGRect frame =self.mTableView.frame;
    bannerView_  = [[GADBannerView alloc] initWithAdSize:kGADAdSizeSmartBannerPortrait];
    bannerView_.frame = CGRectMake(0,[UIScreen mainScreen].bounds.size.height, bannerView_.frame.size.width, bannerView_.frame.size.height);
    bannerView_.rootViewController = self;
    bannerView_.delegate = self;
     bannerView_.adUnitID = ID_ADMOB_BANER;
    GADRequest *request = [GADRequest request];
    //request.testDevices = @[ @"18b1b0ac6b1be1f0d3a20d692c653eae" ];
     [self.view addSubview:bannerView_];
    [bannerView_ loadRequest:request];
}


Gắn Full Banner
- (void)interstitialDidReceiveAd:(GADInterstitial *)a{
    [a presentFromRootViewController:self];
}
- (void)interstitial:(GADInterstitial *)ad didFailToReceiveAdWithError:(GADRequestError *)error {
    STAStartAppSDK* sdk = [STAStartAppSDK sharedInstance];
   [sdk showSplashAd];
}
//GAn banner
  AppDelegate *app = [UIApplication sharedApplication].delegate;
    if(app.count%5==0 && app.isPro!=YES)
    {
        interstitial = [[GADInterstitial alloc] init];
        interstitial.adUnitID = ID_ADMOB_FULL;
        interstitial.delegate = self;
        GADRequest *request =[[GADRequest alloc]init];
        request.testDevices = @[ @"Simulator" ];
        
        [interstitial loadRequest:request];
        NSLog(@"Hien quang cao");
    }
    app.count++;
    
    
    
    Hiện quảng cáo STARTAPP 
    STAStartAppSDK* sdk = [STAStartAppSDK sharedInstance];
    sdk.appID = @"204996948";
    sdk.devID = @"104274168";
    
    
    STASplashPreferences *splashPreferences = [[STASplashPreferences alloc] init];
    splashPreferences.splashMode = STASplashModeTemplate;
    [sdk showSplashAdWithPreferences:splashPreferences];
    splashPreferences.splashTemplateAppName = @"XEM BÓNG ĐÁ";
    
    [sdk showSplashAdWithPreferences:splashPreferences];



Hiện Quảng cáo MobileCore

//MOBILE CORE 
[MobileCore initWithToken:@"DEVELOPER_HASH"
                 logLevel:PRODUCTION_LOG_LEVEL
                  adUnits:@[[NSNumber numberWithInt:AD_UNIT_INTERSTITIAL],[NSNumber numberWithInt:AD_UNIT_STICKEEZ],[NSNumber numberWithInt:AD_UNIT_DIRECT_TO_APP_STORE]]];
                  
 https://dashboard.mobilecore.com/#resources/ios/sdk-integration



MOBILECORE FULLBANNER 
 [MobileCore showInterstitialFromViewController];
 
 MOBILECORE STICKER
 
  if([MobileCore isStickeeReady]){
       // [MobileCore setStickeezPosition:xxx];
        //BOTTOM_LEFT, BOTTOM_RIGHT, MIDDLE_LEFT, MIDDLE_RIGHT, TOP_LEFT, TOP_RIGHT
       [MobileCore showStickeeFromViewController:self];
    }



 
 
 






