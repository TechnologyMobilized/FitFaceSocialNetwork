//
//  WebServiceWithCaller.m
//  neibr
//
//  Created by Launch Labs on 4/21/15.
//
//

#import "WebServiceWithCaller.h"

@implementation WebServiceWithCaller

@synthesize webServiceWithCallerDelegate,stringData;
-(id)init{
    self = [super init] ;
    if (self != nil) {
        jsonData = [[NSMutableData alloc] init];
    }
    return self;
}
-(void) getDataFromURL: (NSString *) urlString{
    NSURL * url = [NSURL URLWithString:urlString];
    NSMutableURLRequest *theRequest = [NSMutableURLRequest requestWithURL:url cachePolicy:NSURLRequestUseProtocolCachePolicy timeoutInterval:30];
    
    NSURLConnection *theConnection = [[NSURLConnection alloc] initWithRequest:theRequest delegate:self];
    if(!theConnection){
        
    }
}
- (void) postRequestFromUrl: (NSString *) urlString withDictionary: (NSDictionary *) post{
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSError *error;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:post options:0 error:&error];
    NSString *  postLength = [NSString stringWithFormat:@"%d", (int)[postData length]];
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    //url where u will send data
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody: postData];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[postLength length]] forHTTPHeaderField:@"Content-Length"];
    
    NSLog(@"@@REQUEST: %@", request);
    NSURLConnection * conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(conn) {
        NSLog(@"Connection Successful");
    } else {
        NSLog(@"Connection could not be made");
    }
}
+ (NSMutableURLRequest*)getPostRequestURL:(NSString*)urlString withDictionary:(NSDictionary*)post{
    NSURL *url = [NSURL URLWithString:urlString];
    NSError *error;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:post options:0 error:&error];
    NSString *  postLength = [NSString stringWithFormat:@"%d", (int)[postData length]];
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    //url where u will send data
    [request setHTTPMethod:@"POST"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody: postData];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[postLength length]] forHTTPHeaderField:@"Content-Length"];
    
    return request;
}
- (void) deleteRequestFromUrl: (NSString *) urlString withDictionary: (NSDictionary *) post{
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSError *error;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:post options:0 error:&error];
    NSString *  postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    //url where u will send data
    [request setHTTPMethod:@"DELETE"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody: postData];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[postLength length]] forHTTPHeaderField:@"Content-Length"];
    
    NSLog(@"@@REQUEST: %@", request);
    NSURLConnection * conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(conn) {
        NSLog(@"Connection Successful");
    } else {
        NSLog(@"Connection could not be made");
    }
}
- (void) putRequestFromUrl: (NSString *) urlString withDictionary: (NSDictionary *) post{
    
    NSURL *url = [NSURL URLWithString:urlString];
    NSError *error;
    NSData *postData = [NSJSONSerialization dataWithJSONObject:post options:0 error:&error];
    NSString *  postLength = [NSString stringWithFormat:@"%lu", (unsigned long)[postData length]];
    NSMutableURLRequest * request = [[NSMutableURLRequest alloc] initWithURL:url];
    
    //url where u will send data
    [request setHTTPMethod:@"PUT"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setHTTPBody: postData];
    [request setValue:[NSString stringWithFormat:@"%lu", (unsigned long)[postLength length]] forHTTPHeaderField:@"Content-Length"];
    
    NSLog(@"@@REQUEST: %@", request);
    NSURLConnection * conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if(conn) {
        NSLog(@"Connection Successful");
    } else {
        NSLog(@"Connection could not be made");
    }
}

//- (void) postRequestImageUrlandData: (NSString *) urlString withDictionary: (NSDictionary *) post withMutableData: (NSMutableData *)post withBaseBoundary: (NSString *)baseBoundary{
//    NSURL * url = [NSURL URLWithString:urlString];
//    ////////
//    NSError *error;
//    NSData *postData = [NSJSONSerialization dataWithJSONObject:post options:0 error:&error];
//    NSString *  postLength = [NSString stringWithFormat:@"%d", [postData length]];
//
//    /////
//    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
//
//    [request setHTTPMethod:@"POST"];
//
//    //////////////
//    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
//    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
//    [request setHTTPBody: postData];
//    [request setValue:[NSString stringWithFormat:@"%d", [postLength length]] forHTTPHeaderField:@"Content-Length"];
//
//    /////////////
//    [request setValue:[NSString stringWithFormat:@"multipart/form-data; boundary=%@", baseBoundary] forHTTPHeaderField:@"Content-Type"];
//    [request setValue:[NSString stringWithFormat:@"%d", [post length]] forHTTPHeaderField:@"Content-Length"];
//    [request setHTTPBody:post];
//
//    //    NSData *result=[NSURLConnection sendSynchronousRequest:request returningResponse:nil error:nil];
//    //    NSString *returnString=[[NSString alloc] initWithData:result encoding:NSUTF8StringEncoding];
//
//    NSURLConnection * conn = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//
//    if(conn) {
//        NSLog(@"Connection Successful");
//    } else {
//        NSLog(@"Connection could not be made");
//    }
//}


-(void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    [jsonData setLength:0];
}

-(void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    //NSLog(@"@@@@RECEIVING: %@", data);
    NSString *string = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    //NSLog(@"@@Contents: %@", string);
    [jsonData appendData:data];
    stringData =string;
}

-(void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    //NSLog(@"didFailWithError: %@",[error localizedDescription]);
    
//    [webServiceWithCallerDelegate receiveJSONTimeout:error];
    
    [webServiceWithCallerDelegate didReceiveJSONTimeOut:error from:self];
}

-(void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSError * error = nil;
    NSArray * arrayData = [NSJSONSerialization JSONObjectWithData:jsonData options:NSJSONReadingMutableContainers error:&error];
    // NSLog(@"@@DICTIONARY: %@", arrayData);
    
//    [webServiceWithCallerDelegate receiveJSONData:arrayData];
    [webServiceWithCallerDelegate didReceiveJSONData:arrayData from:self];
}



@end
