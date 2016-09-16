//
//  YHPFMDBTools.m
//  Demo
//
//  Created by YY on 16/8/22.
//  Copyright © 2016年 Yan. All rights reserved.
//

#import "YHPFMDBTools.h"

static FMDatabase *_db;

@implementation YHPFMDBTools

+ (void)initialize {
    [super initialize];
    
    //1.创建db
    NSString *filePath = [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:@"fmdb.db"];
    _db = [FMDatabase databaseWithPath:filePath];
    if ([_db open]) {
        NSLog(@"打开数据库成功");
    } else {
        NSLog(@"打开数据库失败");
        return;
    }
    //2.表 sql语句
    NSString *sql = @"create table if not exists t_product ('proID' integer primary key AUTOINCREMENT,'proName' text,'proPrice' integer)";

    if ([_db executeUpdate:sql]) {
        NSLog(@"creat success");
    } else {
        NSLog(@"creat fail");
    }
}

+ (void)insertProduct:(YHPFMDBModel *)model {
    
    NSString *sql = [NSString stringWithFormat:@"insert into t_product ('proName','proPrice') values ('%@','%d')",model.proName,model.proPrice];
    if ([_db executeUpdate:sql]) {
        NSLog(@"insert success");
    } else {
        NSLog(@"insert fail");
    }
}

+(void)deleteProductWithProID:(int)proID {

    NSString *sql = [NSString stringWithFormat:@"delete from t_product where proID = %d",proID];
    if ([_db executeUpdate:sql]) {
        NSLog(@"delete success");
    } else {
        NSLog(@"delete fail");
    }
}

+(void)updateProductWithModel:(YHPFMDBModel *)model proID:(int)proID{

    NSString *sql = [NSString stringWithFormat:@"update t_product set 'proName' = '%@' ,'proPrice' = %d where proID = %d",model.proName,model.proPrice,proID];
    if ([_db executeUpdate:sql]) {
        NSLog(@"update success");
    } else {
        NSLog(@"update fail");
    }
}

+(NSArray *)quertyAllProducts{
    
    NSMutableArray *mArray = [NSMutableArray array];
    NSString *sql = @"select * from t_product";
    FMResultSet *set = [_db executeQuery:sql];
    while ([set next]) {
        int proID = [set intForColumnIndex:0];
        NSString *proName = [set stringForColumnIndex:1];
        int proPrice = [set intForColumnIndex:2];
        NSLog(@"%d%@%d",proID,proName,proPrice);
        YHPFMDBModel *model = [YHPFMDBModel new];
        model.proID = proID;
        model.proName = proName;
        model.proPrice = proPrice;
        [mArray addObject:model];
    }
    return mArray.copy;
}

@end
