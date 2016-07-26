//
//  UserInfoAlertView.m
//  自定义弹出框
//
//  Created by 遇见远洋 on 16/7/18.
//  Copyright © 2016年 遇见远洋. All rights reserved.
//

#import "UserInfoAlertView.h"
#import "Masonry.h"

#define SCREENWIDTH [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height

@interface UserInfoAlertView ()

@property (strong,nonatomic) UIButton * reportBtn;/**<举报按钮*/
@property (strong,nonatomic) UIButton * closeBtn;/**<关闭弹窗按钮*/
@property (strong,nonatomic) UIImageView * headImageView;/**<用户头像*/
@property (strong,nonatomic) UILabel * userName;/**<用户名*/
@property (strong,nonatomic) UIImageView * userGender;/**<用户性别*/
@property (strong,nonatomic) UILabel * userID;/**<用户ID*/
@property (strong,nonatomic) UIButton * userLocation;/**<用户地理位置*/
@property (strong,nonatomic) UILabel * giftCount;/**<送出的礼物总数*/
@property (strong,nonatomic) UILabel *  followerCount;/**<用户的粉丝数量*/
@property (strong,nonatomic) UILabel * concernCount;/**<关注的用户数量*/
@property (strong,nonatomic) UIButton * concernOrNo;/**<关注或者取消关注按钮*/

@end

@implementation UserInfoAlertView

- (instancetype)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        [self setupUI];
    }
    return self;
}



- (void)setupUI {
    //举报
    [self.reportBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(self).offset(10);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(35);
    }];
    
    //关闭
    [self.closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(10);
        make.right.mas_equalTo(-10);
        make.width.height.mas_equalTo(25);
    }];
    
    //用户头像
    [self.headImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.closeBtn.mas_bottom).offset(5);
        make.width.height.mas_equalTo(55);
    }];
    
    
    //用户昵称
    [self.userName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self.headImageView);
        make.top.mas_equalTo(self.headImageView.mas_bottom).offset(10);
    }];
    
    //用户性别
    [self.userGender mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.userName.mas_trailing).offset(10);
        make.width.height.mas_equalTo(22);
        make.centerY.mas_equalTo(self.userName);
    }];
    
    //用户ID
    [self.userID mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self.userName.mas_bottom).offset(10);
        make.leading.mas_equalTo(self).offset(50);
    }];
    
    //用户地理位置
    [self.userLocation mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.userID.mas_trailing).offset(10);
        make.centerY.mas_equalTo(self.userID);
        make.width.mas_equalTo(150);
        make.height.mas_equalTo(35);
    }];
    
    //送出礼物数
    [self.giftCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(self);
        make.top.mas_equalTo(self.userID.mas_bottom).offset(10);
    }];
    
    
    //关注或取消关注按钮
    [self.concernOrNo mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(self).offset(-10);
        make.centerX.mas_equalTo(self);
        make.height.mas_equalTo(35);
        make.leading.mas_equalTo(self).offset(20);
        make.trailing.mas_equalTo(self).offset(-20);
    }];
    
    
    //粉丝数
    [self.followerCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(self.userID);
        make.bottom.mas_equalTo(self.concernOrNo.mas_top).offset(-10);
    }];
    
    
    //关注别人的数量
    [self.concernCount mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(self.followerCount);
        make.trailing.mas_equalTo(self.mas_trailing).offset(-50);
    }];
    
}


#pragma mark - ******懒加载部分******
//举报按钮
- (UIButton *)reportBtn {
    if (!_reportBtn) {
        _reportBtn = [[UIButton alloc]init];
        [_reportBtn setTitle:@"举报" forState:UIControlStateNormal];
        _reportBtn.titleLabel.font = [UIFont systemFontOfSize:13];
        [_reportBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_reportBtn setImage:[UIImage imageNamed:@"nansheng"] forState:UIControlStateNormal];
        _reportBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 3, 0, -3);
        _reportBtn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self addSubview:_reportBtn];
    }
    return _reportBtn;
}


