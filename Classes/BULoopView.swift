//
//  BULoopViiew.swift
//  BULoopView
//
//  Created by Burak Üstün on 23/06/17.
//  Copyright © 2017 Burak Üstün. All rights reserved.
//

import UIKit
import Kingfisher

public class BULoopView: UIView {
    
    /**
     *  The Scrollview of this BULoopView
     */
    fileprivate var LoopView:UIScrollView!
    
    /**
     *  The Timer of this BULoopView
     */
    fileprivate var LoopTimer:Timer?
    
    /**
     *  Screensize for some operations
     */
    fileprivate let screenSize: CGRect  = UIScreen.main.bounds
    
    /**
     *  The array of this BULoopView
     */
    fileprivate var arrayLoop:   [LoopItem]    = []
    
   
    /**
     *   Use the size of the BULoopView for Loop Item Height
     */
    fileprivate var LoopItemHeight: CGFloat = 0.0
    
    
    /** Produces LoopView
     *  @param Takes the array from the outside and turns it into the appropriate elements
     */
    public func loadLoopView(LoopArray : [LoopItem]){
        self.LoopView = UIScrollView.init(frame: self.bounds)
        self.LoopItemHeight = self.frame.height
        self.addSubview(self.LoopView)
        self.arrayLoop    =   LoopArray
        /**
            If the size of the array is bigger than the BULoopView, starts the loop.
         */
        if(CGFloat(self.arrayLoop.count) * self.LoopItemWidth > self.frame.size.width){
            for j in 1..<3 {
                for i in 0..<self.arrayLoop.count {
                    if j == 1{
                        self.createLoopItem(index: i)
                    }
                    else{
                        self.createLoopItem(index: i+self.arrayLoop.count)
                    }
                    
                }
            }
            self.LoopView.delegate                           = self
            self.LoopView.showsVerticalScrollIndicator       = false
            self.LoopView.showsHorizontalScrollIndicator     = false
            self.LoopView.contentSize                        = CGSize(width : 2 * CGFloat(self.arrayLoop.count) * (self.LoopSpace + self.LoopItemWidth), height : self.LoopView.frame.height)
            self.LoopTimer                                   = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(self.LoopViewcontrol), userInfo: nil, repeats: true)
            RunLoop.current.add(self.LoopTimer!, forMode: RunLoopMode.commonModes)
        }
        else{
            for i in 0..<self.arrayLoop.count {
                self.createLoopItem(index: i)
            }
        }
       
        
    }
    
    
    /** Produces LoopItem according to the given sequence
     *  @param Produces position by taking index
     *  It only contains one photo and one text
     */
    fileprivate func createLoopItem(index : Int){
        
        let LoopItem:UIView          = UIView.init(frame: CGRect(x: CGFloat(index) * (self.LoopSpace + self.LoopItemWidth), y: 5 , width : self.LoopItemWidth , height: self.LoopView.frame.height - 20))
        let imageView:UIImageView      = UIImageView.init(frame: CGRect(x: 5, y: LoopItemMargin/2 , width : LoopItemImageWidth , height: LoopItemHeight - LoopItemMargin*2))
        imageView.contentMode = .scaleAspectFit
        if(index < self.arrayLoop.count){
            imageView.kf.setImage(with: URL(string: self.arrayLoop[index].PhotoPath!))
        }
        else{
            imageView.kf.setImage(with: URL(string: self.arrayLoop[index - self.arrayLoop.count].PhotoPath!))
        }
        let nameLabel:UILabel        = UILabel.init(frame: CGRect(x: imageView.frame.size.width + 5, y:  LoopItemMargin/2 , width : self.LoopItemWidth - imageView.frame.size.width - 15 , height : LoopItemHeight - LoopItemMargin*2))
        nameLabel.textAlignment      = .center
        nameLabel.text               = index < self.arrayLoop.count ? self.arrayLoop[index].Name : self.arrayLoop[index - self.arrayLoop.count].Name
        
        if(self.labelFont != nil){
            nameLabel.font               = self.labelFont
        }
        nameLabel.textColor          = self.textColor
        let seperatorView:UIView        = UIView.init(frame: CGRect(x: self.LoopItemWidth - 0.5 , y: LoopItemMargin/2  , width : 0.5 , height : LoopItemHeight - LoopItemMargin*2))
        seperatorView.backgroundColor   = self.seperatorColor
        seperatorView.alpha             = self.seperatorAlpha
        LoopItem.backgroundColor     = UIColor.clear
        LoopItem.addSubview(seperatorView)
        LoopItem.addSubview(imageView)
        LoopItem.addSubview(nameLabel)
        
        self.LoopView.addSubview(LoopItem)
    }
    
    @objc fileprivate func LoopViewcontrol(){
        var point = CGPoint(x: CGFloat(self.LoopView.contentOffset.x), y: CGFloat(self.LoopView.contentOffset.y))
        point.x += 0.5
        self.LoopView.contentOffset = point
    }
    
    /**
     *  Use to set the Loop Items Space
     */
    public var LoopSpace: CGFloat = 10.0
    
    /**
     *  Use to set the Loop Items Width
     */
    public var LoopItemWidth:  CGFloat = 150.0
    
    /**
     *  Use to set the Loop Items Margin
     */
    public var LoopItemMargin:CGFloat = 10.0
    
    /**
     *  Use to set the Loop Items Image Width
     */
    public var LoopItemImageWidth:CGFloat = 50.0
    
    /**
     *  Use to set the Loop Items Seperator Color
     */
    public var seperatorColor:UIColor = UIColor( red:0.961,  green:0.961,    blue:0.961, alpha:1)
    
    /**
     *  Use to set the Loop Seperator Alpha
     */
    public var seperatorAlpha:CGFloat = 0.7
    
    /**
     *  Use to set the Loop Items Text Color
     */
    public var textColor:UIColor = UIColor( red:0.961,  green:0.961,    blue:0.961, alpha:1)
    
    /**
     *  Use to set the Loop Items Text Font
     */
    public var labelFont:UIFont? = nil
}


extension BULoopView : UIScrollViewDelegate{
    /**
     Endless Loop Mechanic
     */
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView == LoopView){
            if(scrollView.contentOffset.x > scrollView.contentSize.width / 2 + 2){
                scrollView.contentOffset.x = 0
            }
            else if(scrollView.contentOffset.x < -0.5){
                scrollView.contentOffset.x = scrollView.contentSize.width / 2 - 0.5
            }
        }
    }
}
