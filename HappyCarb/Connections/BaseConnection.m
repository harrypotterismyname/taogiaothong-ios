//
//  BaseConnection.m
//
//  Created by William (Van Thuong) on 08/08/11.
//  Copyright 2011 Magnussen. All rights reserved.
//

#import "BaseConnection.h"
//#import "Utilities.h"


@implementation BaseConnection
@synthesize username, password;
@synthesize connection;
@synthesize downloadedData;
@synthesize errorMessage = internalErrorMessage;
@synthesize request = internalRequest;


#pragma mark return YES if the connection is available
- (BOOL)isReceiving
{
    return (self.connection != nil);
}
#pragma mark cancel connection
- (void)cancelConnection
{
	if(self.connection!=nil) {
		assert(self.connection!=nil);
        internalDelegate = nil;
        internalCompletedCallbackSelector = nil;
        internalFailedCallbackSelector = nil;
		[self.connection cancel];
		self.connection = nil;
	}
}

#pragma mark -
#pragma mark Start connection
- (void)startRequestWithURL:(NSString*)url 
				 httpMethod:(NSString*)httpMethod 
				   httpBody:(NSString*)body
				contentType:(NSString*)contentType
				  actionURI:(NSString*)actionURI
					timeOut:(NSInteger)timeOut
				   delegate:(id)delegate
		  completedCallback:(SEL)completedCallbackSelector
	 authenticationCallback:(SEL)authenticationCallbackSelector
			 failedCallback:(SEL)failedCalbackSelector
				   username:(NSString*)anUserName
				   password:(NSString*)userPassword
{
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    
	//Stop the current connection if there is
	[self cancelConnection];

	// Open a connection for the URL.
	NSMutableURLRequest *newRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
	assert(newRequest != nil);
	//setup catch policy
	[newRequest setCachePolicy:NSURLRequestReloadIgnoringCacheData];
	//httpMethod GET/POST
	if(httpMethod!=nil)
		[newRequest setHTTPMethod:httpMethod];
	
	//Set the body
	if(body!=nil) {
		NSString *bodyLength				= [NSString stringWithFormat:@"%d",[body length]];
		//There must be content type for the body
		assert(contentType!=nil);
		if(contentType.length > 0) [newRequest addValue:contentType forHTTPHeaderField:@"Content-Type"];
		[newRequest addValue:bodyLength forHTTPHeaderField:@"Content-Length"];
		//For Opti testting
		if(actionURI!=nil)
			[newRequest addValue: actionURI forHTTPHeaderField:@"SOAPAction"];
		[newRequest setHTTPBody:[body dataUsingEncoding:NSUTF8StringEncoding allowLossyConversion:YES]];
	}
	internalDelegate = delegate;
	internalCompletedCallbackSelector		= completedCallbackSelector;
	internalAuthenticationCallbackSelector  = authenticationCallbackSelector;
	internalFailedCallbackSelector			= failedCalbackSelector;
	if(anUserName != nil) {
		self.username = anUserName;
		self.password = userPassword;
	}
	[newRequest setTimeoutInterval:timeOut];
	
	//Init the mutable data property to store the downloaded ata
	NSMutableData *tempData			= [[NSMutableData alloc] init];
	 self.downloadedData			= tempData;
//	[tempData release];
	
	//Start connection with request
	if(internalRequest) {
//		[internalRequest release];
		internalRequest = nil;
	}
	internalRequest						= [newRequest copy];
	
	NSURLConnection *conn			= [[NSURLConnection alloc] initWithRequest:newRequest delegate:self]; 
	self.connection					= conn;
	assert(self.connection != nil);
//	[conn release];
//	[newRequest release];
	
    
}

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
				   password:(NSString*)userPassword
{
	//Stop the current connection if there is
	[self cancelConnection];
	
	NSLog(@"%@",url);
	// Open a connection for the URL.
	NSMutableURLRequest *newRequest = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
	assert(newRequest != nil);
	//setup catch policy
	[newRequest setCachePolicy:NSURLRequestReloadIgnoringCacheData];
	//httpMethod GET/POST
	if(httpMethod!=nil)
		[newRequest setHTTPMethod:httpMethod];
	
	//Set the body
	if(body!=nil) {
		NSString *bodyLength				= [NSString stringWithFormat:@"%d",[body length]];
		NSLog(@"Content Length:%@", bodyLength);

		//[newRequest addValue:@"application/json; charset=utf-8" forHTTPHeaderField:@"Content-Type"];
		if(contentType != nil){
			[newRequest addValue:contentType forHTTPHeaderField:@"Content-Type"];
		}
		[newRequest addValue:bodyLength forHTTPHeaderField:@"Content-Length"];
		[newRequest setHTTPBody:body];
	}
	
	internalDelegate = delegate;
	internalCompletedCallbackSelector		= completedCallbackSelector;
	internalAuthenticationCallbackSelector  = authenticationCallbackSelector;
	internalFailedCallbackSelector			= failedCalbackSelector;
	if(anUserName != nil) {
		self.username = anUserName;
		self.password = userPassword;
	}
	[newRequest setTimeoutInterval:timeOut];
	
	//Init the mutable data property to store the downloaded ata
	NSMutableData *tempData			= [[NSMutableData alloc] init];
    self.downloadedData			= tempData;
//	[tempData release];
	
	//Start connection with request
	if(internalRequest) {
//		[internalRequest release];
		internalRequest = nil;
	}
	
	NSLog(@"Request:%@", newRequest);
	
	internalRequest						= [newRequest copy];
	
	NSURLConnection *conn			= [[NSURLConnection alloc] initWithRequest:newRequest delegate:self]; 
	self.connection					= conn;
	assert(self.connection != nil);
//	[conn release];
//	[newRequest release];
	
	
}


