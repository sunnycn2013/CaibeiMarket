//
//  CMHomeDataProtocol.h
//  CaibeiMarket
//
//  Created by icaibei on 2017/7/23.
//  Copyright © 2017年 qianji. All rights reserved.
//

#ifndef CMHomeDataProtocol_h
#define CMHomeDataProtocol_h

@protocol CMHomeDataProtocol <NSObject>

- (CGFloat)heightForRowCell;

@property (nonatomic,strong)NSString * actionType;

@end

#endif /* CMHomeDataProtocol_h */
