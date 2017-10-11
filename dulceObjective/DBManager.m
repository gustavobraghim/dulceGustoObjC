//
//  DBManager.m
//  dulceObjective
//
//  Created by Gustavo Braghim on 10/10/17.
//  Copyright © 2017 Gustavo do Carmo Braghim. All rights reserved.
//

#import "DBManager.h"
#import "sqlite3.h"
#import "FMDatabase.h"
#import "Cafe.h"

@interface DBManager ()
@property (strong, nonatomic) Cafe *cafe;
@property (strong, nonatomic) FMDatabase *database;
@end

@implementation DBManager
@synthesize database;

-(instancetype)init{
    self = [super init];
    if(self){
        NSArray *docPaths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
        NSString *documentsDir = [docPaths objectAtIndex:0];
        NSString *dbPath = [documentsDir stringByAppendingPathComponent:@"Cafes.db"];
        self.database = [FMDatabase databaseWithPath:dbPath];
        [self.database open];
    }
    return self;
}

-(void)dealloc{
    [self.database close];
}

-(void) createTable{
      [self.database executeUpdate:@"create table if not exists cafes (id INTEGER PRIMARY KEY AUTOINCREMENT, name varchar(20), tracos int, numeroCapsulas int)"];
}

-(NSMutableArray<Cafe *> *)retrieveCafe{
    NSMutableArray<Cafe *> *cafes = [[NSMutableArray alloc] init];
    FMResultSet *results = [self.database executeQuery:@"select * from cafes;"];
    while([results next]) {
        Cafe *cafe = [[Cafe alloc] init];
        cafe.identificador = [results intForColumn:@"id"];
        cafe.name = [results stringForColumn:@"name"];
        cafe.tracos = [results intForColumn:@"tracos"];
        cafe.numeroCapsulas = [results intForColumn:@"numeroCapsulas"];
        [cafes addObject:cafe];
    }
    return cafes;
}

-(void) insertingData: (Cafe*) cafe{
    [self.database executeUpdate:@"insert into cafes (name, tracos, numeroCapsulas) values(?,?,?)", cafe.name, @(cafe.tracos), @(cafe.numeroCapsulas)];
}

-(void)deleteCafe: (Cafe*) cafe{
    [self.database beginTransaction];
    [self.database executeUpdate:@"DELETE FROM cafes WHERE id= ?", @(cafe.identificador)];
    [self.database commit];
}

//-(void) updateCafe{
//    Cafe *cafe = [[Cafe alloc] init];
//    [self.database executeUpdate:@"UPDATE cafes set name=? tracos=? numberCapsulas=?", cafe.name, cafe.tracos, cafe.numberCapsulas, nil];
//}

//- (NSArray *)findAllCafes
//{
//    NSMutableArray *cafes = [NSMutableArray array];
//    FMResultSet *resultSet = [self.database executeQuery:@"SELECT * from cafes ORDER BY name"];
//
//    while ([resultSet next]) {
//        Cafe *cafe = [[Cafe alloc]init];
//        cafe.name     = [resultSet stringForColumn:@"name"];
//        cafe.tracos = [resultSet intForColumn:@"tracos"];
//        cafe.numberCapsulas = [resultSet intForColumn:@"numberCapsulas"];
//        [cafes addObject:cafe];
//    }
//    return cafes;
//}
@end

