//
//  WebAPI.m
//  browze
//
//  Created by HashBrown Systems on 04/05/15.
//  Copyright (c) 2015 Hashbrown Systems. All rights reserved.
//

#import "WebAPI.h"
#import "AppDelegate.h"

@implementation WebAPI
@synthesize delegate;

#pragma mark -- Authentication Methods

-(void)signUpWithDetail:(NSMutableDictionary *)details
{
    NSLog(@"%@",details);
    
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :details onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                
                if ([[completed objectForKey:@"success"] integerValue]==1)
                {
                    [[self delegate] callbackSignUpSuccess:completed];

                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];

                }

                
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}
-(void)createShop:(NSMutableDictionary *)shopDetails
{
    NSLog(@"%@",shopDetails);
    
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :shopDetails onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                
                if ([[completed objectForKey:@"success"] integerValue]==1)
                {
                    [[self delegate] callbackShopAdded:completed];
                    
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                    
                }
                
                
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];

}
-(void)addShopOffer:(NSMutableDictionary *)shopOfferDetails
{
    NSLog(@"%@",shopOfferDetails);
    
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :shopOfferDetails onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                
                if ([[completed objectForKey:@"success"] integerValue]==1)
                {
                    [[self delegate] callbackShopOfferSuccess:completed];
                    
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                    
                }
                
                
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];

}
-(void)addProperty:(NSMutableDictionary *)propertyDetails
{
    NSLog(@"%@",propertyDetails);
    
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :propertyDetails onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                
                if ([[completed objectForKey:@"success"] integerValue]==1)
                {
                    [[self delegate] callbackAddPropertySuccess:completed];
                    
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                    
                }
                
                
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
    

}
-(void)addSellProperty:(NSMutableDictionary *)sellPropertyDetails
{
    NSLog(@"%@",sellPropertyDetails);
    
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :sellPropertyDetails onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                
                if ([[completed objectForKey:@"success"] integerValue]==1)
                {
                    [[self delegate] callbackAddSellPropertySuccess:completed];
                    
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                    
                }
                
                
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];

    
}
-(void)getProperty:(NSMutableDictionary *)propertyDetails
{
    NSLog(@"%@",propertyDetails);
    
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :propertyDetails onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                
                if ([[completed objectForKey:@"success"] integerValue]==1)
                {
                    [[self delegate] callbackGetPropertySuccess:completed];
                    
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                    
                }
                
                
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
    

}

-(void)createInsurance:(NSMutableDictionary *)insuranceDetails
{
    NSLog(@"%@",insuranceDetails);
    
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :insuranceDetails onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                
                if ([[completed objectForKey:@"success"] integerValue]==1)
                {
                    [[self delegate] callbackInsuranceSuccess:completed];
                    
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                    
                }
                
                
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
    

}
-(void)createEvent:(NSMutableDictionary *)eventDetails
{
    NSLog(@"%@",eventDetails);
    
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :eventDetails onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                
                if ([[completed objectForKey:@"success"] integerValue]==1)
                {
                    [[self delegate] callbackEventSuccess:completed];
 
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                    
                }
                
                
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];

}
-(void)createBiz:(NSMutableDictionary *)bizDetails
{
    NSLog(@"%@",bizDetails);
    
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :bizDetails onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                
                if ([[completed objectForKey:@"success"] integerValue]==1)
                {
                    [[self delegate] callbackBizSuccess:completed];
                    
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                    
                }
                
                
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
    
}
-(void)signUpWithOtp:(NSMutableDictionary *)details
{
    NSLog(@"%@",details);
    
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
   [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :details onCompletion:^(id completed)
    {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                if ([[completed objectForKey:@"login"] integerValue]==1)
                {
                    [[self delegate] callbackLoginSuccess:completed];

                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:@"User not registered."];
                 }
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}


-(void)getCountry
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"GetCountry" forKey:@"type"];
    
    
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :dict onCompletion:^(id completed)
     {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                
                
                  [[self delegate] callBackCountry:completed];
//                if ([[completed objectForKey:@"status"] integerValue]==0)
//                {
//                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
//                }
//                else
//                {
//                    [[self delegate] callBackCountry:completed];
//                }
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            
            [[self delegate] callbackFromAPI:nil];

            NSLog(@"No Country");
         }
    }];
    
}
-(void)sellListProperty
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"GetGSell" forKey:@"type"];
    
     NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :dict onCompletion:^(id completed)
     {
         @try {
             if (![completed isKindOfClass:[NSError class]])
             {
                 [[self delegate] callbackSellPropertyList:completed];
             }
             else
             {
                 [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
             }
         }
         @catch (NSException *exception)
         {
             NSLog(@"Exception: %@", exception);
             [Helper showAlertViewWithTitle:ALERT message:[exception description]];
         }
         @finally {
             
             [[self delegate] callbackFromAPI:nil];
             
         }
     }];
 
}

