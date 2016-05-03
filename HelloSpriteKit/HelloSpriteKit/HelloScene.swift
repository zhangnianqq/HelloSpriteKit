//
//  HelloScene.swift
//  HelloSpriteKit
//
//  Created by zhangnian on 16/5/3.
//  Copyright © 2016年 zhangnian. All rights reserved.
//第一个场景

import UIKit
import SpriteKit

class HelloScene: SKScene {
    //当程序转入view后
    override func didMoveToView(view: SKView) {
        createScene()
    }
    
    func createScene() {
        //改变背景色
        self.backgroundColor = SKColor.redColor()
        //创建文本  //字体名称
        let myLabel = SKLabelNode(fontNamed: "Chalkduster")
        myLabel.text = "Hello, 年哥"
        myLabel.fontSize = 65
        //设置文本节点的位置
        myLabel.position = CGPoint(x: CGRectGetMidX(self.frame), y: CGRectGetMidY(self.frame))
        self.addChild(myLabel)
        
        myLabel.name = "label"
        
        self.performSelector(#selector(HelloScene.pushSpaceship), withObject: nil,afterDelay: 1)
//        [self performSelector:@selector(download:) withObject:@"http://555.jpg" afterDelay:3];
    }
    //自动进入下级精灵界面
    func pushSpaceship() {
        //下一个成精的实例
        let spaceshipScene = SpaceshipScene(size: self.size)
        /*场景过渡动画
         crossFadeWithDuration 淡入 淡出
         fadeWithDuration 原来的颜色 随着时间减弱
         fadeWithColor  根据提供的颜色加深 然后变淡
         flipHorizontalWithDuration 水平翻转
         flipVerticalWithDuration 垂直翻转
         revealWithDirection 随着方向(上下左右) 平移
         moveInWithDirection 移动与方向
         doorsOpenVerticalWithDuration 上下拉开Scene的方式 从中间往两边
         doorsOpenHorizontalWithDuration  左右拉开
         pushWithDirection 推动 方向
         doorsCloseHorizontalWithDuration 门关闭水平随着时间 从两边往中间
         doorsCloseVerticalWithDuration 门关闭垂直随着时间
         doorwayWithDuration 开门似的动画
         */
        let doors = SKTransition.doorwayWithDuration(1)
        //带动画的场景转化
        self.view?.presentScene(spaceshipScene,transition: doors)

    }
    
    override func touchesBegan(touches: Set<UITouch>, withEvent event: UIEvent?) {
        //获取文本节点
        let labelNone = self.childNodeWithName("label")
        //向上移动
        let moveUp = SKAction.moveByX(0, y: 100, duration: 0.5)
        //放大
        let zoom = SKAction.scaleTo(1.5, duration: 0.25)
        //暂停
        let pause = SKAction.waitForDuration(0.25)
        //淡出
        let fadeAway = SKAction.fadeOutWithDuration(0.25)
        //从父类移除
        let remove = SKAction.removeFromParent()
        //动作序列
        let moveSequence = SKAction.sequence([moveUp,zoom,pause,fadeAway,remove])
        //文本节点执行动作序列
        labelNone?.runAction(moveSequence, completion: {
            //下一个成精的实例
            let spaceshipScene = SpaceshipScene(size: self.size)
            /*场景过渡动画
             crossFadeWithDuration 淡入 淡出
             fadeWithDuration 原来的颜色 随着时间减弱
             fadeWithColor  根据提供的颜色加深 然后变淡
             flipHorizontalWithDuration 水平翻转
             flipVerticalWithDuration 垂直翻转
             revealWithDirection 随着方向(上下左右) 平移
             moveInWithDirection 移动与方向
             doorsOpenVerticalWithDuration 上下拉开Scene的方式 从中间往两边
             doorsOpenHorizontalWithDuration  左右拉开
             pushWithDirection 推动 方向
             doorsCloseHorizontalWithDuration 门关闭水平随着时间 从两边往中间
             doorsCloseVerticalWithDuration 门关闭垂直随着时间
             doorwayWithDuration 开门似的动画
             */
            let doors = SKTransition.doorwayWithDuration(1)
            //带动画的场景转化
            self.view?.presentScene(spaceshipScene,transition: doors)
        })
    }
}
