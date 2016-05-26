//
//  WebServiceWithCaller.h
//  neibr
//
//  Created by Launch Labs on 4/21/15.
//
//

#import <Foundation/Foundation.h>

@protocol WebServiceWithCallerDelegate;

@interface WebServiceWithCaller :NSObject{
    NSMutableData *  jsonData;
}

@property (nonatomic, strong) id <WebServiceWithCallerDelegate> webServiceWithCallerDelegate;

-(void) getDataFromURL: (NSString *) urlString;
- (void) postRequestFromUrl: (NSString *) urlString withDictionary: (NSDictionary *) post;
- (void) putRequestFromUrl: (NSString *) urlString withDictionary: (NSDictionary *) post;
- (void) deleteRequestFromUrl: (NSString *) urlString withDictionary: (NSDictionary *) post;
//- (void) postRequestImageUrlandData: (NSString *) urlString withDictionary: (NSDictionary *) post withMutableData: (NSMutableData *)post withBaseBoundary: (NSString *)baseBoundary;
+ (NSMutableURLRequest*)getPostRequestURL:(NSString*)urlString withDictionary:(NSDictionary*)post;

//my additions
@property(nonatomic, strong) NSString* stringData;

@end

@protocol WebServiceWithCallerDelegate <NSObject>

- (void)didReceiveJSONData: (NSArray*)jsonData from:(WebServiceWithCaller*)caller;
- (void)didReceiveJSONTimeOut: (NSError*)error from:(WebServiceWithCaller*)caller;
@end