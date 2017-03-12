//
//  ViewController.m
//  动态计算高度
//
//  Created by JiaYuanFa on 2017/3/9.
//  Copyright © 2017年 JiaYuanFa. All rights reserved.
//

#import "ViewController.h"
#import "Masonry.h"
#import "JyfTableViewCell.h"
#import "JyfModel.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableView;

@property (nonatomic, strong) NSMutableArray<JyfModel*> *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    [self.view addSubview:self.tableView];
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    NSMutableArray *array = [NSMutableArray array];
    for (int i = 0; i<9; i++) {
        [array addObject:[NSString stringWithFormat:@"timg-%d.jpg",i]];
    }
    
    JyfModel *model1 = [[JyfModel alloc] init];
    model1.contentText = @"减肥的:洛杉";
    model1.imageArray = array;
    
    JyfModel *model2 = [[JyfModel alloc] init];
    model2.contentText = @"减肥的洛杉矶:福利局啊但是附近的来看撒娇了疯狂的萨克拉就分开了绝对是放假快乐的撒解放了会计师的考虑附近的快乐撒就立刻发酵fldkajlkads附近的开始了荆防颗粒的撒就立刻附近的快乐撒解放路口的撒娇风口浪尖的萨克拉减肥了卡萨就的离开放假了空间的萨拉解放了盛大附近的快乐撒件莱卡的设计费困了就睡打了飞机了盛大交付了健康的沙拉发送";
    model2.imageArray = array;

    
    JyfModel *model3 = [[JyfModel alloc] init];
    model3.contentText = @"减肥的洛杉矶福利局:啊但是附近的来看撒娇了疯狂的萨克拉就分开了绝";
    model3.imageArray = array;

    
    JyfModel *model4 = [[JyfModel alloc] init];
    model4.contentText = @"减肥的洛杉矶福利局啊但是附近的:来看撒娇了疯狂的萨克拉就分开了绝对是放假快乐的撒解放了会计师的考虑附近的快乐撒就立刻发酵就开了附近的撒拉开距离卡上的荆防颗粒的撒就发来看大神简历框架阿拉山口就分开了盛大交付了肯德基萨克拉数据库来房间啊荆防颗粒的撒就卢卡斯的交路口附近路口第三减肥的快乐撒娇可拉伸的荆防颗粒的撒就立刻附近的萨洛克放假了快速的健康路附近撒离开的姐夫拉克圣诞节福利都急死了房间爱离开谁打解放路的撒娇弗利萨的尽快立法荆防颗粒的撒就开了附近的卢萨卡荆防颗粒的撒就开发量减少大连科技";
    model4.imageArray = array;
    
    self.dataArray = [NSMutableArray array];
    [self.dataArray addObject:model1];
    [self.dataArray addObject:model2];
    [self.dataArray addObject:model3];
    [self.dataArray addObject:model4];
    [self.tableView reloadData]; 
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    JyfTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"jyfTableViewIdentifier"];
    JyfModel *model = self.dataArray[indexPath.row];
    cell.model = model;
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    JyfModel *model = self.dataArray[indexPath.row];
    
    // 计算文字高度
    CGRect rect = [model.contentText boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.view.frame)-120, MAXFLOAT)
                                                             options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                          attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    // 计算图片高度
    CGFloat height;
    if (model.imageArray.count) {
        switch (model.imageArray.count) {
            case 0:
                height = 0;
                break;
                
                case 1:
                height = 100;
                break;
                
                case 2:
                height = 80;
                break;
                
                case 3:
                height = 60;
                break;
                
                case 4:
                height = 60;
                break;
                
                case 5:
                height = 60;
                break;
                
                case 6:
                height = 60;
                break;
                
                case 7:
                height = 60;
                break;
                
                case 8:
                height = 60;
                break;
                
                case 9:
                height = (self.view.frame.size.width - 40) / 3;
                break;
                
            default:
                break;
        }
    }
    
    CGFloat imageAllHeight = (model.imageArray.count / 3) * height + (model.imageArray.count / 3 + 1) * 10;
    return rect.size.height + 60 + 365;
}

- (UITableView *)tableView{
    if (!_tableView) {
        _tableView = [[UITableView alloc] init];
        _tableView.delegate = self;
        _tableView.dataSource = self;
        [_tableView registerClass:[JyfTableViewCell class] forCellReuseIdentifier:@"jyfTableViewIdentifier"];
    }
    return _tableView;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
