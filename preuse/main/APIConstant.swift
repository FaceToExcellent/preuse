//
//  APIConstant.swift
//  boringproject
//
//  Created by HYZ on 2018/2/7.
//  Copyright © 2018年 HYZ. All rights reserved.
//

import UIKit
//
//  APIConstant.h
//  xbiao
//
//  Created by zhuangzhe on 15/5/25.
//  Copyright (c) 2015年 腕表之家. All rights reserved.
//

//#ifndef xbiao_APIConstant_h
//#define xbiao_APIConstant_h
//
////列表字体
//#define LIST_FOUNT      @"STHeitiSC-Light"



let LIST_FOUNT:String = "STHeitiSC-Light"
//
//#define isIos7      ([[[UIDevice currentDevice] systemVersion] floatValue])

 func isIos7()->Float
 {
    return Float(UIDevice.current.systemVersion)!
 }
//
//#define RGBA(R/*红*/, G/*绿*/, B/*蓝*/, A/*透明*/) \
//[UIColor colorWithRed:R/255.f green:G/255.f blue:B/255.f alpha:A]

func RGBA(R:Float,G:Float,B:Float,A: Float) ->UIColor
{
    return UIColor.init(red: CGFloat(R), green: CGFloat(G), blue: CGFloat(B), alpha: CGFloat(A))
}
//
//#define CACHE_FILE_PATH(file)       [[NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSUserDomainMask, YES) lastObject] stringByAppendingPathComponent:file];
//

func CACHE_FILE_PATH(file:NSString) ->NSString {
    
    let docPath:NSString = NSSearchPathForDirectoriesInDomains(FileManager.SearchPathDirectory.documentDirectory, FileManager.SearchPathDomainMask.userDomainMask, true)[0] as NSString
    
    
    let filepath = docPath .appending(file as String) as NSString
    return filepath
        
    
}

//#pragma mark - 设备相关信息
//#define STATUSBAR_HEIGHT [[UIApplication sharedApplication] statusBarFrame].size.height

func STATUSBAR_HEIGHT()->CGFloat{
    return UIApplication.shared.statusBarFrame.size.height
}



//
//#define DEVICE_TOKEN_STRING         @"device_token_string"

let DEVICE_TOKEN_STRING:String = "device_token_string"

//#define SYSTEM_VERSION          [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
let infoDictionary = Bundle.main.infoDictionary!
let appDisplayName = infoDictionary["CFBundleDisplayName"] //程序名称
let SYSTEM_VERSION:NSString = infoDictionary["CFBundleShortVersionString"] as! NSString//主程序版本号
let minorVersion = infoDictionary["CFBundleVersion"]//版本号（内部标示）


//设备信息
let iosVersion = UIDevice.current.systemVersion //iOS版本
let systemName = UIDevice.current.systemName //设备名称
let model = UIDevice.current.model //设备型号
let localizedModel = UIDevice.current.localizedModel

////向量
//#define gIv          @"******************" //可以自行修改
let gIv:NSString = "******************"
////获取屏幕 宽度、高度
//#define SCREEN_WIDTH ([UIScreen mainScreen].bounds.size.width)
let SCREEN_WIDTH = UIScreen.main.bounds.size.width

//#define SCREEN_HEIGHT ([UIScreen mainScreen].bounds.size.height)
let SCREEN_HEIGHT = UIScreen.main.bounds.size.height
////设备型号
//#define DEVICE_TYPE                [[NSUserDefaults standardUserDefaults] objectForKey:@"DeviceType"]
let  DEVICE_TYPE:String =  UserDefaults.standard.object(forKey: "DeviceType") as! String
////设备分辨率
//#define DEVICE_SCREEN_SIZE          [[NSUserDefaults standardUserDefaults] objectForKey:@"ScreenSize"]
let  DEVICE_SCREEN_SIZE:String =  UserDefaults.standard.object(forKey: "ScreenSize") as! String
////主域名
//#define MAIN_URL                    @"http://japp.xbiao.com"

