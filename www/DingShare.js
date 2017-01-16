// var argscheck = require('cordova/argscheck'),
//     exec = require('cordova/exec');

var exec = exec = require('cordova/exec');

var dingSharePlugin = {
    shareTextObject: function(success, error, parameter) {
                    exec(success, error, "dingtalk_ios", "shareTextObject", [parameter]);
                    // cordova.exec(success, error, "share", "shareTextObject", [parameter])
                },
    shareImageObject: function(success, error, parameter) {
                    exec(success, error, "dingtalk_ios", "shareImageObject", [parameter]);
                },
    shareWebObject: function(success, error, parameter) {
                    exec(success, error, "dingtalk_ios", "shareWebObject", [parameter]);
                },
    isDingTalkInstalled: function(success, error) {
                    exec(success, error, "dingtalk_ios", "isDingTalkInstalled", []);
                },
    isDingTalkSupportApi: function(success, error) {
                    exec(success, error, "dingtalk_ios", "isDingTalkSupportApi", []);
                },
    appStoreUrlOfDingTalk: function(success, error) {
                    exec(success, error, "dingtalk_ios", "appStoreUrlOfDingTalk", []);
                },
}

module.exports = dingSharePlugin;