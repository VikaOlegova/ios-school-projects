//
//  ViewController.m
//  Homework1
//
//  Created by Вика on 25/09/2019.
//  Copyright © 2019 Vika Olegova. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Задание 1.
    [self sortAndFilterNumbers];
    // Задание 2.
    [self filterStringsAndCreateDictionary];
}

/**
 Сортировка массива по возрастанию и убыванию + фильтрация массива.
 */
- (void)sortAndFilterNumbers
{
    NSMutableArray *arr = @[@3, @6, @32, @24, @81].mutableCopy;
    
    // 1. Отсортируйте этот массив по возрастанию.
    [arr sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2)
    {
        return [obj1 compare:obj2];
    }];
    NSLog(@"\nAscending sorted array: %@", arr);
    
    NSMutableArray *arrWithNumGreaterThanTwenty = [NSMutableArray new];
    NSMutableArray *arrWithMultipleOfThreeNum = [NSMutableArray new];
    
    for (NSNumber *num in arr)
    {
        NSInteger numInt = [num integerValue];
        
        // 2. Сделайте с помощью цикла массив, содержащий числа, большие чем 20.
        if (numInt > 20)
        {
            [arrWithNumGreaterThanTwenty addObject:@(numInt)];
        }
        
        // 3. Сделайте с помощью цикла массив, содержащий только кратные трём числа.
        if (numInt % 3 == 0)
        {
            [arrWithMultipleOfThreeNum addObject:@(numInt)];
        }
        
    }
    // 4. Добавьте этот массив в исходный.
    [arr addObjectsFromArray:arrWithMultipleOfThreeNum];
    
    // 5. Отсортируйте его по убыванию.
    [arr sortUsingComparator:^NSComparisonResult(id  _Nonnull obj1, id  _Nonnull obj2)
    {
        return [obj2 compare:obj1];
    }];
    
    NSLog(@"Descending sorted array: %@", arr);
}


/**
 Фильтрация массива строк и преобразование его в словарь.
 */
- (void)filterStringsAndCreateDictionary
{
    NSArray *arr = @[@"cataclism", @"catepillar", @"cat", @"teapot", @"truncate"];
    // 1. Отфильтруйте так, чтобы остались только строки с префиксом "cat".
    NSPredicate *predicate = [NSPredicate predicateWithBlock:^BOOL(NSString *evaluatedObject, NSDictionary<NSString *,id> * _Nullable bindings) {
        return [evaluatedObject hasPrefix:@"cat"];
    }];
    arr = [arr filteredArrayUsingPredicate:predicate];
    
    // 2. Полученный массив выведите в консоль.
    NSLog(@"Words with prefix cat: %@", arr);
    
    // 3. Сделайте из полученного массива словарь, содержащий пары слово - количество букв в нём.
    NSMutableDictionary *dic = [NSMutableDictionary new];
    for (NSString *str in arr)
    {
        dic[str] = @(str.length);
    }
    NSLog(@"Dictionary: %@", dic);
}


@end
