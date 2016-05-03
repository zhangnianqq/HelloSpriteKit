//
//  SpaceshipScene.swift
//  HelloSpriteKit
//
//  Created by zhangnian on 16/5/3.
//  Copyright © 2016年 zhangnian. All rights reserved.
//

import UIKit
import SpriteKit

class SpaceshipScene: SKScene {
    
    override func didMoveToView(view: SKView) {
        createScene()
    }
    
    
    func createScene() -> Void {
        //飞船
        let spceship = newSpaceship()
        //添加物理体  进行自由落体运动
        spceship.physicsBody = SKPhysicsBody(circleOfRadius: 60)
        //重力不添加到对象 可以检测到碰撞
        spceship.physicsBody?.dynamic = false
        self.addChild(spceship)
        
        NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: #selector(SpaceshipScene.addRock), userInfo: nil, repeats: true)
    }
    //创建飞船的类
    func newSpaceship() -> SKSpriteNode {
        //创建飞船 小精灵
        let sprite = SKSpriteNode(imageNamed:"Spaceship")
        sprite.size = CGSizeMake(120, 120)
//        sprite.xScale = 0.5
//        sprite.yScale = 0.5
        sprite.position = CGPointMake(CGRectGetMidX(self.frame), CGRectGetMidY(self.frame)-150)
        //创建一租动作 暂停 位移 暂停 位移
        let hover = SKAction.sequence([
//            SKAction.waitForDuration(1),
            SKAction.moveByX(0, y: 500, duration: 5),
//            SKAction.waitForDuration(1),
            SKAction.rotateByAngle(CGFloat(M_PI), duration:0.5),
            SKAction.moveByX(0, y: -500, duration: 5),
            SKAction.rotateByAngle(CGFloat(M_PI), duration:0.5),
            ])
        //以重复的方式执行序列动作 repeatActionForever重复执行动作
        sprite.runAction(SKAction.repeatActionForever(hover))
        //灯光1
        let light1 = createNewLight()
        light1.position = CGPointMake(-28, -50)
        sprite.addChild(light1)
        //灯光2
        let light2 = createNewLight()
        light2.position = CGPointMake(28, -50)
        sprite.addChild(light2)
        
        return sprite
        /*
        //创建一个椭圆
        let ship = SKShapeNode()
        ship.path = CGPathCreateWithRoundedRect(CGRectMake(-15, -15, 30, 30), 15, 15, nil)
        ship.strokeColor = SKColor.whiteColor()
        ship.fillColor = SKColor.grayColor()
        //创建一租动作 暂停 位移 暂停 位移
        let hover = SKAction.sequence([
            SKAction.waitForDuration(1),
            SKAction.moveByX(100, y: 50, duration: 1),
            SKAction.waitForDuration(1),
            SKAction.moveByX(-100, y: -50, duration: 1)
            ])
        //以重复的方式执行序列动作 repeatActionForever重复执行动作
        ship.runAction(SKAction.repeatActionForever(hover))
        return ship
        */
    }
    //创建灯光小精灵
    func createNewLight() -> SKSpriteNode {
        let light = SKSpriteNode(imageNamed: "dengGuang")
        light.size = CGSizeMake(80, 80)
        //创建 忽明忽暗的动作
        let blink = SKAction.sequence([
            //淡出
            SKAction.fadeOutWithDuration(1),
            //淡入
            SKAction.fadeInWithDuration(1)
            ])
        //运行 一直重发的动作
        light.runAction(SKAction.repeatActionForever(blink))
        return light
    }
    
    //添加陨石
    func addRock() {
        //创建一个椭圆
        let rock = SKShapeNode()
        rock.path = CGPathCreateWithRoundedRect(CGRectMake(-4, -4, 8, 8), 4, 4, nil)
        rock.strokeColor = SKColor.whiteColor()
        rock.fillColor = SKColor.brownColor()
        //获取景宽 高
        let w = self.size.width
        let h = self.size.height
        //随机出现的xy位置
        let x = CGFloat(arc4random())%w
        let y = CGFloat(arc4random())%h
        
        //设置陨石的位置
        rock.position = CGPointMake(x, y)
        //设置陨石的name
        rock.name = "rock"
        //给陨石设置物理体
        rock.physicsBody = SKPhysicsBody(circleOfRadius: 4)
        //物理题允许检测碰撞
        rock.physicsBody?.usesPreciseCollisionDetection = true
        
        self.addChild(rock)
    }
}
