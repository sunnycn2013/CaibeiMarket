//
//  CMRubikDataProtocol.h
//  CaibeiMarket
//
//  Created by alibaba on 2017/7/27.
//  Copyright © 2017年 qianji. All rights reserved.
//

#ifndef CMRubikDataProtocol_h
#define CMRubikDataProtocol_h
#import <UIKit/UIKit.h>

@protocol CMRubikDataProtocol <NSObject>

- (NSString *)identifierAtIndexPath:(NSIndexPath *)indexPath;

- (id)dataForRowAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath;
@end

#endif /* CMRubikDataProtocol_h */
