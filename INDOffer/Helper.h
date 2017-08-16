//
//  Helper.h
//  browze
//
//  Created by HashBrown Systems on 26/03/15.
//  Copyright (c) 2015 Hashbrown Systems. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreLocation/CoreLocation.h>
#import <UserNotifications/UserNotifications.h>
#import "Reachability.h"
#import "MBProgressHUD.h"
#import "Constants.h"

@interface Helper : NSObject<UIAlertViewDelegate>

+(BOOL)isLocationServiceEnabled;
+(BOOL) isInternetConnected;
+(NSString *)calculatePlainTextTimeFromSeconds:(float)seconds;
+(NSString *)getNotificationToken;
+(NSString *)getIMEINumber;
+(NSNumber *)getNumberFromString:(NSString *)strValue;
+(NSString *)getPhoneTypeNameForTypeID:(long)typeID;
+(NSString *)getEmailTypeNameForTypeID:(long)typeID;
+(NSString *)getAddressTypeNameForTypeID:(long)typeID;
+(NSString *)getSocialTypeNameForTypeID:(long)typeID;
+(NSString *)getURLTypeNameForTypeID:(long)typeID;
+(void)callAtNumber:(NSString *)phone;

+(NSString *)getTitleForBeek:(NSDictionary *)dict;

+(NSString *)generateRandomNumber;
+(NSString *)saveFileInDocumentFolder:(NSString *)path data:(NSData *)data;

+(NSString *)getProfileNameForProfileType:(NSString *)profileType typeID:(NSString *)typeID;

//+(void)changeColorOfImageToAppColor:(UIImageView *)imageView;
+ (UIColor *) getColorForOrderStatus:(long)orderStatus;

+(BOOL)validateEmailWithString:(NSString*)emailmatch;
+(BOOL)validateUsernameWithString:(NSString*)username;
+(BOOL)validateOnlyTextWithString:(NSString *)text;
+(BOOL)validateURLWithString:(NSString *)text;

+(void)saveAllValuesInUserDefaults:(NSDictionary *)responseObject;
+(void)removeAllValuesFromDefaults;

+(CGRect)calculateHeightForText:(NSString *)text fontName:(NSString *)fontName fontSize:(float)fontSize maximumWidth:(float)width;
+(CGRect)calculateHeightForText:(NSString *)text font:(UIFont *)font maximumWidth:(float)width;
+(CGRect)calculateHeightForAttributedText:(NSAttributedString *)text font:(UIFont *)font maximumWidth:(float)width;

+(void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message;

+(void)placholderTextChange:(NSString*)stringName :(UITextField*)textfield;

+ (UIColor *) colorFromHexString:(NSString *)hexString;
+ (NSString *)getDateStringFromDate:(NSDate *)date;
+ (NSDate *)getDateFromDateString:(NSString *)dateStr;
+ (NSDate *)getBirthdayDateFromDateString:(NSString *)dateStr;
+(NSString *)getUTCFormateDate:(NSDate *)localDate;
+(NSString *)getLocalDateFromUTC:(NSDate *)date;
+(NSString *)getCurrentDateStr;
+(NSString *)getFormmatedDateStrFromDate:(NSDate *)date;

+(NSString *)convertJSONObjectToString:(NSDictionary *)json;
+(NSDictionary *)convertJSONStringToDictionary:(NSString *)jsonString;

// indicator
+(void)showIndicatorWithText:(NSString *)text inView:(UIView *)view;
+(void)hideIndicatorFromView:(UIView *)view;



@end
