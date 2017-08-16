//
//  Helper.m
//  browze
//
//  Created by HashBrown Systems on 26/03/15.
//  Copyright (c) 2015 Hashbrown Systems. All rights reserved.
//

#import "Helper.h"

@implementation Helper

+(BOOL)isLocationServiceEnabled
{
    if ([CLLocationManager authorizationStatus] == kCLAuthorizationStatusDenied)
    {
        return NO;
    }
    else
    {
        return YES;
    }
}

+(void)saveAllValuesInUserDefaults:(NSDictionary *)responseObject
{
    
     
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];


    [defaults setObject:[responseObject objectForKey:@"userid"] forKey:@"Userid"];
     [defaults setObject:[responseObject objectForKey:@"email"] forKey:@"Email"];
    [defaults setObject:[responseObject objectForKey:@"name"] forKey:@"Name"];
    
    if (![[responseObject objectForKey:@"cityid"] isKindOfClass:[NSNull class]])
    {
        [defaults setObject:[responseObject objectForKey:@"cityid"] forKey:@"Cityid"];
    }
    if (![[responseObject objectForKey:@"cid"] isKindOfClass:[NSNull class]])
    {
        [defaults setObject:[responseObject objectForKey:@"cid"] forKey:@"Cid"];
    }
    if (![[responseObject objectForKey:@"dob"] isKindOfClass:[NSNull class]])
    {
        [defaults setObject:[responseObject objectForKey:@"dob"] forKey:@"Dob"];
    }
    if (![[responseObject objectForKey:@"mobile"] isKindOfClass:[NSNull class]])
    {
        [defaults setObject:[responseObject objectForKey:@"mobile"] forKey:@"Mobile"];
    }
    if (![[responseObject objectForKey:@"nearbycityid"] isKindOfClass:[NSNull class]])
    {
        [defaults setObject:[responseObject objectForKey:@"nearbycityid"] forKey:@"Nearbycityid"];
    }
    if (![[responseObject objectForKey:@"stateid"] isKindOfClass:[NSNull class]])
    {
        [defaults setObject:[responseObject objectForKey:@"stateid"] forKey:@"Stateid"];
    }
    if (![[responseObject objectForKey:@"zipcode"] isKindOfClass:[NSNull class]])
    {
        [defaults setObject:[responseObject objectForKey:@"zipcode"] forKey:@"Zipcode"];
    }
    if (![[responseObject objectForKey:@"shopid"] isKindOfClass:[NSNull class]])
    {
        [defaults setObject:[responseObject objectForKey:@"shopid"] forKey:@"Shopid"];
    }


    
    [defaults synchronize];
}

+(void)removeAllValuesFromDefaults
{
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    [defaults removeObjectForKey:@"MyId"];
    [defaults removeObjectForKey:@"token"];
    [defaults removeObjectForKey:@"lastName"];
    [defaults removeObjectForKey:@"email"];
    [defaults removeObjectForKey:@"firstName"];
    [defaults removeObjectForKey:@"city"];
    [defaults removeObjectForKey:@"country"];
    [defaults removeObjectForKey:@"dob"];
    [defaults removeObjectForKey:@"image"];
    [defaults removeObjectForKey:@"lat"];
    [defaults removeObjectForKey:@"long"];
    [defaults removeObjectForKey:@"phone"];
    
    [defaults synchronize];
}

+(NSNumber *)getNumberFromString:(NSString *)strValue
{
    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
    f.numberStyle = NSNumberFormatterNoStyle;
    NSNumber *number = [f numberFromString:[NSString stringWithFormat:@"%@", strValue]];
    return number;
}

+(NSString *)getDateStringFromDate:(NSDate *)date
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    NSTimeZone *timeZone = [NSTimeZone timeZoneWithName:@"UTC"];
    [dateFormatter setTimeZone:timeZone];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *dateString = [dateFormatter stringFromDate:date];
    NSLog(@"GMT date: %@", dateString);
    return dateString;
}

+ (NSDate *)getDateFromDateString:(NSString *)dateStr
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    return date;
}

+ (NSDate *)getBirthdayDateFromDateString:(NSString *)dateStr
{
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc] init];
    [dateFormat setDateFormat:@"dd-MMMM-yyyy"];
    NSDate *date = [dateFormat dateFromString:dateStr];
    return date;
}