-(void)getInsuranceList 
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"GetInsurance" forKey:@"type"];
    
    
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :dict onCompletion:^(id completed)
     {
         @try {
             if (![completed isKindOfClass:[NSError class]])
             {
                 [[self delegate] callbackInsuranceTypeList:completed];
             }
             else
             {
                 [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
             }
         }
         @catch (NSException *exception)
         {
             NSLog(@"Exception: %@", exception);
             [Helper showAlertViewWithTitle:ALERT message:[exception description]];
         }
         @finally {
             
             [[self delegate] callbackFromAPI:nil];
             
         }
     }];
    

}
-(void)propertyListLeasePurchase:(NSString*)agreementStr
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"PropList" forKey:@"type"];
    [dict setObject:agreementStr forKey:@"agreement"];
    
 
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :dict onCompletion:^(id completed)
     {
         @try {
             if (![completed isKindOfClass:[NSError class]])
             {
                 [[self delegate] callbackPropertyLeasePurchaseList:completed];

                  
             }
             else
             {
                 [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
             }
         }
         @catch (NSException *exception)
         {
             NSLog(@"Exception: %@", exception);
             [Helper showAlertViewWithTitle:ALERT message:[exception description]];
         }
         @finally {
             
             [[self delegate] callbackFromAPI:nil];
             
         }
     }];
    

}
-(void)getShopList:(NSString *)shoptyp
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"GetGShop" forKey:@"type"];
    [dict setObject:shoptyp forKey:@"stype"];
    
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :dict onCompletion:^(id completed)
     {
         @try {
             if (![completed isKindOfClass:[NSError class]])
             {
                 
                 if ([[completed objectForKey:@"success"] integerValue]==1)
                 {
                     [[self delegate] callbackShopList:completed];
                     
                 }
                 else
                 {
                     [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"shopList"]];
                     
                 }
             }
             else
             {
                 [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
             }
         }
         @catch (NSException *exception)
         {
             NSLog(@"Exception: %@", exception);
             [Helper showAlertViewWithTitle:ALERT message:[exception description]];
         }
         @finally {
             
             [[self delegate] callbackFromAPI:nil];
             
          }
     }];
    
}


-(void)getState:(NSString*)countryID
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"GetStates" forKey:@"type"];
    [dict setObject:countryID forKey:@"Cid"];
 
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :dict onCompletion:^(id completed)
     {
         @try {
             if (![completed isKindOfClass:[NSError class]])
             {
                 
                 
                 [[self delegate] callBackState:completed];
               
             }
             else
             {
                 [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
             }
         }
         @catch (NSException *exception)
         {
             NSLog(@"Exception: %@", exception);
             [Helper showAlertViewWithTitle:ALERT message:[exception description]];
         }
         @finally {
             
              [[self delegate] callbackFromAPI:nil];
             
             NSLog(@"No Country");
         }
     }];
    
}
-(void)getCityFromStateID:(NSString*)stateID flag:(NSString*)flag
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"GetCities" forKey:@"type"];
    [dict setObject:stateID forKey:@"stateid"];
    [dict setObject:flag forKey:@"flag"];

    
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :dict onCompletion:^(id completed)
     {
         @try {
             if (![completed isKindOfClass:[NSError class]])
             {
                 
                 
                 [[self delegate] callBackCities:completed];
                 
             }
             else
             {
                 [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
             }
         }
         @catch (NSException *exception)
         {
             NSLog(@"Exception: %@", exception);
             [Helper showAlertViewWithTitle:ALERT message:[exception description]];
         }
         @finally {
             
              [[self delegate] callbackFromAPI:nil];
             
             NSLog(@"No Country");
         }
     }];
    
}
-(void)getNearCityFromStateID:(NSString*)stateID flag:(NSString*)flag
{
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:@"GetCities" forKey:@"type"];
    [dict setObject:stateID forKey:@"stateid"];
    [dict setObject:flag forKey:@"flag"];
    
    
    NSString *requestURL=[NSString stringWithFormat:@"%@",SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataHTTP:@"" :dict onCompletion:^(id completed)
     {
         @try {
             if (![completed isKindOfClass:[NSError class]])
             {
                 
                 
                 [[self delegate] callBackNearCities:completed];
                 
             }
             else
             {
                 [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
             }
         }
         @catch (NSException *exception)
         {
             NSLog(@"Exception: %@", exception);
             [Helper showAlertViewWithTitle:ALERT message:[exception description]];
         }
         @finally {
             
             [[self delegate] callbackFromAPI:nil];
             
             NSLog(@"No Country");
         }
     }];
    
}




 -(void)checkPlaceAddedToFavouriteORNot:(NSString *)palceID
{
    NSString *requestURL=[NSString stringWithFormat:@"%@adsuser/checkfav", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:palceID forKey:@"placeid"];
    [dict setObject:[Helper getIMEINumber] forKey:@"deviceid"];
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :dict onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                [[self delegate] callBackCheckPlaceSuccess:completed];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
    }];
}

