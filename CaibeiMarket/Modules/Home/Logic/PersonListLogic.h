//
//  PersonListLogic.h
//  MiAiApp
//
//  Created by icaibei on 2017/7/14.
//  Copyright © 2017年 icaibei. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PersonListLogicDelegate <NSObject>
@optional
/**
 数据加载完成
 */
-(void)requestDataCompleted;

@end

@interface PersonListLogic : NSObject

@property (nonatomic,strong) NSMutableArray * dataArray;//数据源
@property (nonatomic,assign) NSInteger  page;//页码

@property(nonatomic,weak)id<PersonListLogicDelegate> delegagte;

/**
 拉取数据
 */
-(void)loadData;

@end
