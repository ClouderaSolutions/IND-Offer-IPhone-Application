//
//  Constants.h
//  browze
//
//  Created by HashBrown Systems on 27/11/14.
//  Copyright (c) 2014 Hashbrown Systems. All rights reserved.
//

#import <Foundation/Foundation.h>

#define SYSTEM_VERSION_GRATERTHAN_OR_EQUALTO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

#define IS_IPHONE_5 ( fabs( ( double )[ [ UIScreen mainScreen ] bounds ].size.height - ( double )568 ) < DBL_EPSILON )

/*********************** BASE URL ****************************/

#define SERVER_URL        @"http://shop4website.in/indoffer/demo.php"

#define USER_TIMELINE        @"https://api.twitter.com/1.1/statuses/user_timeline.json?"

#define  post_url  @"http://bitebc.ca/api/api/"

 


//AlertView Titles
#define ALERT @"Alert"
#define OOPS @"Oops"

// AlertView Error Messages
#define INTERNET_ERROR @"Please check your internet connection!"

//constants
#define OK @"OK"

#define RED [UIColor redColor]
#define BLUE [UIColor blueColor]
#define YELLOW [UIColor orangeColor]
#define PINK [UIColor colorWithRed:250/255.0 green:97/255.0 blue:139/255.0 alpha:1]
#define PURPLE [UIColor purpleColor]
#define CLEAR [UIColor clearColor]
#define LIGHTBLUE [UIColor colorWithRed:241/255.0 green:249/255.0 blue:255/255.0 alpha:1.0]
#define LIGHTYELLOW [UIColor colorWithRed:255/255.0 green:248/255.0 blue:223/255.0 alpha:1.0]




#define SHOPTYPE  @"ShopType"
#define INSURANCETYPE  @"Insurance Type"
#define PROPERTYTYPE  @"Property Type"
#define REGISTERTYPE  @"Register Type"
#define COUNTRYSTATE  @"Country State"
#define COUNTRYCITY  @"Country City"
#define REGISTERNEARCITY  @"Register Near City"






@interface Constants : NSObject

@end