-(void)AddRemovePlaceFromFavouriteWithDetails:(NSDictionary *)details
{
    NSString *requestURL=[NSString stringWithFormat:@"%@adsuser/setfavourite", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :details onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                [Helper showAlertViewWithTitle:@"" message:[completed objectForKey:@"message"]];
                [[self delegate] callBackAddRemoveFavouriteSuccess:completed];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
    }];
}

-(void)getAllFavouritePlaces
{
    NSString *requestURL=[NSString stringWithFormat:@"%@adsuser/getfavourites", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    NSDictionary *dict = [[NSDictionary alloc]initWithObjects:@[[Helper getIMEINumber]] forKeys:@[@"deviceid"]];
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :dict onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                [[self delegate] callBackFavouriteSuccess:completed];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)checkNotificationSettings
{
    NSString *requestURL=[NSString stringWithFormat:@"%@pushnotification/checkstatus", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    NSDictionary *dict = [[NSDictionary alloc]initWithObjects:@[[Helper getIMEINumber]] forKeys:@[@"deviceid"]];
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :dict onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                [[self delegate] callBackNotificationSettingsSuccess:completed];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)saveNotificationSettingsWithDetails:(NSMutableDictionary *)details
{
    NSString *requestURL=[NSString stringWithFormat:@"%@pushnotification/savestatus", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :details onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                [[self delegate] callBackSaveNotificationSettingsSuccess:completed];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)getAllRunningAds
{
    NSString *requestURL=[NSString stringWithFormat:@"%@auth/getallrunningadds", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :nil onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                [[self delegate] callBackAllRunningAdsSuccess:[completed objectForKey:@"data"]];
            }
        }
        @catch (NSException *exception)
        {
            
        }
    }];
}

