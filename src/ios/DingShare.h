//
//  DingShare.h
//  HelloCordova
//
//  Created by 王旭 on 2017/1/14.
//
//

#import <Cordova/CDV.h>
#import <DTShareKit/DTOpenKit.h>

@interface DingShare : CDVPlugin <DTOpenAPIDelegate>

@property (nonatomic, strong) NSString *appId;

//是否已安装钉钉
- (void)isDingTalkInstalled:(CDVInvokedUrlCommand *)command;

//安装的钉钉是否支持 openapi
- (void)isDingTalkSupportApi:(CDVInvokedUrlCommand *)command;

- (void)appStoreUrlOfDingTalk:(CDVInvokedUrlCommand *)command;

//纯文本数据
- (void)shareTextObject:(CDVInvokedUrlCommand*)command;

//纯图片数据
- (void)shareImageObject:(CDVInvokedUrlCommand*)command;

//Web页面数据
- (void)shareWebObject:(CDVInvokedUrlCommand*)command;

@end