//关闭按钮
- (UIButton *)closeBtn {
    if (!_closeBtn) {
        _closeBtn = [[UIButton alloc]init];
        [_closeBtn setImage:[UIImage imageNamed:@"btn_close_normal"] forState:UIControlStateNormal];
        [self addSubview:_closeBtn];
    }
    return _closeBtn;
}


//用户头像
- (UIImageView *)headImageView {
    if (!_headImageView) {
        _headImageView = [[UIImageView alloc]init];
        _headImageView.image = [UIImage imageNamed:@"userDefault"];
        [self addSubview:_headImageView];
    }
    return _headImageView;
}

//用户名
- (UILabel *)userName {
    if (!_userName) {
        _userName  = [[UILabel alloc]init];
        _userName.text = @"COME ON BABY!";
        [self addSubview:_userName];
    }
    return _userName;
}

//用户性别
- (UIImageView *)userGender {
    if (!_userGender) {
        _userGender = [[UIImageView alloc]init];
        _userGender.image = [UIImage imageNamed:@"nansheng"];
        [self addSubview:_userGender];

    }
    return _userGender;
}

//用户ID
- (UILabel *)userID {
    if (!_userID) {
        _userID = [[UILabel alloc]init];
        [_userID sizeToFit];
        _userID.font = [UIFont systemFontOfSize:12];
        _userID.text = [NSString stringWithFormat:@"ID:%d",100450400];
        [self addSubview:_userID];

    }
    return _userID;
}

//用户地理位置
- (UIButton *)userLocation {
    if (!_userLocation) {
        _userLocation = [[UIButton alloc]init];
        _userLocation.titleLabel.font = [UIFont systemFontOfSize:12];

        [_userLocation setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_userLocation setImage:[UIImage imageNamed:@"nvsheng"] forState:UIControlStateNormal];
        [_userLocation setTitle:@"北京市" forState:UIControlStateNormal];
        _userLocation.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
        [self addSubview:_userLocation];

    }
    return _userLocation;
}

//送出礼物
- (UILabel *)giftCount {
    if (!_giftCount) {
        _giftCount = [[UILabel alloc]init];
        _giftCount.textColor = [UIColor redColor];
        _giftCount.text = [NSString stringWithFormat:@"送出:%d❿",10000];
        _giftCount.font = [UIFont systemFontOfSize:14];
        [self addSubview:_giftCount];
    }
    return _giftCount;
}


//粉丝数量
- (UILabel *)followerCount {
    if (!_followerCount) {
        _followerCount = [[UILabel alloc]init];
        _followerCount.text = [NSString stringWithFormat:@"%d+\r\n粉丝数",999];
        _followerCount.numberOfLines = 0;
        _followerCount.textAlignment = NSTextAlignmentCenter;
        _followerCount.font = [UIFont systemFontOfSize:13];
        [self addSubview:_followerCount];

    }
    return _followerCount;
}

//关注用户数量
- (UILabel *)concernCount {
    if (!_concernCount) {
        _concernCount = [[UILabel alloc]init];
        _concernCount.text = [NSString stringWithFormat:@"%d+\r\n正在关注",100];
        _concernCount.textAlignment = NSTextAlignmentCenter;
        _concernCount.numberOfLines = 0;
        _concernCount.font = [UIFont systemFontOfSize:13];
        [self addSubview:_concernCount];

    }
    return _concernCount;
}

//关注或者取消关注按钮
- (UIButton *)concernOrNo {
    if (!_concernOrNo) {
        _concernOrNo = [[UIButton alloc]init];
        [_concernOrNo setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        _concernOrNo.backgroundColor = [UIColor redColor];
        [_concernOrNo setTitle:@"关注" forState:UIControlStateNormal];
        _concernOrNo.layer.cornerRadius = 18;
        _concernOrNo.layer.masksToBounds = YES;
        [self addSubview:_concernOrNo];

    }
    return _concernOrNo;
}
@end
