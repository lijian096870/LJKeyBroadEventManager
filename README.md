# LJKeyBroadEventManager
IOS开发键盘上移的一个工具,实现方法独特,比较可靠.保持了键盘弹出的系统动画,使用控制器注册的方式使用而并非全局单例控制.简书地址:https://www.jianshu.com/p/31287e026f18

## Example

主要的LJKeyboardManagerDelegate协议方法如下：
```ruby
@protocol LJKeyboardManagerDelegate <NSObject>

@required
-(void)keyBroadOffset:(CGFloat)offset;

@optional

- (void)keyBroadOffset:(CGFloat)offset Responder:(UIView *)Responder;

- (void)keyBroadScrollOffset:(CGFloat)offset Responder:(UIView *)Responder;

-(CGFloat)TopSpacingToFirstResponder:(UIView*)Responder;

-(BOOL)ShowExtensionToolBar:(UIView*)Responder;

@end
 ```
![image](https://github.com/lijian096870/LJKeyBroadEventManager/blob/master/vl5qa-kejt5.gif)


## Requirements

可用于IOS8.0 Objective-c以及Swift项目

## Installation

LJKeyBroadEventManager is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'LJKeyBroadEventManager'
```

注册:
```ruby
registerKeyBroadResponder(self);
```
取消注册
```ruby
removeKeyBroadResponder(self);
```


## Author

lijian, 1358756992@qq.com

## License

LJKeyBroadEventManager is available under the MIT license. See the LICENSE file for more info.
