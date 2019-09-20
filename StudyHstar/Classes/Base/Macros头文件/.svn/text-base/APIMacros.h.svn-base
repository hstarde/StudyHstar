//
//  APIMacros.h
//  CarAppBuyers
//
//  Created by  on 15/6/15.
//  Copyright © 2015年 Copyright © 1998 - 2015 273.cn. All rights reserved.
//  服务端API接口的宏

#ifndef CarAppBuyers_APIMacros_h
#define CarAppBuyers_APIMacros_h

/**
 *  接口调试模式 0:正式 服务器     1:仿真  服务器
 */
#define DEBUGMODE 0

#if DEBUGMODE == 0

#define API_BASE_URL @"https://tyjx.fjii.com:8980/geyeapi/router/rest"
#define API_BASENEW_URL @"https://tyjx.fjii.com:8980/aivideoapi/router/rest"
#define API_IMGBASE_URL @"https://tyjx.fjii.com:8980/"
#define API_IMG_URL(imgurl) [ToolMan getIMG:imgurl]

#else

#define API_BASE_URL @"http://117.27.144.51:8081/geyeapi/router/rest"
#define API_BASENEW_URL @"https://tyjx.fjii.com:8980/aivideoapi/router/rest"
#define API_IMGBASE_URL @"https://tyjx.fjii.com:8980/"
#define API_IMG_URL(imgurl) [ToolMan getIMG:imgurl]

#endif

//智能视频云获取抓拍比对数据
#define API_getCameraZprl  @"AiVideoInterface/biCamera/getCameraZprl"


//登录
#define API_appLogin @"AiVideoInterface/verification/appLogin"
#define API_priority_login @"userGeyeAccount/priority_login"

//消息推送clientId关联接口
#define API_relateClientId @"AiVideoInterface/geyeAccount/relateClientId"
//消息推送clientId解除关联接口
#define API_unRelateClientId @"AiVideoInterface/geyeAccount/unRelateClientId"

//d我的设备
#define API_requeyGeyeList2 @"userGeyeAccount/requeyGeyeList2"
//获取全球眼帐号分析摄像头列表
#define API_requestGeyeList @"AiVideoInterface/geyeAccount/requestGeyeList"

#define API_requeyGeyeList @"geyeUser/requeyGeyeList"


//获取布控人员列表
#define API_biConsumer_pages @"AiVideoInterface/biConsumer/pages"
//添加/修改布控人员
#define API_biConsumer_add @"AiVideoInterface/biConsumer/add"
//删除布控人员
#define API_biConsumer_delete @"AiVideoInterface/biConsumer/delete"



//摄像头播放请求
#define API_play2 @"geye/play2"

//手机看店云台控制
#define API_sjkdPTZControl  @"userGeyeAccount/sjkdPTZControl"
//智能眼云台控制
#define API_cloudControl  @"tianyan/cloudControl"
//全球眼云台控制
#define API_qqyPTZControl  @"userGeyeAccount/qqyPTZControl"

//云台控制
#define API_ptz  @"device/ptz"

//智能眼平台--获取历史视频2，云端（返回列表）
#define API_getDeviceFilesTy @"tianyan/getDeviceFilesTy"
//智能眼平台--获取nvr历史视频列表2，前端（返回列表）
#define API_getLocationFiles @"tianyan/getLocationFiles"
//智能眼平台--获取nvr历史视频播放地址2，前端获取rtsp播放地址（返回列表）
#define API_getLocalFilePlay @"tianyan/getLocalFilePlay"

#define API_losepassword @"aaaavalidatecode/losepassword"
//反馈
#define API_publishFeedback @"userfeedback/publishFeedback"
//反馈列表
#define API_getUserFeedback @"userfeedback/getUserFeedback"
#define API_uploadImage [NSString stringWithFormat:@"%@", API_BASE_URL]
//图片上传
#define API_uploadHangyeGeyeImg @"userGeyeAccount/uploadHangyeGeyeImg"

//翼景象隐私保护指引
//#define API_privacyPolicy @"http://tyjx.fjii.com:8161/apphelp/privacy/privacyPolicy.html"
#define API_privacyPolicy @"http://tyjx.fjii.com:8161/apphelp/privacy/1.0.2/privacyPolicy.html"

//翼景象软件许可及服务协议
#define API_serviceProtocol @"http://tyjx.fjii.com:8161/apphelp/privacy/serviceProtocol.html"

/**
 *  通用分页查询最大数
 */
#define KAPI_PAGESIZE [NSNumber numberWithInt:10]
//com.ffcs.surfingscene.store
//com.ffcs.Shuanju
#endif
