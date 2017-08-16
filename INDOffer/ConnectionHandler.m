//
//  ConnectionHandler.m
//  browze
//
//  Created by HashBrown Systems on 14/03/14.
//  Copyright (c) 2014 hashbrown. All rights reserved.
//

#import "ConnectionHandler.h"
#import "AppDelegate.h"

@implementation ConnectionHandler
@synthesize manager;

static ConnectionHandler *sharedInstance = nil;

#pragma mark -- Initialization

+(ConnectionHandler *)getSharedInstance
{
    if (!sharedInstance)
    {
        sharedInstance = [[super allocWithZone:NULL]init];
        [sharedInstance initializeConnection];
    }
    return sharedInstance;
}

-(void)initializeConnection
{
    if (manager==nil)
    {
        manager = [AFHTTPSessionManager manager];
    }
}

#pragma mark -- Cancel Requests

-(void)stopAllRequests
{
    [manager.operationQueue cancelAllOperations];
}

- (void)cancelAllHTTPOperationsWithPath:(NSString *)path
{
    [[manager session] getTasksWithCompletionHandler:^(NSArray *dataTasks, NSArray *uploadTasks, NSArray *downloadTasks) {
        [self cancelTasksInArray:dataTasks withPath:path];
        [self cancelTasksInArray:uploadTasks withPath:path];
        [self cancelTasksInArray:downloadTasks withPath:path];
    }];
}

- (void)cancelTasksInArray:(NSArray *)tasksArray withPath:(NSString *)path
{
    for (NSURLSessionTask *task in tasksArray) {
        NSRange range = [[[[task currentRequest]URL] absoluteString] rangeOfString:path];
        if (range.location != NSNotFound)
        {
            NSLog(@"------ Request canceled --------");
            [task cancel];
        }
    }
}

#pragma mark -- Server Requests

-(void)jsonGETData:(NSString *)url onCompletion:(void(^)(id completed))completion
{
    [self initializeConnection];
    
    manager.responseSerializer=[AFJSONResponseSerializer serializer];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSLog(@"AfNetworkResponse %@",responseObject);
        if ([responseObject isKindOfClass:[NSDictionary class]] || [responseObject isKindOfClass:[NSArray class]])
        {
            completion(responseObject);
        }
        else
        {
            NSError* error;
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                 options:kNilOptions
                                                                   error:&error];
            NSLog(@"AfNetworkResponse: %@", json);
            completion(json);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failer %@",error);
        NSDictionary *dic=error.userInfo;
        if (![[dic objectForKey:@"NSLocalizedDescription"] isEqualToString:@"cancelled"])
        {
            completion(error);
        }
        else
        {
            NSLog(@"No response");
        }
    }];
}

-(void)jsonPostData:(NSString *)url : (NSDictionary *)params onCompletion:(void(^)(id completed))completion
{
    [self initializeConnection];
    
    manager.requestSerializer=[AFHTTPRequestSerializer serializer];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    //url = [NSString stringWithFormat:@"%@%@", SERVER_URL, url];
    
    [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        @try {
            NSError* error;
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                 options:kNilOptions
                                                                   error:&error];
            NSLog(@"AfNetworkResponse: %@", json);
            completion(json);
        }
        @catch (NSException *exception) {
            NSLog(@"Exception: %@", exception);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error %@",error);
        NSDictionary *dic=error.userInfo;
        if (![[dic objectForKey:@"NSLocalizedDescription"] isEqualToString:@"cancelled"])
        {
            completion(error);
        }
        else
        {
            NSLog(@"No response");
        }
    }];
}

-(void)jsonPostDataHTTP:(NSString *)url : (NSDictionary *)params onCompletion:(void(^)(id completed))completion
{
    [self initializeConnection];
    manager.requestSerializer = [AFHTTPRequestSerializer serializer];
    //manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    
    url = [NSString stringWithFormat:@"%@%@", SERVER_URL, url];
    
    [manager POST:url parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        @try
        {
            NSLog(@"AfNetworkResponse: %@", responseObject);
            completion(responseObject);
        }
        @catch (NSException *exception) {
            NSLog(@"Exception: %@", exception);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error %@",error);
        NSDictionary *dic=error.userInfo;
        if (![[dic objectForKey:@"NSLocalizedDescription"] isEqualToString:@"cancelled"])
        {
            completion(error);
        }
        else
        {
            NSLog(@"No response");
        }
    }];
}

-(void)jsonPostDataForImage:(NSString *)url : (NSDictionary *)params : (NSData *)imageData onCompletion:(void(^)(id completed))completion
{
    [self initializeConnection];
    manager.requestSerializer=[AFHTTPRequestSerializer serializer];
    manager.responseSerializer=[AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:5*60];
    
    [manager POST:url parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
        [formData appendPartWithFileData:imageData name:@"image" fileName:@"image.jpg" mimeType:@"image/jpeg"];
    } progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        @try {
            NSError* error;
            NSDictionary* json = [NSJSONSerialization JSONObjectWithData:responseObject
                                                                 options:kNilOptions
                                                                   error:&error];
            NSLog(@"AfNetworkResponse: %@", json);
            completion(json);
        }
        @catch (NSException *exception) {
            NSLog(@"Exception: %@", exception);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"Error %@",error);
        NSDictionary *dic=error.userInfo;
        if (![[dic objectForKey:@"NSLocalizedDescription"] isEqualToString:@"cancelled"])
        {
            completion(error);
        }
        else
        {
            NSLog(@"No response");
        }
    }];
}

-(void)jsonGETDataHTTP:(NSString *)url onCompletion:(void(^)(id completed))completion
{
    [self initializeConnection];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];

    url = [NSString stringWithFormat:@"%@%@", SERVER_URL, url];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject)
    {
        NSLog(@"AfNetworkResponse %@",responseObject);
        completion(responseObject);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failer %@",error);
        NSDictionary *dic=error.userInfo;
        if (![[dic objectForKey:@"NSLocalizedDescription"] isEqualToString:@"cancelled"])
        {
            completion(error);
        }
        else
        {
            NSLog(@"No response");
        }
    }];
}

-(void)jsonGETDataHTTPWithDictionary:(NSString *)url params:(NSDictionary *)dic onCompletion:(void(^)(id completed))completion
{
    [self initializeConnection];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    url = [NSString stringWithFormat:@"%@%@", SERVER_URL, url];

    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"AfNetworkResponse %@",responseObject);
        completion(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failer %@",error);
        NSDictionary *dic=error.userInfo;
        if (![[dic objectForKey:@"NSLocalizedDescription"] isEqualToString:@"cancelled"])
        {
            completion(error);
        }
        else
        {
            NSLog(@"No response");
        }
    }];
}

-(void)jsonGETDataForMap:(NSString *)url onCompletion:(void(^)(id completed))completion
{
    [self initializeConnection];
    
    [manager GET:url parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"AfNetworkResponse %@",responseObject);
        completion(responseObject);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"failer %@",error);
        NSDictionary *dic=error.userInfo;
        if (![[dic objectForKey:@"NSLocalizedDescription"] isEqualToString:@"cancelled"])
        {
            completion(error);
        }
        else
        {
            NSLog(@"No response");
        }
    }];
}

@end
