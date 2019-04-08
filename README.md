# CDShareSheet
High copy WeChat sharing action sheet with Swift

![ScreenShot](https://github.com/ChardXu/CDShareSheet/blob/master/ScreenShot.png?raw=true)

When I looking for a Share component like Wechat wich use swift but I cannot find, so I create this component and welcome to point out mistakes.

```
pod 'CDShareSheet'
```

Please refer to the code below
```
// create items
let item00 = CDShareItem.cdinit(title: "发送给朋友", icon: "share_wechat_friends") {
print("发送给朋友")
}
let item01 = CDShareItem.cdinit(title: "分享到朋友圈", icon: "share_wechat_moments") {
print("分享到朋友圈")
}
let item02 = CDShareItem.cdinit(title: "收藏", icon: "share_wechat_favorites") {
print("收藏")
}

let item10 = CDShareItem.cdinit(title: "复制链接", icon: "func_copylink") {
print("复制链接")
}
let item11 = CDShareItem.cdinit(title: "刷新", icon: "func_refresh") {
print("刷新")
}

// part the items
let shareItems = [item00, item01, item02]
let functionItems = [item10, item11]

// create the sheet
let sheet = CDShareSheet.cdinit(shareItems: shareItems, functionItems: functionItems)

// show the sheet
sheet.show()
```
