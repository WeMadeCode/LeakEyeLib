# LeakEyeLib

[![CI Status](https://img.shields.io/travis/zhouxiang/LeakEyeLib.svg?style=flat)](https://travis-ci.org/zhouxiang/LeakEyeLib)
[![Version](https://img.shields.io/cocoapods/v/LeakEyeLib.svg?style=flat)](https://cocoapods.org/pods/LeakEyeLib)
[![License](https://img.shields.io/cocoapods/l/LeakEyeLib.svg?style=flat)](https://cocoapods.org/pods/LeakEyeLib)
[![Platform](https://img.shields.io/cocoapods/p/LeakEyeLib.svg?style=flat)](https://cocoapods.org/pods/LeakEyeLib)

## 例子

下载本仓库，在Example文件夹中有Demo工程，可以直接运行检查效果。


## 需要

最低支持iOS10

## 安装

通过cocoapods可以直接安装

```ruby
pod 'LeakEyeLib'
```

## 使用
第一步：导入框架

```swift
import LeakEyeLib
```

第二步：声明实例属性

```swift
var eye = LeakEye()
```

第三步：开启监听器

```swift
self.eye.delegate = self
self.eye.open()
```

第四步：实现代理方法，方法中会输出可疑的泄漏对象

```swift
func leakEye(leakEye:LeakEye,didCatchLeak object:NSObject) {
    print(object)
}
```

## 感谢
本仓库是在[LeakEye](https://github.com/zixun/LeakEye)上继续维护的，由于LeakEye年久失修，原作者貌似也不在维护，可惜这么牛逼的框架没人用，所以在学习了原作者的思想之后，打算继续维护。


## 目前在LeakEye基础上改了啥？
1. 修复了iOS13上的崩溃
2. 升级到Swift5，修复一些warnings
3. 支持iOS10+


## 原理

LeakEyeLib基于这样一个假设：
> 如果Controller被释放了，但其曾经持有过的子对象如果还存在，那么这些子对象就是泄漏的可疑目标。

那么怎么在Controller被释放之后，知道其持有的对象没有被释放呢:
**子对象（比如view）建立一个对controller的weak引用，如果Controller被释放，这个weak引用也随之置为nil。那怎么知道子对象没有被释放呢？用一个实例对象每个一小段时间（0.5秒）发出一个ping通知去ping这个子对象，如果子对象还活着就会一个ping通知。所以结论就是：如果子对象的controller已不存在，但还能响应这个ping通知，那么这个对象就是可疑的泄漏对象。**


## 许可证
MIT