+(NSString *)getUTCFormateDate:(NSDate *)localDate
{
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd hh:mm a"];
    NSString *dateString = [dateFormatter stringFromDate:localDate];
    return dateString;
}

+(NSString *)getLocalDateFromUTC:(NSDate *)date
{
    // offset second
    NSInteger seconds = [[NSTimeZone systemTimeZone] secondsFromGMT];
    
    // format it and send
    NSDateFormatter *localDateFormatter = [[NSDateFormatter alloc] init];
    [localDateFormatter setDateFormat:@"yyyy-MM-dd"];
    [localDateFormatter setTimeZone :[NSTimeZone timeZoneForSecondsFromGMT: seconds]];
    
    // formatted string
    NSString *localDate = [localDateFormatter stringFromDate: date];
    return localDate;
}

+(NSString *)getCurrentDateStr
{
    NSDate *date = [NSDate date];
    // offset second
    NSInteger seconds = [[NSTimeZone systemTimeZone] secondsFromGMT];
    
    // format it and send
    NSDateFormatter *localDateFormatter = [[NSDateFormatter alloc] init];
    [localDateFormatter setDateFormat:@"EEE MMM dd"];
    [localDateFormatter setTimeZone :[NSTimeZone timeZoneForSecondsFromGMT: seconds]];
    
    // formatted string
    NSString *localDate = [localDateFormatter stringFromDate: date];
    return localDate;
}

+(NSString *)getFormmatedDateStrFromDate:(NSDate *)date
{
    // offset second
    NSInteger seconds = [[NSTimeZone systemTimeZone] secondsFromGMT];
    
    // format it and send
    NSDateFormatter *localDateFormatter = [[NSDateFormatter alloc] init];
    [localDateFormatter setDateFormat:@"dd MMM YYYY"];
    [localDateFormatter setTimeZone :[NSTimeZone timeZoneForSecondsFromGMT: seconds]];
    
    // formatted string
    NSString *localDate = [localDateFormatter stringFromDate: date];
    return localDate;
}

+(NSString *)calculatePlainTextTimeFromSeconds:(float)seconds
{
    NSString *time;
    if (seconds>3599)
    {
        long hours=seconds/3600;
        long remaingMinute=seconds-(hours*3600);
        long minutes=remaingMinute/60;
        long lastSeconds=remaingMinute-(minutes*60);
        
        NSString *hourText=(hours>9?[NSString stringWithFormat:@"%lu", hours]:[NSString stringWithFormat:@"0%lu", hours]);
        
        NSString *minuteText=(minutes>9?[NSString stringWithFormat:@"%lu", minutes]:[NSString stringWithFormat:@"0%lu", minutes]);
        
        NSString *secondsText=(lastSeconds>9?[NSString stringWithFormat:@"%lu", lastSeconds]:[NSString stringWithFormat:@"0%lu", lastSeconds]);
        
        time=[NSString stringWithFormat:@"%@:%@:%@", hourText, minuteText, secondsText];
    }
    else if (seconds>60)
    {
        long minutes=seconds/60;
        long lastSeconds=seconds-(minutes*60);
        
        NSString *minuteText=(minutes>9?[NSString stringWithFormat:@"%lu", minutes]:[NSString stringWithFormat:@"0%lu", minutes]);
        
        NSString *secondsText=(lastSeconds>9?[NSString stringWithFormat:@"%lu", lastSeconds]:[NSString stringWithFormat:@"0%lu", lastSeconds]);
        
        time=[NSString stringWithFormat:@"%@:%@", minuteText, secondsText];
    }
    else
    {
        long sec=seconds;
        NSString *secondsText=(seconds>9?[NSString stringWithFormat:@"%ld", sec]:[NSString stringWithFormat:@"0%ld", sec]);
        
        time=[NSString stringWithFormat:@"00:%@", secondsText];
    }
    return time;
}

+(float)fontSizeForCurrentViewHeight:(float)viewHeight baseHeight:(float)baseHeight baseFontSize:(float)baseFontSize
{
    float heightRatio=viewHeight/baseHeight;
    float fontSize=heightRatio*baseFontSize;
    return fontSize;
}

+(float)calculateViewWidthForView:(float)viewHeight baseWidth:(float)baseWidth baseFontSize:(float)baseFontSize
{
    float heightRatio=viewHeight/baseWidth;
    float fontSize=heightRatio*baseFontSize;
    return fontSize;
}