var MAIN_URL:NSString = "http://japp.xbiao.com"
////测试地址
////#define MAIN_URL1                    @"http://m.335i.com.cn"

let MAIN_URL1 = "http://m.335i.com.cn"
////最基础的URL
//#define ADDRESS_IP1                 @"" MAIN_URL"/apps/Jewelry/ios-Jewelry"

let  ADDRESS_IP1:NSString = MAIN_URL.appending("/apps/Jewelry/ios-Jewelry") as NSString


//#define SHORT_VERSION           [SYSTEM_VERSION stringByReplacingOccurrencesOfString:@"." withString:@"_"]

let   SHORT_VERSION = SYSTEM_VERSION .replacingOccurrences(of: ".", with: "_")

//
////完整的URL
//#define ADDRESS_IP(Url)              \
//[NSString stringWithFormat:@"%@-%@-%@-%@%@",ADDRESS_IP1,SHORT_VERSION,DEVICE_TYPE,DEVICE_SCREEN_SIZE,Url]


func ADDRESS_IP(Url:NSString) ->NSString{
    
    let returnstring:NSString = "".appendingFormat("%@-%@-%@-%@%@",ADDRESS_IP1 ,SHORT_VERSION,DEVICE_TYPE ,DEVICE_SCREEN_SIZE,Url)
    return returnstring
}

//
////获取公钥
//#define GETPUBLICKEY_URL            ADDRESS_IP(@"/user/publicKey")

let GETPUBLICKEY_URL = ADDRESS_IP(Url: "/user/publicKey")
//
//#pragma mark - ******* 第三方相关 *********
////新浪微博认证
//#define kWBSDKDemoAppKey            @"2687117001"
//#define kRedirectURI                @"https://api.weibo.com/oauth2/default.html"
//#define kSinaGetUserInfUrl          @"https://api.weibo.com/2/users/show.json"
//
//#define QQAPPID                     @"1105981251"
//
//#pragma mark - 启动广告欢迎界面
//#define WELCOME_URL                 ADDRESS_IP(@"/common/welcome/")
////程序启动时通知服务器
//#define COMMON_INITIALIZA_URL       ADDRESS_IP(@"/common/initializa/")
//#define INITIALIZA_METHOD(device,version,type)      \
//[NSString stringWithFormat:@"device=%@&version=%@&type=%@&PHPSESSID=",device,version,type]
//
//
//
////#pragma mark -********* 个人中心地址 **********
////#pragma mark - User
//////xbiao登录
////#define USER_LOGIN_URL              ADDRESS_IP(@"/user/login")
//////method
////#define USER_LOGIN_POST_METHOD(userName,passWrod,device)\
////[NSString stringWithFormat:@"username=%@&password=%@&device=%@&type=1&version=%@&PHPSESSID=",userName,passWrod,device,SYSTEM_VERSION]
////
//////三方登录
////#define USER_OTHERLOGIN_URL         ADDRESS_IP(@"/user/otherlogin")
//////微信获取state
//#define USER_WECHATGETSTATE_URL         ADDRESS_IP(@"/user/getWeixinState")
////
//
//////微信获取nicknName,openId(unionid唯一)
////#define USER_WECHAT_LOGIN_URL         ADDRESS_IP(@"/user/getWeixinUserInfo")
//////method
////#define USER_OTHERLOGIN_POST_METHOD(oauthId,fromSite,nickName,accessToken,device)        \
////[NSString stringWithFormat:@"oauth_id=%@&from_site=%@&nickname=%@&access_token=%@&device=%@&type=1&version=%@&PHPSESSID=",oauthId,fromSite,nickName,accessToken,device,SYSTEM_VERSION]
//
//////注册
////#define USER_REGISTER_URL           ADDRESS_IP(@"/user/register")
//////method
////#define USER_REGISTER_POST_METHOD(userName,email,passWord,device)\
////[NSString stringWithFormat:@"username=%@&email=%@&password=%@&device=%@&type=1&version=%@&PHPSESSID=",userName,email,passWord,device,SYSTEM_VERSION]
//
//////退出
////#define USER_LOGOUT_URL             ADDRESS_IP(@"/user/logout")
//////获取用户资料
////#define UPDATA_USERINFO_URL         ADDRESS_IP(@"/home/center/")
//////修改个人信息
////#define SET_USERINFO_URL            ADDRESS_IP(@"/home/set/")
//////推荐软件列表
////#define SOFTWARE_LIST_URL           ADDRESS_IP(@"/setting/software/identifier/xbiao")
//////建议反馈
////#define SETTING_ADVICE_URL          ADDRESS_IP(@"/setting/advice")
////#define ABOUT_US_URL                ADDRESS_IP(@"/setting/aboutus/")
//
//
//
//#pragma mark ---------- 【珠宝精选】 -----------
////1、精选文章列表
//#define SELECTION_ARTICLE_LIST_URL      ADDRESS_IP(@"/article/list")

