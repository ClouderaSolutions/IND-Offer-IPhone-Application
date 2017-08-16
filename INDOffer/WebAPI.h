//
//  WebAPI.h
//  browze
//
//  Created by HashBrown Systems on 04/05/15.
//  Copyright (c) 2015 Hashbrown Systems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Constants.h"
#import "Helper.h"
#import "WebAPI.h"
#import "ConnectionHandler.h"
#import "AppDelegate.h"

@protocol APIsDelegate <NSObject>

@optional
- (void) callbackFromAPI:(id)response;

 -(void)callBackCountry:(id)response;
-(void)callBackState:(id)response;
-(void)callBackCities:(id)response;
-(void)callbackInsuranceTypeList:(id)response;


// Bottom Button Method
-(void)callbackPropertyLeasePurchaseList:(id)response;
-(void)callbackSellPropertyList:(id)response;
-(void)callbackShopList:(id)response;




-(void)callBackNearCities:(id)response;
-(void)callbackLoginSuccess:(id)response;


-(void)callbackSignUpSuccess:(id)response;
-(void)callbackEventSuccess:(id)response;
-(void)callbackBizSuccess:(id)response;
-(void)callbackShopAdded:(id)response;
-(void)callbackInsuranceSuccess:(id)response;
-(void)callbackGetPropertySuccess:(id)response;
-(void)callbackShopOfferSuccess:(id)response;
-(void)callbackAddPropertySuccess:(id)response;
-(void)callbackAddSellPropertySuccess:(id)response;






-(void)callBackUserData:(id)response;

-(void) callBackNearByResultsSuccess:(id)response;
-(void) callBackPlaceDetailsSuccess:(id)response;
-(void) callBackCheckPlaceSuccess:(id)response;
-(void) callBackAddRemoveFavouriteSuccess:(id)response;
-(void) callBackFavouriteSuccess:(id)response;
-(void) callBackNotificationSettingsSuccess:(id)response;
-(void) callBackSaveNotificationSettingsSuccess:(id)response;
-(void) callBackBatchInfoSuccess:(id)response;
-(void) callBackAllRunningAdsSuccess:(id)response;

//business methods
-(void)callbackForgotPasswordSuccess:(id)response;
-(void)callbackUpdatePasswordSuccess:(id)response;
 -(void)callbackTokenSuccess:(id)response;
-(void)callbackLogoutSuccess:(id)response;
-(void)callbackBasicInfoSuccess:(id)response;
-(void)callbackNotificationsSuccess:(id)response;
-(void)callbackHistorySuccess:(id)response;
-(void)callbackSaveBusinessSuccess:(id)response;
-(void)callbackPlansSuccess:(id)response;
-(void)callbackSavePlanSuccess:(id)response;
-(void)callbackUpdateStatusSuccess:(id)response;
-(void)callbackGetAdsSuccess:(id)response type:(NSString *)type;
-(void)callbackTermsSuccess:(id)response;
-(void)callbackBuyAdsSuccess:(id)response;
-(void)callbackAddAdsSuccess:(id)response;

@end

@interface WebAPI : NSObject
{
    __weak id <APIsDelegate> delegate;
}

@property (nonatomic,weak) id delegate;

//user methods

-(void)signUpWithOtp:(NSMutableDictionary *)details;
-(void)signUpWithDetail:(NSMutableDictionary *)details;

-(void)getCountry;
-(void)getShopList:(NSString *)shoptyp;
-(void)getInsuranceList;
-(void)sellListProperty;
-(void)propertyListLeasePurchase:(NSString*)agreementStr;



-(void)getState:(NSString*)countryID;
-(void)getCityFromStateID:(NSString*)stateID flag:(NSString*)flag;
-(void)getNearCityFromStateID:(NSString*)stateID flag:(NSString*)flag;


-(void)createEvent:(NSMutableDictionary *)eventDetails;
-(void)createBiz:(NSMutableDictionary *)bizDetails;
-(void)createShop:(NSMutableDictionary *)shopDetails;
-(void)addShopOffer:(NSMutableDictionary *)shopOfferDetails;
-(void)addProperty:(NSMutableDictionary *)propertyDetails;
-(void)addSellProperty:(NSMutableDictionary *)sellPropertyDetails;




-(void)createInsurance:(NSMutableDictionary *)insuranceDetails;
-(void)getProperty:(NSMutableDictionary *)propertyDetails;







 

-(void)checkNotificationSettings;
-(void)saveNotificationSettingsWithDetails:(NSMutableDictionary *)details;
//-(void)getNearByResultsForType:(NSString *)type;
//-(void)getNextResultByToken:(NSString *)token;
//-(void)getPlaceDetailsByPlaceID:(NSString *)palceID;
-(void)getAllRunningAds;
-(void)getPlaceInfoForBatchWithDetails:(NSMutableDictionary *)details;

-(void)checkPlaceAddedToFavouriteORNot:(NSString *)palceID;
-(void)AddRemovePlaceFromFavouriteWithDetails:(NSDictionary *)details;
-(void)getAllFavouritePlaces;

//business methods
-(void)generateToken;
-(void)forgotPasswordWithDetails:(NSMutableDictionary *)details;
-(void)updatePasswordWithDetails:(NSMutableDictionary *)details;
-(void)loginWithDetails:(NSMutableDictionary *)details;
 -(void)logoutUser;
-(void)updateBasicInfo:(NSMutableDictionary *)details;
-(void)getNotifications;
-(void)getTransactionHistory;
-(void)saveBusinessWithDetails:(NSMutableDictionary *)details;
-(void)getPlans;
-(void)savePlanWithDetails:(NSMutableDictionary *)details;
-(void)updatePaymentStatusWithDetails:(NSMutableDictionary *)details;
-(void)getAdsWithDetails:(NSMutableDictionary *)details;
-(void)getTermsAndConditions;
-(void)getBuyAdsWithDetails:(NSMutableDictionary *)details;
-(void)addAdWithDetails:(NSMutableDictionary *)details;

@end
