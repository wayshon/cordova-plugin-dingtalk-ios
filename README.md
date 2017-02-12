# cordova-plugin-dingtalk-ios

a plugin for cordova in ios platform to share something to DingTalk

# Feature

Share text, image, web

# Install

1. ```cordova plugin add cordova-plugin-dingtalk-ios --variable DINGTALK_APPID=YOUR_DingTalk_APPID```

2. ```cordova plugin add https://github.com/wayshon/cordova-plugin-dingtalk-ios.git  --variable DINGTALK_APPID=YOUR_DingTalk_APPID```

3. if your cordova version <5.1.1,check the URL Type using XCode

# Usage

## Check if DingTalk is installed
```Javascript
navigator.DingShare.isDingTalkInstalled(function (installed) {
    alert("DingTalk installed: " + (installed ? "Yes" : "No"));
}, function (reason) {
    alert("Failed: " + reason);
});
```

## Check if DingTalk is support open api
```Javascript
navigator.DingShare.isDingTalkSupportApi(function (installed) {
    alert("DingTalk isSupportApi: " + (installed ? "Yes" : "No"));
}, function (reason) {
    alert("Failed: " + reason);
});
```

## achieve the url of DingTalk in appStore
```Javascript
navigator.DingShare.appStoreUrlOfDingTalk(function (url) {
    alert(url);
}, function (reason) {
    alert("Failed: " + reason);
});
```

## Share Text
```Javascript
var msgObj = {
    text: "测试分享纯文本"
}
navigator.DingShare.shareTextObject(successcallback, errorcallback, msgObj);
```

## Share Image
```Javascript
var msgObj = {
    imageURL: "http://pic2.cxtuku.com/00/02/31/b945758fd74d.jpg"
}
navigator.DingShare.shareImageObject(successcallback, errorcallback, msgObj);
```

## Share Web
```Javascript
var msgObj = {
    title: "测试分享纯Web",
    pageURL: "https://www.baidu.com/",
    thumbURL: "http://pic2.cxtuku.com/00/02/31/b945758fd74d.jpg",
    messageDescription: "这是这个网页的描述文字"
}
navigator.DingShare.shareWebObject(successcallback, errorcallback, msgObj);
```
