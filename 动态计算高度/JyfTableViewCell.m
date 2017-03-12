//
//  JyfTableViewCell.m
//  动态计算高度
//
//  Created by JiaYuanFa on 2017/3/9.
//  Copyright © 2017年 JiaYuanFa. All rights reserved.
//

#import "JyfTableViewCell.h"
#import "Masonry.h"

@interface JyfTableViewCell()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>

/**
 内容Label
 */
@property (nonatomic, strong) UILabel *contentLabel;

/**
 图片数组
 */
@property (nonatomic, strong) UICollectionView *imageCollectionView;

@end

@implementation JyfTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.backgroundColor = [UIColor grayColor];
        
        [self addSubview:self.contentLabel];
        [self addSubview:self.imageCollectionView];
        
        [self layoutViews];
    }
    return self;
}

- (void)layoutViews{
    
}

- (UILabel *)contentLabel{
    if (!_contentLabel) {
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.numberOfLines = 0;
    }
    return _contentLabel;
}

- (void)setModel:(JyfModel *)model{
    _model = model;
    
    
    NSMutableAttributedString *attrStr = [[NSMutableAttributedString alloc] initWithString:_model.contentText];
    
    // 取范围
    NSRange endRange = [_model.contentText rangeOfString:@":"];
    NSRange range = NSMakeRange(0, endRange.location+1);
    
    //设置字体和设置字体的范围
    [attrStr addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:30.0f] range:range];
    //添加文字颜色
    [attrStr addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:range];
    //添加文字背景颜色
    [attrStr addAttribute:NSBackgroundColorAttributeName value:[UIColor orangeColor] range:range];
    //添加下划线
    [attrStr addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:range];
    
    self.contentLabel.attributedText = attrStr;
    
    CGRect rect = [_model.contentText boundingRectWithSize:CGSizeMake(CGRectGetWidth(self.frame), MAXFLOAT)
                                                             options:NSStringDrawingUsesLineFragmentOrigin | NSStringDrawingUsesFontLeading
                                                          attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:17]} context:nil];
    [self.contentLabel mas_remakeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self).offset(20);
        make.top.equalTo(self).offset(20);
        make.right.equalTo(self).offset(-20);
        make.height.equalTo(@(rect.size.height + 20));
    }];
    
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
                height = 60;
                break;
                
            default:
                break;
        }
    }
    
    CGFloat imageAllHeight = (model.imageArray.count / 3 + 1) * height + (model.imageArray.count / 3 + 1) * 10;
    
    // layout collectionView
    [self.imageCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.contentLabel.mas_bottom).offset(20);
        make.left.right.equalTo(self.contentLabel);
        make.height.equalTo(@365);
    }];
    
    [self.imageCollectionView reloadData];
}



- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.model.imageArray.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"jyfCollectionCellIdentifier" forIndexPath:indexPath];
    for (UIView *subView in cell.subviews) {
        [subView removeFromSuperview];
    }
    UIImageView *imageView = [[UIImageView alloc] init];
    imageView.backgroundColor = [UIColor blueColor];
    [cell addSubview:imageView];
    [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(cell).insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    NSString *imageName = self.model.imageArray[indexPath.row];
    imageView.image = [UIImage imageNamed:imageName];
    return cell;
}

- (UICollectionView *)imageCollectionView{
    if (!_imageCollectionView) {
        UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
        layout.minimumLineSpacing = 10;
        layout.minimumInteritemSpacing = 10;
        _imageCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _imageCollectionView.delegate = self;
        _imageCollectionView.dataSource = self;
        _imageCollectionView.backgroundColor = [UIColor whiteColor];
        [_imageCollectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"jyfCollectionCellIdentifier"];
    }
    return _imageCollectionView;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    // 计算图片高度
    CGFloat height;
    if (self.model.imageArray.count) {
        switch (self.model.imageArray.count) {
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
                height = 115;
                break;
                
            default:
                break;
        }
    }
   
    return CGSizeMake(height, height);
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    UITableViewCell *cell = (UITableViewCell*)[collectionView cellForItemAtIndexPath:indexPath];
    [UIView animateWithDuration:0.3 animations:^{
        cell.transform = CGAffineTransformMakeScale(0.5, 0.5);
        cell.transform = CGAffineTransformMakeScale(1, 1);
    }];

    NSLog(@"图片名称为%@",self.model.imageArray[indexPath.row]);
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