let SELECTION_ARTICLE_LIST_URL:String = ADDRESS_IP(Url:"/article/list") as String
////2、精选焦点图
//#define SELECTION_ARTICLE_FOCUS_URL     ADDRESS_IP(@"/article/focus/")
let SELECTION_ARTICLE_FOCUS_URL = ADDRESS_IP(Url:"/article/focus/")
////3、文章详情web页
////参数： id 文章id
//#define SELECTION_ARTICLE_DETAIL_URL    ADDRESS_IP(@"/article/articleDetail")
////4、文章详情下半部分原生接口
////参数： id 文章id
//#define SELECTION_ARTICLE_INFO_URL      ADDRESS_IP(@"/article/articleInfo")
////5、文章收藏
//#define ARTICLE_FAVORITE_URL            ADDRESS_IP(@"/article/favorite")
////6、文章取消收藏
//#define ARTICLE_UNFAVORITE_URL          ADDRESS_IP(@"/article/unFavorite")
////7、文章赞接口
//#define ARTICLE_AGREE_URL               ADDRESS_IP(@"/article/agree")
////8、文章评论
//#define ARTICLE_ADDWEIBO_URL            ADDRESS_IP(@"/article/addweibo")
////8.1回复
//#define ARTICLE_ADDREPLY_URL            ADDRESS_IP(@"/article/addReply")
////8.2 赞评论
//#define ARTICLE_AGREE_WEIBO_URL         ADDRESS_IP(@"/article/agreeWeibo/wid")
////8.3 赞回复
//#define ARTICLE_AGREE_REPLY_URL         ADDRESS_IP(@"/article/agreeReply/cid")
//
////9、文章评论列表
//#define ARTICLE_WBLIST_URL              ADDRESS_IP(@"/article/wblist")
//// NEW  -2016年12月26日11:13:40
////10、作者信息文章列表
//#define AUTHOR_LIST_URL                 ADDRESS_IP(@"/article/authorArticles")
////11、文章标签
//#define ARTICLE_TAG_DETAIL_URL          ADDRESS_IP(@"/article/tagsArticles")
////12、文章大图
//#define INFO_HD_IMAGE_URL               ADDRESS_IP(@"/article/articleImages/id/")
//
//#pragma mark ---------- 【珠宝报价】 -----------
//
////1、珠宝报价页
//#define JEWELRY_PRODUCT_LIST_URL        ADDRESS_IP(@"/jewellery/watch")
let JEWELRY_PRODUCT_LIST_URL = ADDRESS_IP(Url:"/jewellery/watch")
////2、筛选条件 - 返回筛选条件项
//#define JEWELRY_SELECTOR_URL            ADDRESS_IP(@"/jewellery/selector")
let JEWELRY_SELECTOR_URL = ADDRESS_IP(Url:"/jewellery/selector")
////3、筛选统计数 - 返回筛选结果数量
//#define JEWELRY_SELECTOR_SEARCH_URL     ADDRESS_IP(@"/jewellery/search/")
let JEWELRY_SELECTOR_SEARCH_URL = ADDRESS_IP(Url:"/jewellery/search/")
////4.产品-产品页原生接口
//#define PRODUCT_DETAIL_URL              ADDRESS_IP(@"/products/productDetail")
let PRODUCT_DETAIL_URL = ADDRESS_IP(Url:"/products/productDetail")
////5.产品-系列页
//#define BRAND_BRANDINTRO_URL            ADDRESS_IP(@"/brand/brandIntro")
////6.产品-产品图片列表
//#define PRODUCT_IMAGES_URL              ADDRESS_IP(@"/products/productImages")
////7.产品-产品收藏
//#define PRODUCT_FAVORITE_URL            ADDRESS_IP(@"/products/favorite")
////8.产品-产品取消收藏
//#define PRODUCT_UNFAVORITE_URL          ADDRESS_IP(@"/products/unFavorite")
////9.产品-产品赞接口
//#define PRODUCT_AGREE_URL               ADDRESS_IP(@"/products/agree")
////10.产品-评论接口
//#define PRODUCT_ADDWEIBO_URL            ADDRESS_IP(@"/products/addweibo")
////10.1产品回复
//#define PRODUCT_ADDREPLY_URL            ADDRESS_IP(@"/products/addreply")
////10.2 赞评论
//#define PRODUCT_AGREE_WEIBO_URL         ADDRESS_IP(@"/products/agreeWeibo/wid")
////10.3 赞回复
//#define PRODUCT_AGREE_REPLY_URL         ADDRESS_IP(@"/products/agreeReply/cid")
//
////11.产品-评论列表
//#define PRODUCT_WBLIST_URL              ADDRESS_IP(@"/products/wblist")
//// ----------upData
////1.产品-精选
//#define PRODUCT_SELECTED_URL            ADDRESS_IP(@"/jewellery/recommend")
////2.产品列表-顶部筛选条件
//#define PRODUCT_LIST_XTAGS_URL    ADDRESS_IP(@"/jewellery/xTags")
////2.1 -品牌
//#define PRODUCT_LIST_BRAND_ORDER_URL    ADDRESS_IP(@"/jewellery/xSeries")
////2.2 -热门
//#define PRODUCT_LIST_HOT_ORDER_URL      ADDRESS_IP(@"/jewellery/xTypes")
////2.2 -分类
//#define PRODUCT_LIST_CATE_ORDER_URL     ADDRESS_IP(@"/jewellery/xCategory")
//
//
//
//
//
//#pragma mark ---------- 【 视 频 】 -----------
//
////1、视频列表 web
//#define VIDEO_LIST_URL                  ADDRESS_IP(@"/video/list/")
let VIDEO_LIST_URL = ADDRESS_IP(Url:"/video/list/")
//
//
//#pragma mark ---------- 【个人中心】 -----------
///**
// * 1、登录
// * post参数：
// * phone:手机号或昵称
// * password：密码
// * 返回：（-1失败消息 1成功登陆）
// */
//#define USER_LOGIN_URL                  ADDRESS_IP(@"/user/login/")
///**
// * 2、三方登录
// * post参数：
// * post参数：
// * qq_oauth : qq授权openid
// * qq_token：qq的token值
// * wx_oauth : 微信授权openid
// * wx_token：微信的token值
// * wb_oauth : 微博授权openid
// * wb_token：微博的token值
// 上面传递其中一组就行（不明白的就问）
// ios_device：iso的设备号
//
// * 返回：（-1失败消息 1成功登陆 -2未注册用户)
// */
//#define USER_OTHER_LOGIN_URL            ADDRESS_IP(@"/user/otherLogin/")
//
//// 3 注册
//
//// 3.1 验证手机号是否有效  GET /user/send/phone/15012329245/
//#define USER_REG_SEND_URL               ADDRESS_IP(@"/user/send")
//
//// 3.2 手机验证码验证  GET  /user/validate/phone/15012329245/code/3422/
//#define USER_REG_VALIDATE_URL           ADDRESS_IP(@"/user/validate")
//
//// 3.3 验证昵称性别  GET  /user/checkName/nickname/zongzong08/
//#define USER_REG_CHECKNAME_URL          ADDRESS_IP(@"/user/checkName")
//
//// 3.4 填写密码提交 POST
////  phone : 手机号
////  code : 手机验证码
////  nickname : 用户名昵称
////  gender：0默认 1男 2女
////  password: 密码
////  ios_device：iso的设备号
//#define USER_REG_URL                    ADDRESS_IP(@"/user/reg")
//
//// 4 三方注册
//
//// 4.1 填写昵称验证 USER_REG_CHECKNAME_URL
//
//// 4.2 填写手机号，发送短信接口
//#define USER_REG_OTHERSEND_URL          ADDRESS_IP(@"/user/otherSend")
//
//// 4.3 填写验证码，提交接口
//// 参数：
//// phone : 手机号
//// code : 手机验证码
//// nickname : 用户名昵称
//// gender：0默认 1男 2女
//// ios_device：iso的设备号
//// qq_oauth : qq授权openid
//// qq_token：qq的token值
//// wx_oauth : 微信授权openid
//// wx_token：微信的token值
//// wb_oauth : 微博授权openid
//// wb_token：微博的token值
//#define USER_REG_OTHERREG_URL           ADDRESS_IP(@"/user/otherReg")
//
//// 5 退出登录
//#define USER_LOGOUT_URL                 ADDRESS_IP(@"/user/loginOut")
//
//// 6 找回密码
//
//// 6.1 填写手机号 GET  /user/getPwd/phone/15011320298/
//#define USER_GETPWD_URL                 ADDRESS_IP(@"/user/getPwd")
//
//// 6.2 验证码 USER_REG_VALIDATE_URL
//
//// 6.3 填写新密码，提交接口 POST
//// post参数：
//// phone:手机号
//// code：验证码
//// password:密码
//#define USER_SETPWD_URL                 ADDRESS_IP(@"/user/setPwd")
////微信获取state
//#define USER_WECHATGETSTATE_URL         ADDRESS_IP(@"/user/getWeixinState")
//////微信获取nicknName,openId(unionid唯一)
//#define USER_WECHAT_LOGIN_URL           ADDRESS_IP(@"/user/getWeixinUserInfo")
//
//#pragma  makr --------用户 --------
//
////1.用户-个人中心
//#define USER_HOME_CENTER_URL            ADDRESS_IP(@"/home/center")
////2.用户-其他人的个人中心  GET  uid
//#define USER_HOME_OTHER_URL             ADDRESS_IP(@"/home/otherCenter")
//
////3.修改信息+头像
////  post参数：
////  nickname：用户昵称
////  gender： 1男2女
////  address： 地址
////  birthday ：生日 格式2019-02-09
////  email：邮箱
////  头像参数pic  文件格式
//#define USER_HOME_SETINFO_URL           ADDRESS_IP(@"/home/setInfo/")
//
////4.用户-私信隐私设置列表：
//#define USER_HOME_PRIVACY_URL           ADDRESS_IP(@"/home/privacy/")
////5.用户-修改私信隐私设置： GET /home/setPrivacy/privacy/1/
//#define USER_HOME_SETPRIVACY_URL        ADDRESS_IP(@"/home/setPrivacy")
////6.用户-夜间防打扰设置： GET disturb=1开启防打扰 0关闭
//#define USER_HOME_SETDICTURB_URL        ADDRESS_IP(@"/home/setDisturb")
////7.用户-我收藏产品列表： GET /page/1
//#define USER_HOME_FAV_PRODUCTS_URL      ADDRESS_IP(@"/home/favoriteProducts")
////8.用户-我收藏文章列表：
//#define USER_HOME_FAV_ARTICLES_URL      ADDRESS_IP(@"/home/favoriteArticles")
////9.用户-意见反馈：
////  post参数：
////  content：内容
////  version：版本
////  devices：设备
//#define USER_HOME_FEEDBACK_URL          ADDRESS_IP(@"/home/feedback/")
////10 私信列表
//#define USER_LETTER_LIST_URL            ADDRESS_IP(@"/letter/letterList")
////11 私信
//#define USER_LETTER_URL                 ADDRESS_IP(@"/letter/letterInfo")
////11.2
//#define USER_LETTER_SEND_URL            ADDRESS_IP(@"/letter/addLetter")
////11.3
//#define USER_LETTER_DEL_URL             ADDRESS_IP(@"/letter/delLetter")
////11.4
//#define USER_LETTER_LIST_DEL_URL        ADDRESS_IP(@"/letter/delLetterList")
//
////12 关于我们
//#define USER_HOME_ABOUTUS_URL           ADDRESS_IP(@"/home/aboutUs")
////13 系统消息
//#define USER_HOME_SYSMSG_URL            ADDRESS_IP(@"/home/noticeList")
////14 全部已读
//#define USER_HOME_SYSMSG_CLEAR_URL      ADDRESS_IP(@"/home/noticeClear/")
//
////关注
////1、我的粉丝
//#define USER_FANS_LIST_URL              ADDRESS_IP(@"/follow/fansList")
////2、我的关注
//#define USER_FOLLOW_LIST_URL            ADDRESS_IP(@"/follow/followList")
////3、他人粉丝
//#define USER_OTHER_FANS_LIST_URL        ADDRESS_IP(@"/follow/otherFansList")
////4、他人粉丝
//#define USER_OTHER_FOLLOW_LIST_URL      ADDRESS_IP(@"/follow/otherFollowList")
////5、关注
//#define USER_FOLLOW_URL                 ADDRESS_IP(@"/follow/follow")
////6、取消关注
//#define USER_UNFOLLOW_URL               ADDRESS_IP(@"/follow/unFollow")
////
//
//
//
//#pragma mark - - - 论坛 - - - -
//
////帖子收藏
//#define BBS_FAV_THREAD_LIST_URL          ADDRESS_IP(@"/home/favoriteThreads")
////帖子列表
//#define BBS_LIST_URL                     ADDRESS_IP(@"/bbs/list")
let BBS_LIST_URL =  ADDRESS_IP(Url: "/bbs/list")
////发帖
//#define BBS_POST_ADD_URL                 ADDRESS_IP(@"/bbs/post/")
////回帖
//#define BBS_POST_REPLY_URL              ADDRESS_IP(@"/bbs/reply/")
////帖子类型
//#define BBS_THREAD_TYPE_URL             ADDRESS_IP(@"/bbs/threadType/")
////帖子详情-web
//#define BBS_THREAD_DETAIL_URL           ADDRESS_IP(@"/bbs/thread")
////帖子详情-json  //see_lz：1只看楼主 默认0
//#define BBS_THREAD_INFO_URL             ADDRESS_IP(@"/bbs/threadInfo")
//#define BBS_NOTICE_GOTOPAGE_URL         ADDRESS_IP(@"/bbs/gotoPage")
////
////我的主贴
//#define BBS_MY_THREAD_LIST_URL          ADDRESS_IP(@"/home/myThread")
////我的回帖
//#define BBS_MY_REPLY_LIST_URL           ADDRESS_IP(@"/home/myPost")
////帖子大图
//#define BBS_HD_IMAGE_URL                ADDRESS_IP(@"/bbs/threadImages")
////帖子收藏
//#define MY_POSTS_CONLLECT_URL           ADDRESS_IP(@"/bbs/collect/")
////帖子取消收藏
//#define MY_POSTS_UNCOLLECT_URL          ADDRESS_IP(@"/bbs/unCollect/")
//
//
//
//
////分享
////@param:type type：1珠宝文章 2珠宝 3帖子 4品牌
////@param:share 分享平台 weibo,weixin,pengyou,qq,qzone,duanxin,email
//#define SHARE                           ADDRESS_IP(@"/user/shareContent")
//
//
//#endif
//

class APIConstant: NSObject {

}