+(NSString *)getNotificationToken
{
    NSString *hexToken;
    NSUserDefaults *defaults=[NSUserDefaults standardUserDefaults];
    hexToken=[defaults objectForKey:@"token"];
    if (!hexToken)
    {
        hexToken=@"1234567890";
    }
    NSLog(@"Token Data %@",hexToken);
    return hexToken;
}

+(NSString *)getIMEINumber
{
    UIDevice *myDevice = [UIDevice currentDevice];
    NSUUID *identifier = myDevice.identifierForVendor;
    NSString *imei=identifier.UUIDString;
    return imei;
}

+(NSString *)getPhoneTypeNameForTypeID:(long)typeID
{
    NSString *name=@"";
    switch (typeID)
    {
        case 1:
            name = @"Home";
            break;
            
        case 2:
            name = @"Work";
            break;
            
        case 3:
            name = @"Mobile";
            break;
            
        default:
            break;
    }
    return name;
}

+(NSString *)getEmailTypeNameForTypeID:(long)typeID
{
    NSString *name=@"";
    switch (typeID)
    {
        case 1:
            name = @"Home";
            break;
            
        case 2:
            name = @"Work";
            break;
            
        default:
            break;
    }
    return name;
}

+(NSString *)getURLTypeNameForTypeID:(long)typeID
{
    NSString *name=@"";
    switch (typeID)
    {
        case 1:
            name = @"Personal";
            break;
            
        case 2:
            name = @"Business";
            break;
            
        default:
            break;
    }
    return name;
}

+(NSString *)getAddressTypeNameForTypeID:(long)typeID
{
    NSString *name=@"";
    switch (typeID)
    {
        case 1:
            name = @"Home";
            break;
            
        case 2:
            name = @"Work";
            break;
            
        default:
            break;
    }
    return name;
}

+(NSString *)getSocialTypeNameForTypeID:(long)typeID
{
    NSString *name=@"";
    switch (typeID)
    {
        case 1:
            name = @"Facebook";
            break;
            
        case 2:
            name = @"Twitter";
            break;
            
        case 3:
            name = @"Google Plus";
            break;
            
        case 4:
            name = @"Youtube";
            break;
            
        case 5:
            name = @"Pinterest";
            break;
            
        case 6:
            name = @"LinkedIn";
            break;
            
        case 7:
            name = @"Instagram";
            break;
            
        case 8:
            name = @"Skype";
            break;
            
        default:
            break;
    }
    return name;
}

+ (UIColor *) getColorForOrderStatus:(long)orderStatus
{
    UIColor *color;
    switch (orderStatus)
    {
        case 0:
            //pending
            color = [UIColor colorWithRed:52/255.0 green:100/255.0 blue:156/255.0 alpha:1];
            break;
        case 1:
            //completed
            color = [UIColor colorWithRed:129/255.0 green:86/255.0 blue:30/255.0 alpha:1];
            break;
        case 2:
            //cancelled
            color = [UIColor colorWithRed:138/255.0 green:38/255.0 blue:31/255.0 alpha:1];
            break;
        case 3:
            //confirm
            color = [UIColor colorWithRed:146/255.0 green:217/255.0 blue:92/255.0 alpha:1];
            break;
        case 4:
            //ready
            color = [UIColor colorWithRed:84/255.0 green:71/255.0 blue:186/255.0 alpha:1];
            break;
        case 5:
            //cancel
            color = [UIColor colorWithRed:138/255.0 green:38/255.0 blue:31/255.0 alpha:1];
            break;
        case 6:
            //driver
            color = [UIColor colorWithRed:109/255.0 green:215/255.0 blue:224/255.0 alpha:1];
            break;
        case 7:
            //driver
            color = [UIColor colorWithRed:109/255.0 green:215/255.0 blue:224/255.0 alpha:1];
            break;
        case 8:
            //driver
            color = [UIColor colorWithRed:109/255.0 green:215/255.0 blue:224/255.0 alpha:1];
            break;
        case 9:
            //delivered/completed
            color = [UIColor colorWithRed:129/255.0 green:86/255.0 blue:30/255.0 alpha:1];
            break;
        case 10:
            //cancelled/return
            color = [UIColor colorWithRed:138/255.0 green:38/255.0 blue:31/255.0 alpha:1];
            break;
            
        default:
            color = [UIColor blackColor];
            break;
    }
    return color;
}