-(void)getPlaceInfoForBatchWithDetails:(NSMutableDictionary *)details
{
    NSString *requestURL=[NSString stringWithFormat:@"%@adsuser/getaddsinfo", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :details onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                [[self delegate] callBackBatchInfoSuccess:[[completed objectForKey:@"data"] firstObject]];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

#pragma mark -- Business Methods

-(void)forgotPasswordWithDetails:(NSMutableDictionary *)details;
{
    NSString *requestURL=[NSString stringWithFormat:@"%@auth/forgotpass", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :details onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                if ([[completed objectForKey:@"status"] integerValue]==0)
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                }
                else
                {
                    [[self delegate] callbackForgotPasswordSuccess:completed];
                }
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)updatePasswordWithDetails:(NSMutableDictionary *)details
{
    NSString *requestURL=[NSString stringWithFormat:@"%@auth/forgotpass", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :details onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                if ([[completed objectForKey:@"status"] integerValue]==0)
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                }
                else
                {
                    [[self delegate] callbackUpdatePasswordSuccess:completed];
                }
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)loginWithDetails:(NSMutableDictionary *)details
{
    NSString *requestURL=[NSString stringWithFormat:@"%@auth/login", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :details onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                if ([[completed objectForKey:@"status"] integerValue]==0)
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                }
                else
                {
                    [[self delegate] callbackLoginSuccess:completed];
                }
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}


-(void)generateToken
{
    NSString *requestURL=[NSString stringWithFormat:@"%@auth/generatekey", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :nil onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                [[self delegate] callbackTokenSuccess:completed];
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)logoutUser
{
    NSString *requestURL=[NSString stringWithFormat:@"%@auth/logout", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:[[NSUserDefaults standardUserDefaults] objectForKey:@"MyId"] forKey:@"userid"];
    [dict setObject:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] forKey:@"token"];
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :dict onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                if ([[completed objectForKey:@"status"] integerValue]==1)
                {
                    [[self delegate] callbackLogoutSuccess:completed];
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                }
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)updateBasicInfo:(NSMutableDictionary *)details
{
    NSString *requestURL=[NSString stringWithFormat:@"%@user/adduserinfo", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostDataForImage:requestURL :details :[details objectForKey:@"image"] onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                if ([[completed objectForKey:@"status"] integerValue]==1)
                {
                    [[self delegate] callbackBasicInfoSuccess:completed];
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                }
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)getNotifications
{
    NSString *requestURL=[NSString stringWithFormat:@"%@purchase/plannotification", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:[[NSUserDefaults standardUserDefaults] objectForKey:@"MyId"] forKey:@"userid"];
    [dict setObject:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] forKey:@"token"];
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :dict onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                if ([[completed objectForKey:@"status"] integerValue]==1)
                {
                    [[self delegate] callbackNotificationsSuccess:[completed objectForKey:@"data"]];
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                }
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)getTransactionHistory
{
    NSString *requestURL=[NSString stringWithFormat:@"%@purchase/history", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:[[NSUserDefaults standardUserDefaults] objectForKey:@"MyId"] forKey:@"userid"];
    [dict setObject:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] forKey:@"token"];
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :dict onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                if ([[completed objectForKey:@"status"] integerValue]==1)
                {
                    [[self delegate] callbackHistorySuccess:[completed objectForKey:@"data"]];
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                }
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)saveBusinessWithDetails:(NSMutableDictionary *)details
{
    NSString *requestURL=[NSString stringWithFormat:@"%@business/addbusiness", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :details onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                if ([[completed objectForKey:@"status"] integerValue]==1)
                {
                    [[self delegate] callbackSaveBusinessSuccess:completed];
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                }
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)getPlans
{
    NSString *requestURL=[NSString stringWithFormat:@"%@plans/getplans", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    NSMutableDictionary *dict = [[NSMutableDictionary alloc]init];
    [dict setObject:[[NSUserDefaults standardUserDefaults] objectForKey:@"MyId"] forKey:@"userid"];
    [dict setObject:[[NSUserDefaults standardUserDefaults] objectForKey:@"token"] forKey:@"token"];
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :dict onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                if ([[completed objectForKey:@"status"] integerValue]==1)
                {
                    [[self delegate] callbackPlansSuccess:[completed objectForKey:@"data"]];
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                }
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)savePlanWithDetails:(NSMutableDictionary *)details
{
    NSString *requestURL=[NSString stringWithFormat:@"%@purchase/addpayment", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :details onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                if ([[completed objectForKey:@"status"] integerValue]==1)
                {
                    [[self delegate] callbackSavePlanSuccess:completed];
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                }
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)updatePaymentStatusWithDetails:(NSMutableDictionary *)details
{
    NSString *requestURL=[NSString stringWithFormat:@"%@purchase/updatestatus", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :details onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                if ([[completed objectForKey:@"status"] integerValue]==1)
                {
                    [[self delegate] callbackUpdateStatusSuccess:completed];
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                }
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)getAdsWithDetails:(NSMutableDictionary *)details
{
    NSString *requestURL=[NSString stringWithFormat:@"%@ads/getaddsdetail", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :details onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                if ([[completed objectForKey:@"status"] integerValue]==1)
                {
                    [[self delegate] callbackGetAdsSuccess:[completed objectForKey:@"data"] type:[details objectForKey:@"status"]];
                }
                else
                {
                    //[Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                }
            }
            else
            {
                //[Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            //[Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)addAdWithDetails:(NSMutableDictionary *)details
{
    NSString *requestURL=[NSString stringWithFormat:@"%@ads/createad", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :details onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                if ([[completed objectForKey:@"status"] integerValue]==1)
                {
                    [[self delegate] callbackAddAdsSuccess:completed];
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                }
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)getBuyAdsWithDetails:(NSMutableDictionary *)details
{
    NSString *requestURL=[NSString stringWithFormat:@"%@ads/getdetail", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :details onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                if ([[completed objectForKey:@"status"] integerValue]==1)
                {
                    [[self delegate] callbackBuyAdsSuccess:[completed objectForKey:@"data"]];
                }
                else
                {
                    //[Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                }
            }
            else
            {
                //[Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            //[Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

-(void)getTermsAndConditions
{
    NSString *requestURL=[NSString stringWithFormat:@"%@auth/termscondition", SERVER_URL];
    NSLog(@"%@", requestURL);
    
    [[ConnectionHandler getSharedInstance] jsonPostData:requestURL :nil onCompletion:^(id completed) {
        @try {
            if (![completed isKindOfClass:[NSError class]])
            {
                if ([[completed objectForKey:@"status"] integerValue]==1)
                {
                    [[self delegate] callbackTermsSuccess:[[completed objectForKey:@"data"] firstObject]];
                }
                else
                {
                    [Helper showAlertViewWithTitle:ALERT message:[completed objectForKey:@"message"]];
                }
            }
            else
            {
                [Helper showAlertViewWithTitle:ALERT message:INTERNET_ERROR];
            }
        }
        @catch (NSException *exception)
        {
            NSLog(@"Exception: %@", exception);
            [Helper showAlertViewWithTitle:ALERT message:[exception description]];
        }
        @finally {
            [[self delegate] callbackFromAPI:nil];
        }
    }];
}

@end
