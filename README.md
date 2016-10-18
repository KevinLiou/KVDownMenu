# KVDownMenu

## 運行環境
Xcode 8.0
Swift 2.3


## 初始化KVDownMenu
以下方式取消了專案預設的頁面進入點，並在application:didFinishLaunchingWithOptions:launchOptions:自己初始化window與頁面。

並把第一個頁面替換成KVDownMenu，而KVDownMenu持有選單頁面與內容頁面(這兩個頁面請自行替換)。
```objc
func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let menuVC = mainStoryboard.instantiateViewControllerWithIdentifier("NavMenu") //選單頁面(你應該自己製作的頁面)
        let contentVC = mainStoryboard.instantiateViewControllerWithIdentifier("NavDetail") //內容頁面(你應該自己製作的頁面)
        
        let downMenu = KVDownMenu()
        downMenu.contentViewController = contentVC
        downMenu.menuViewController = menuVC
        
        //App啟動畫面設定為 downMenu。 這個menu會持有你的選單頁和內容頁面
        self.window = UIWindow(frame: UIScreen.mainScreen().bounds)
        self.window?.backgroundColor = UIColor.whiteColor()
        self.window?.rootViewController = downMenu
        self.window?.makeKeyAndVisible()
        
        
        //預設進入內容頁面
        //(非必要) 因為我的內容頁是空白，所以這裡呼叫顯示選單頁供選擇。
        contentVC.sideMenuViewController?.showMenu()//(非必要)
        
        return true
}
```


在選單頁面中，當使用者點選了某個選項，你可以呼叫以下方法替換內容頁面
```objc
self.sideMenuViewController?.changeContentViewControllerAndDismissMenu(vc_you_want_to_change)
```


在選單頁面中，如果要直接返回內容頁面，你可以呼叫
```objc
self.sideMenuViewController?.hideMenu()
```


當進入內容頁面後，你可以呼叫以下方法顯示選單
```objc
self.sideMenuViewController?.showMenu()
```


## Demo Video
[![Demo](http://img.youtube.com/vi/qCUTn2ZHYoM/0.jpg)](http://www.youtube.com/watch?v=qCUTn2ZHYoM)