+(NSString *)getTitleForBeek:(NSDictionary *)dict
{
    NSDictionary *_title = [dict objectForKey:@"title"];
    NSString *title=[_title objectForKey:@"raw"];
    title = [NSString stringWithFormat:@"%s", [title UTF8String]];
    title=[Helper removeAllSpecialHTMLCharactersFromString:title];
    return title;
}

+(void)placholderTextChange:(NSString*)stringName :(UITextField*)textfield
{
    UIColor *color = [UIColor whiteColor];
    textfield.attributedPlaceholder = [[NSAttributedString alloc] initWithString:stringName attributes:@{NSForegroundColorAttributeName: color}];
}

+(NSString *)removeAllSpecialHTMLCharactersFromString:(NSString *)text
{
    NSData *temp = [text dataUsingEncoding:NSASCIIStringEncoding allowLossyConversion:YES];
    NSString *dst = [[NSString alloc] initWithData:temp encoding:NSASCIIStringEncoding];
    dst=[dst stringByReplacingOccurrencesOfString:@"?Ai" withString:@"-"];
    dst=[dst stringByReplacingOccurrencesOfString:@"&amp;" withString:@"&"];
    NSLog(@"converted: %@", dst);
    
    return dst;
}

+(CGRect)calculateHeightForText:(NSString *)text fontName:(NSString *)fontName fontSize:(float)fontSize maximumWidth:(float)width
{
    UIFont *font = [UIFont fontWithName:fontName size:fontSize];
    NSDictionary *attributes = @{NSFontAttributeName: font};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attributes
                                     context:nil];
    
    return rect;
}

+(CGRect)calculateHeightForText:(NSString *)text font:(UIFont *)font maximumWidth:(float)width
{
    NSDictionary *attributes = @{NSFontAttributeName: font};
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT)
                                     options:NSStringDrawingUsesLineFragmentOrigin
                                  attributes:attributes
                                     context:nil];
    
    return rect;
}