/*
- (NSURLRequest *)postRequestWithURL: (NSURL *)url        // IN
                             boundry: (NSString *)boundry // IN
                                data: (NSData *)data
                              userId:(NSString*)userId
                             caption:(NSString*)caption
// IN
{
    NSMutableData *postBody = [NSMutableData data];
	[postBody appendData:[[NSString stringWithFormat:@"--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
	[postBody appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"user_id\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	[postBody appendData:[[NSString stringWithString:userId] dataUsingEncoding:NSUTF8StringEncoding]];
	[postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
	
	[postBody appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"caption\"\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	[postBody appendData:[[NSString stringWithString:caption] dataUsingEncoding:NSUTF8StringEncoding]];
	[postBody appendData:[[NSString stringWithFormat:@"\r\n--%@\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
	
	[postBody appendData:[[NSString stringWithString:@"Content-Disposition: form-data; name=\"Filedata\"; filename=\"img.jpg\"\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	[postBody appendData:[[NSString stringWithString:@"Content-Type: application/octet-stream\r\n\r\n"] dataUsingEncoding:NSUTF8StringEncoding]];
	[postBody appendData:data];
	
	[postBody appendData:[[NSString stringWithFormat:@"\r\n--%@--\r\n",stringBoundary] dataUsingEncoding:NSUTF8StringEncoding]];
//	
//	
//	
//	//NSLog(@"%@",_postMessage);
//	if(! self._connection){
//		NSString *urlString = url;
//		[super startRequestWithURLString:urlString postMessage:_postMessage postBody:postBody];
//	}
//    
//    
    return request;
    
}
*/

#pragma mark -
#pragma mark Connection delegate methods
- (void)connection:(NSURLConnection *)connection didReceiveAuthenticationChallenge:(NSURLAuthenticationChallenge *)challenge {
	[self _notifyDelegateOfAuthentication];
	NSURLCredential *urlCredential = [NSURLCredential credentialWithUser:self.username password:self.password persistence:NSURLCredentialPersistenceForSession];
	[[challenge sender] useCredential:urlCredential forAuthenticationChallenge:challenge];
}

- (void)connection:(NSURLConnection *)theConnection didReceiveResponse:(NSURLResponse *)response
// A delegate method called by the NSURLConnection when the request/response 
// exchange is complete.  We look at the response to check that the HTTP 
// status code is 2xx and that the Content-Type is acceptable.  If these checks 
// fail, we give up on the transfer.
{
#pragma unused(theConnection)
    NSHTTPURLResponse * httpResponse;
	
	totalByte =  [[NSString stringWithFormat:@"%lli",[response expectedContentLength]] floatValue];
	//NSLog(@"Total length: %f",totalByte);
	
    assert(theConnection == self.connection);
    
    httpResponse = (NSHTTPURLResponse *) response;
    assert( [httpResponse isKindOfClass:[NSHTTPURLResponse class]] );
	
	NSLog(@"httpResponse: %@ .... StatusCode : %d", httpResponse,httpResponse.statusCode);
    
    if ((httpResponse.statusCode / 100) != 2) {
		if(internalErrorMessage) {
//			[internalErrorMessage release];
			internalErrorMessage = nil;
		}
       internalErrorMessage = [[NSString stringWithFormat:@"HTTP error %zd", (ssize_t) httpResponse.statusCode] copy];
        //DLog(@"InteralErrorMessage:%@", internalErrorMessage);
		[self cancelConnection];
		[self _notifyDelegateOfFailure];
    }else {
		NSLog(@"Status code:%d", httpResponse.statusCode);
	}

	
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
	[(NSMutableData*)self.downloadedData appendData:data];
	
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
	// Clear the activeDownload property to allow later attempts
    self.downloadedData = nil;
    
    // Release the connection now that it's finished
	if(internalErrorMessage) {
//		[internalErrorMessage release];
		internalErrorMessage = nil;
	}
	internalErrorMessage = [[error localizedDescription] copy];
	NSLog(@"Error:%@", internalErrorMessage);
    self.connection = nil;
	[self _notifyDelegateOfFailure];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    // Release the connection now that it's finished
    self.connection = nil;
	
	NSString *response = [[NSString alloc] initWithData:self.downloadedData encoding:NSUTF8StringEncoding];
	NSLog(@"Response:%@", response);
//	[response release];
		
	// call our delegate and tell it that our icon is ready for display
    [self _notifyDelegateOfCompletion];

}
#pragma mark Notify delegate methods
- (void)_notifyDelegateOfCompletion {
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];

    
	if(internalDelegate!=nil) {
		assert(internalDelegate!=nil);
		if([internalDelegate respondsToSelector:internalCompletedCallbackSelector])

			[internalDelegate performSelector:internalCompletedCallbackSelector withObject:self];
	}
}
- (void)_notifyDelegateOfAuthentication {
	if(internalDelegate!=nil) {
		assert(internalDelegate!=nil);
		if([internalDelegate respondsToSelector:internalAuthenticationCallbackSelector])
			[internalDelegate performSelector:internalAuthenticationCallbackSelector withObject:self];
	}
}
- (void)_notifyDelegateOfFailure {
    
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    
	if(internalDelegate!=nil) {
		assert(internalDelegate!=nil);
		if([internalDelegate respondsToSelector:internalFailedCallbackSelector])
			[internalDelegate performSelector:internalFailedCallbackSelector withObject:self];
	}
}

#pragma mark -
#pragma mark dealloc
//- (void)dealloc {
////	[username release];
////	[password release];
//	[connection cancel];
//	[connection release];
//	if(internalErrorMessage)[internalErrorMessage release];
//	if(internalRequest) [internalRequest release];
//	[downloadedData release];
//	[super dealloc];
//}
@end
