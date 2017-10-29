//
//  CMFindDataProtocol.h
//  CaibeiMarket
//
//  Created by alibaba on 2017/10/29.
//  Copyright © 2017年 qianji. All rights reserved.
//

#ifndef CMFindDataProtocol_h
#define CMFindDataProtocol_h


@protocol CMFindDataProtocol <NSObject>

@optional
- (NSInteger)numberOfRowsInFloor;
- (id)floorModelAtIndex:(NSInteger)index;
- (CGFloat)heightForRowCell;

@property (nonatomic,strong)NSString * actionType;
@property (nonatomic,strong)NSString * title;
@property (nonatomic,strong)NSString * jumUrl;

@end

#endif /* CMFindDataProtocol_h */
