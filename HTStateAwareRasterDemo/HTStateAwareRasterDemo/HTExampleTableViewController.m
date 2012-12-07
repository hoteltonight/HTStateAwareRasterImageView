//
//  HTExampleTableViewController.m
//  HTStateAwareRasterDemo
//
//  Created by Jacob Jennings on 12/6/12.
//  Copyright (c) 2012 HotelTonight. All rights reserved.
//

#import "HTExampleTableViewController.h"
#import "HTExampleTableCell.h"

static NSUInteger const kNumberOfRows = 128;

@interface HTExampleTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, readonly) UITableView *tableView;

@property (nonatomic, strong) NSArray *cornerRadii;
@property (nonatomic, strong) NSArray *rectCorners;

@end

@implementation HTExampleTableViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self generateRandomCellStates];
    }
    return self;
}

- (void)generateRandomCellStates
{
    NSArray *possibleCornerRadii = @[@6, @12, @18];
    
    UIRectCorner corners1 = UIRectCornerAllCorners;
    UIRectCorner corners2 = UIRectCornerTopLeft | UIRectCornerTopRight;
    UIRectCorner corners3 = UIRectCornerBottomLeft | UIRectCornerBottomRight;
    UIRectCorner corners4 = UIRectCornerTopRight | UIRectCornerBottomRight;
    UIRectCorner corners5 = UIRectCornerTopLeft | UIRectCornerBottomLeft;
    
    NSArray *possibleRectCorners = @[
    [NSValue value:&corners1 withObjCType:@encode(UIRectCorner)],
    [NSValue value:&corners2 withObjCType:@encode(UIRectCorner)],
    [NSValue value:&corners3 withObjCType:@encode(UIRectCorner)],
    [NSValue value:&corners4 withObjCType:@encode(UIRectCorner)],
    [NSValue value:&corners5 withObjCType:@encode(UIRectCorner)]];
    
    NSMutableArray *cornerRadiiMutable = [NSMutableArray arrayWithCapacity:kNumberOfRows];
    NSMutableArray *rectCornersMutable = [NSMutableArray arrayWithCapacity:kNumberOfRows];
    for (NSUInteger idx = 0; idx < kNumberOfRows; idx++)
    {
        [cornerRadiiMutable addObject:possibleCornerRadii[arc4random() % 3]];
        [rectCornersMutable addObject:possibleRectCorners[arc4random() % 5]];
    }
    self.rectCorners = [rectCornersMutable copy];
    self.cornerRadii = [cornerRadiiMutable copy];
}

- (void)loadView
{
    self.view = [[UITableView alloc] init];
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = [UIColor blackColor];
}

- (UITableView *)tableView
{
    return (UITableView *)self.view;
}

#pragma mark - UITableViewDataSource, Delegate

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return kNumberOfRows;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    HTExampleTableCell *cell = [tableView dequeueReusableCellWithIdentifier:HTExampleTableCellReuseIdentifier];
    if (!cell)
    {
        cell = [[HTExampleTableCell alloc] init];
    }
    
    UIRectCorner rectCorner;
    [self.rectCorners[indexPath.row] getValue:&rectCorner];
    
    cell.rasterizableComponent.roundedCorners = rectCorner;
    cell.rasterizableComponent.cornerRadius = [self.cornerRadii[indexPath.row] doubleValue];
    
    return cell;
}

@end
