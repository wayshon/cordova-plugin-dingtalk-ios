//
//  DingShare.m
//  HelloCordova
//
//  Created by 王旭 on 2017/1/14.
//
//

#import "DingShare.h"
#import <Cordova/CDV.h>

@implementation DingShare

- (void)pluginInitialize {
    self.appId = [[self.commandDelegate settings] objectForKey:@"dingtalk_appid"];
    [DTOpenAPI registerApp:self.appId];
}

- (void)isDingTalkInstalled:(CDVInvokedUrlCommand *)command {
    CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:[DTOpenAPI isDingTalkInstalled]];
    
    [self.commandDelegate sendPluginResult:commandResult callbackId:command.callbackId];
}

- (void)isDingTalkSupportApi:(CDVInvokedUrlCommand *)command {
    CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:[DTOpenAPI isDingTalkSupportOpenAPI]];
    
    [self.commandDelegate sendPluginResult:commandResult callbackId:command.callbackId];
}

- (void)appStoreUrlOfDingTalk:(CDVInvokedUrlCommand *)command {
    CDVPluginResult *commandResult = [CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsString:[DTOpenAPI appStoreURLOfDingTalk]];
    
    [self.commandDelegate sendPluginResult:commandResult callbackId:command.callbackId];
}

- (void)shareTextObject:(CDVInvokedUrlCommand *)command{
    NSString *callBackID = command.callbackId;
    CDVPluginResult *result = nil;

    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:[command.arguments objectAtIndex:0]];
    
    
    NSString *text = [dic objectForKey:@"text"];
    
    DTSendMessageToDingTalkReq *sendMessageReq = [[DTSendMessageToDingTalkReq alloc] init];
    
    DTMediaMessage *mediaMessage = [[DTMediaMessage alloc] init];
    
    DTMediaTextObject *textObject = [[DTMediaTextObject alloc] init];
    textObject.text = text;
    
    mediaMessage.mediaObject = textObject;
    sendMessageReq.message = mediaMessage;
    
    BOOL resultSend = [DTOpenAPI sendReq:sendMessageReq];
    if (resultSend)
    {
        NSLog(@"Text 发送成功.");
        result = [CDVPluginResult resultWithStatus:(CDVCommandStatus_OK) messageAsString:@"Text 发送成功."];
    }
    else
    {
        NSLog(@"Text 发送失败.");
        result = [CDVPluginResult resultWithStatus:(CDVCommandStatus_ERROR) messageAsString:@"Text 发送失败."];
    }
    [self.commandDelegate sendPluginResult:result callbackId:callBackID];
}

- (void)shareImageObject:(CDVInvokedUrlCommand *)command {
    
    NSString *callBackID = command.callbackId;
    CDVPluginResult *result = nil;

    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:[command.arguments objectAtIndex:0]];
    
    NSString *imageURL = [dic objectForKey:@"imageURL"];
    
    DTSendMessageToDingTalkReq *sendMessageReq = [[DTSendMessageToDingTalkReq alloc] init];
    
    DTMediaMessage *mediaMessage = [[DTMediaMessage alloc] init];
    
    DTMediaImageObject *imageObject = [[DTMediaImageObject alloc] init];
    imageObject.imageData = [NSData data];
    imageObject.imageURL = imageURL;
    
    mediaMessage.mediaObject = imageObject;
    sendMessageReq.message = mediaMessage;
    
    BOOL resultSend = [DTOpenAPI sendReq:sendMessageReq];
    if (resultSend)
    {
        NSLog(@"Image 发送成功.");
        result = [CDVPluginResult resultWithStatus:(CDVCommandStatus_OK) messageAsString:@"Image 发送成功."];
    }
    else
    {
        NSLog(@"Image 发送失败.");
        result = [CDVPluginResult resultWithStatus:(CDVCommandStatus_ERROR) messageAsString:@"Image 发送失败."];
    }
    [self.commandDelegate sendPluginResult:result callbackId:callBackID];
}

-(void)shareWebObject:(CDVInvokedUrlCommand *)command {
    
    NSString *callBackID = command.callbackId;
    CDVPluginResult *result = nil;

    NSDictionary *dic = [NSDictionary dictionaryWithDictionary:[command.arguments objectAtIndex:0]];
    
    
    NSString *title = [dic objectForKey:@"title"];
    NSString *pageURL = [dic objectForKey:@"pageURL"];
    NSString *thumbURL = [dic objectForKey:@"thumbURL"];
    NSString *messageDescription = [dic objectForKey:@"messageDescription"];
    
    DTSendMessageToDingTalkReq *sendMessageReq = [[DTSendMessageToDingTalkReq alloc] init];
    
    DTMediaMessage *mediaMessage = [[DTMediaMessage alloc] init];
    DTMediaWebObject *webObject = [[DTMediaWebObject alloc] init];
    webObject.pageURL = pageURL;
    
    mediaMessage.title = title;
    
    mediaMessage.thumbURL = thumbURL;
    
    // Or Set a image data which less than 32K.
    // mediaMessage.thumbData = UIImagePNGRepresentation([UIImage imageNamed:@"open_icon"]);
    
    mediaMessage.messageDescription = messageDescription;
    mediaMessage.mediaObject = webObject;
    sendMessageReq.message = mediaMessage;
    
    BOOL resultSend = [DTOpenAPI sendReq:sendMessageReq];
    if (resultSend)
    {
        NSLog(@"Web 发送成功.");
        result = [CDVPluginResult resultWithStatus:(CDVCommandStatus_OK) messageAsString:@"Web 发送成功."];
    }
    else
    {
        NSLog(@"Web 发送失败.");
        result = [CDVPluginResult resultWithStatus:(CDVCommandStatus_ERROR) messageAsString:@"Web 发送失败."];
    }
    [self.commandDelegate sendPluginResult:result callbackId:callBackID];
}

@end
