//
//  AllTodays.swift
//  hiwu-ios
//
//  Created by 阮良 on 16/1/17.
//  Copyright © 2016年 Shanghai Hiwu Information Technology Co., Ltd. All rights reserved.
//

import UIKit
import SwiftyJSON
import Alamofire
import Kingfisher

class AllTodaysVC: UITableViewController {
    
    var today:JSON?
    
    var cellNumbers = 0
    
    var sections = 0
    var cellsInSection = 0
    
    let dates = NSMutableDictionary()
    let titles = NSMutableArray()
//    let hud = JGProgressHUD(style: JGProgressHUDStyle.Dark)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let backButton = self.navigationItem.leftBarButtonItem?.customView as! UIButton
        backButton.addTarget(self, action: #selector(AllTodaysVC.back), forControlEvents: UIControlEvents.TouchUpInside)
        self.today = globalHiwuUser.todayMuseum
        self.getDate()
    }
    
    func back(){
        self.navigationController?.popViewControllerAnimated(true)
    }
    
    
    func getDate(){
        for i in 0...self.today!.count - 1 {
            let tmpDate = String(self.today![i]["date_y"].int!) + String(self.today![i]["date_m"].int!)
            if(dates.valueForKey(tmpDate) == nil){
                dates.setValue(NSMutableArray(array: [i]), forKey: tmpDate)
                titles.addObject(tmpDate)
            }else{
                let museum = dates.valueForKey(tmpDate) as! NSMutableArray
                museum.addObject(i)
                dates.setValue(museum, forKey: tmpDate)
            }
        }
        tableView.reloadData()
    }
    
    func getTodayInfo(){
        let url = ApiManager.getTodayPublicView
        Alamofire.request(.GET, NSURL(string: url)!).responseJSON{response in
            if(response.result.value != nil){
                self.today = JSON(response.result.value!)
                self.getDate()
            }else{
//                print(response.result.error)
            }
            
        }
        
    }

    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        
        return dates.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let month = titles[section] as! String
        return (dates[month]?.count)!
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let string = (titles[section]) as! NSString
        let year = string.substringToIndex(4)
        let month = string.substringFromIndex(4)
        return year + "年" + month + "月"
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let tmpDate = titles[indexPath.section] as! String
        let index = (dates[tmpDate] as! NSMutableArray)[indexPath.row] as! Int
        let tmpGallery = today![index]["gallery"]
        let cell = tableView.dequeueReusableCellWithIdentifier("TodayCell")
        let avatar = cell?.viewWithTag(1) as! UIImageView
        if(tmpGallery["hiwuUser"]["avatar"].string! == ""){
            avatar.image = UIImage(named: "头像")
        }else{
            avatar.kf_setImageWithURL(NSURL(string: tmpGallery["hiwuUser"]["avatar"].string! + "@!200x200")!, placeholderImage:nil)
        }
        avatar.layer.cornerRadius = avatar.frame.size.width/2
        avatar.clipsToBounds = true
        let name = cell?.viewWithTag(2) as! UILabel
        var nickname = tmpGallery["hiwuUser"]["nickname"].string!
        if(nickname == ""){
            nickname = "佚名"
        }
        name.text = nickname + " ⎡" + tmpGallery["name"].string! + " ⎦"
        let num = cell?.viewWithTag(3) as! UILabel
        num.text = String(tmpGallery["items"].count) + " 件"
        return cell!
    }

    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let tmpDate = titles[indexPath.section] as! String
        let index = (dates[tmpDate] as! NSMutableArray)[indexPath.row] as! Int
        let tmpGallery = today![index]["gallery"]
        let galleryDetail = self.storyboard?.instantiateViewControllerWithIdentifier("GalleryDetailVC") as! GalleryDetailVC
        galleryDetail.galleryId = tmpGallery["id"].int!
        galleryDetail.isMine = false
        self.navigationController?.pushViewController(galleryDetail, animated: true)
        tableView.cellForRowAtIndexPath(indexPath)?.selected = false
    }
    
    override func prefersStatusBarHidden() -> Bool {
        return  true
    }
    


}
