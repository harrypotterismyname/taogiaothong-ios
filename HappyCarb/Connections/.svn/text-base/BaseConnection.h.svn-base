//
//  BaseConnection.h
//
//  Created by William (Van Thuong) on 08/08/11.
//  Copyright 2011 Magnussen. All rights reserved.
//

#import <Foundation/Foundation.h>
//@class MainPageViewController;

@interface BaseConnection : NSObject {
	//connection request
	NSMutableURLRequest *internalRequest;
	
	// email and password used for connection
	NSString *username;
	NSString *password;
	
	// NSString status message;
	NSString *internalErrorMessage;
	
	//Downloaded data
	NSMutableData *downloadedData;
	
	CGFloat totalByte;
	
//	MainPageViewController *mainPageViewController;
@private
	//Connection
	NSURLConnection *connection;

	
	// callbacks when loading is complete and when authentication fails
	id internalDelegate;
	SEL internalCompletedCallbackSelector;
	SEL internalAuthenticationCallbackSelector;
	//SEL _timeoutCallbackSelector;
	SEL internalFailedCallbackSelector;
	

	

}
//@property(nonatomic,assign) MainPageViewController *mainPageViewController;
@property (nonatomic, retain) NSString *username;
@property (nonatomic, retain) NSString *password;
@property (nonatomic, readonly, retain) NSString *errorMessage;
@property (nonatomic, readonly, retain) NSMutableURLRequest *request;
@property (nonatomic, retain) NSMutableData *downloadedData;
@property (nonatomic, retain) NSURLConnection *connection;

- (void)startRequestWithURL:(NSString*)url 
				 httpMethod:(NSString*)httpMethod 
				   httpBody:(NSString*)body
				contentType:(NSString*)contentType
				  actionURI:(NSString*)actionURI //this is used for SOAP connection
					timeOut:(NSInteger)timeOut
				   delegate:(id)delegate
		  completedCallback:(SEL)completedCallbackSelector
	 authenticationCallback:(SEL)authenticationCallbackSelector
			 failedCallback:(SEL)failedCalbackSelector
					  username:(NSString*)anUserName
				   password:(NSString*)userPassword;

- (void)startRequestUploadWithURL:(NSString*)url 
					   httpMethod:(NSString*)httpMethod 
						 httpBody:(NSMutableData*)body
					  contentType:(NSString*)contentType
						actionURI:(NSString*)actionURI
						  timeOut:(NSInteger)timeOut
						 delegate:(id)delegate
				completedCallback:(SEL)completedCallbackSelector
		   authenticationCallback:(SEL)authenticationCallbackSelector
				   failedCallback:(SEL)failedCalbackSelector
						 username:(NSString*)anUserName
						 password:(NSString*)userPassword;

- (void)cancelConnection;
- (NSData*)downloadedData;
- (BOOL)isReceiving;

@end

@interface BaseConnection (Protected)
- (void)_notifyDelegateOfCompletion;
- (void)_notifyDelegateOfAuthentication;
- (void)_notifyDelegateOfFailure;
@end