+(CGRect)calculateHeightForAttributedText:(NSAttributedString *)text font:(UIFont *)font maximumWidth:(float)width
{
    CGRect rect = [text boundingRectWithSize:CGSizeMake(width, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin context:nil];
    
    return rect;
}

+ (UIColor *) colorFromHexString:(NSString *)hexString {
    NSString *cleanString = [hexString stringByReplacingOccurrencesOfString:@"#" withString:@""];
    if([cleanString length] == 3) {
        cleanString = [NSString stringWithFormat:@"%@%@%@%@%@%@",
                       [cleanString substringWithRange:NSMakeRange(0, 1)],[cleanString substringWithRange:NSMakeRange(0, 1)],
                       [cleanString substringWithRange:NSMakeRange(1, 1)],[cleanString substringWithRange:NSMakeRange(1, 1)],
                       [cleanString substringWithRange:NSMakeRange(2, 1)],[cleanString substringWithRange:NSMakeRange(2, 1)]];
    }
    if([cleanString length] == 6) {
        cleanString = [cleanString stringByAppendingString:@"ff"];
    }
    
    unsigned int baseValue;
    [[NSScanner scannerWithString:cleanString] scanHexInt:&baseValue];
    
    float red = ((baseValue >> 24) & 0xFF)/255.0f;
    float green = ((baseValue >> 16) & 0xFF)/255.0f;
    float blue = ((baseValue >> 8) & 0xFF)/255.0f;
    float alpha = ((baseValue >> 0) & 0xFF)/255.0f;
    
    return [UIColor colorWithRed:red green:green blue:blue alpha:alpha];
}

+(void)showAlertViewWithTitle:(NSString *)title message:(NSString *)message
{
    [[[UIAlertView alloc]initWithTitle:title message:message delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil] show];
}

+(BOOL)validateEmailWithString:(NSString*)emailmatch
{
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    if ([emailmatch rangeOfString:@" "].location==NSNotFound && [emailTest evaluateWithObject:emailmatch])
    {
        return YES;
    }
    else
    {
        return NO;
    }
}

+(BOOL)validateUsernameWithString:(NSString*)username
{
    NSCharacterSet * characterSetFromTextField = [NSCharacterSet characterSetWithCharactersInString: username];
    if([[NSCharacterSet alphanumericCharacterSet] isSupersetOfSet: characterSetFromTextField] == NO)
    {
        NSLog( @"there are bogus characters here, throw up a UIAlert at this point");
        return NO;
    }
    else
    {
        return YES;
    }
}

+(BOOL)validateOnlyTextWithString:(NSString *)text
{
    //Create character set
    NSCharacterSet *validChars = [NSCharacterSet characterSetWithCharactersInString:@"ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz "];
    
    //Invert the set
    validChars = [validChars invertedSet];
    
    //Check against that
    NSRange  range = [text rangeOfCharacterFromSet:validChars];
    if (NSNotFound != range.location) {
        return NO;
    }
    return YES;
}

+(BOOL)validateURLWithString:(NSString *)text
{
    NSString *urlRegEx =@"(http|https)://((\\w)*|([0-9]*)|([-|_])*)+([\\.|/]((\\w)*|([0-9]*)|([-|_])*))+";
    NSPredicate *urlTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", urlRegEx];
    return [urlTest evaluateWithObject:text];
}

+(void)callAtNumber:(NSString *)phone
{
    NSURL *phoneNumber = [NSURL URLWithString:[@"tel://" stringByAppendingString:phone]];
    if ([UIApplication.sharedApplication canOpenURL:phoneNumber]) {
        [UIApplication.sharedApplication openURL:phoneNumber];
    }
    else
    {
        [Helper showAlertViewWithTitle:OOPS message:@"Calling is not available on your device."];
    }
}

+(NSString *)getProfileNameForProfileType:(NSString *)profileType typeID:(NSString *)typeID
{
    NSString *name=@"";
    switch ([profileType integerValue])
    {
        case 2:
            //phone
            name = [Helper getPhoneTypeNameForTypeID:[typeID integerValue]];
            break;
        case 3:
            //email
            name = [Helper getEmailTypeNameForTypeID:[typeID integerValue]];
            break;
        case 4:
            //url
            name = [Helper getURLTypeNameForTypeID:[typeID integerValue]];
            break;
        case 5:
            //address
            name = [Helper getAddressTypeNameForTypeID:[typeID integerValue]];
            break;
            
        default:
            break;
    }
    return name;
}

+(NSString *)generateRandomNumber
{
    NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";
    NSMutableString *randomString = [NSMutableString stringWithCapacity: 8];
    
    for (NSUInteger i=0; i<8; i++) {
        [randomString appendFormat: @"%hu", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    
    return randomString;
}

+(NSString *)saveFileInDocumentFolder:(NSString *)path data:(NSData *)data
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains
    (NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentsDirectory = [paths objectAtIndex:0];
    
    //make a file name to write the data to using the documents directory:
    documentsDirectory = [documentsDirectory stringByAppendingPathComponent:[NSString stringWithFormat:@"%@.mov", path]];
    
    //[data writeToFile:documentsDirectory atomically:NO];
    return documentsDirectory;
}

+(NSString *)convertJSONObjectToString:(NSDictionary *)json
{
    NSError * err;
    NSData * jsonData = [NSJSONSerialization  dataWithJSONObject:json options:0 error:&err];
    NSString * myString = [[NSString alloc] initWithData:jsonData   encoding:NSUTF8StringEncoding];
    NSLog(@"%@",myString);
    return myString;
}

+(NSDictionary *)convertJSONStringToDictionary:(NSString *)jsonString
{
    NSError * err;
    NSData *data =[jsonString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary * response;
    if(data!=nil){
        response = (NSDictionary *)[NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingMutableContainers error:&err];
    }
    return response;
}

#pragma mark -- Internet Connectivity

+(BOOL) isInternetConnected
{
    // called after network status changes
    Reachability* internetReachable = [Reachability reachabilityForInternetConnection];;
    NetworkStatus internetStatus = [internetReachable currentReachabilityStatus];
    switch (internetStatus)
    {
        case NotReachable:
        {
            // NSLog(@"The internet is down.");
            return NO;
            
            break;
        }
        case ReachableViaWiFi:
        {
            // NSLog(@"The internet is working via WIFI.");
            return YES;
            
            break;
        }
        case ReachableViaWWAN:
        {
            // NSLog(@"The internet is working via WWAN.");
            return YES;
            
            break;
        }
    }
}

#pragma mark -- View Indicator

+(void)showIndicatorWithText:(NSString *)text inView:(UIView *)view
{
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.mode = MBProgressHUDModeIndeterminate;
    hud.label.text = text;
}

+(void)hideIndicatorFromView:(UIView *)view
{
    [MBProgressHUD hideHUDForView:view animated:YES];
}

@end
