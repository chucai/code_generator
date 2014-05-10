2dx的工具

标签： cocos2dx tool ruby

---
## 遇到的问题
因为我遇到了这样的问题， 在学习cocos2d-x的时候，总是要写一些重复的代码和模式。比如，在实现一个Sprite的时候，总是需要创建一个`static init` 方法，然后创建一个 `bool init`方法; 在增加一个事件`EventListener`的时候，每次都需要进行那些指定的步骤: 定义一个事件监听器并且将指定的方法绑定到事件上。但是这些都是可以共用的。这些我们不应该去记忆，而是应该依靠我们的代码去记忆。这样不但可以减轻我们的记忆负担，而且可以提供我们写代码的效率和正确性。

## 要求
> 可以自动生成指定对象的代码，比如可以指定生成Sprite的代码，或者具有"物理性质"的Sprite的代码

## 技术方案 

### command
使用`rake`来实现，具体命令应该是这样的

```ruby
rake generator:sprite[name]
```

`name`是Sprite的名字

### 输出颜色

使用的是 `gem 'colored'`. 没有按照语言输出不同的颜色。以后参考pry来实现。

## ToDo

* 实现生成eventlistener代码
* 支持物理引擎的Sprite
* 生成系统命令: `code_generator -c Sprite -n TestSprite` 
