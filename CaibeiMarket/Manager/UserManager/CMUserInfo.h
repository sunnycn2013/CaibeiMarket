//
//  UserInfo.h
//  MiAiApp
//
//  Created by icaibei on 2017/5/23.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import <Foundation/Foundation.h>
@class GameInfo;

typedef NS_ENUM(NSInteger,UserGender){
    UserGenderUnKnow = 0,
    UserGenderMale, //男
    UserGenderFemale //女
};

@interface CMUserInfo : NSObject

@property (nonatomic,copy) NSString * userName;//展示用的用户ID
@property (nonatomic,copy) NSString * passWord;//展示用的用户ID
@property (nonatomic,copy) NSString * photo;//头像
@property (nonatomic,copy) NSString * nickname;//昵称
@property (nonatomic, assign) UserGender sex;//性别
@property (nonatomic,copy) NSString * imId;//IM账号
@property (nonatomic,copy) NSString * imPass;//IM密码
@property (nonatomic,assign) NSInteger  degreeId;//用户等级
@property (nonatomic,copy) NSString * signature;//个性签名
@property (nonatomic,copy) NSString * token;//用户登录后分配的登录Token

@end
