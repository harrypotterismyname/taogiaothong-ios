//
//  DataParser.h
//  iMOE
//
//  Created by William (Van Thuong) on 9/27/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

@class FMDatabase;
@class FMResultSet;
@class Content;

@interface DataParser : NSObject {
    
}
+(BOOL)openDatabase;
//+(void)allocStoreListCategory:(NSMutableArray *)listCate AndCateType:(NSString *)cateType;
////+(void)allocStoreListCategory:(NSMutableArray *)listCate;
//+(NSMutableArray *)allocGetListCategoryByCate:(NSString *)cateID;
//#pragma mark category detail
//+(void)allocStoreCategory:(Content *)c;
//+(Content *)allocGetCategoryBy:(int )fatherId;
//
//+(void)allocStoreCategoryDetail:(Content *)c;
//+(Content *)allocGetCategoryDetailBy:(int )fatherId;
//+(void)allocUpdateCategoryDetail:(int )c;
//+(NSMutableArray *)allocGetListCategoryDetailByLiked;
@end
