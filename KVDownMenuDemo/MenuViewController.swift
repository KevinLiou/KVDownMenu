//
//  MenuViewController.swift
//  KVDownMenuDemo
//
//  Created by ctitv on 2016/10/18.
//  Copyright © 2016年 test. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var tableView: UITableView!
    let imgDatas:[[String:String]] = {
        let bundle = NSBundle.mainBundle()
        if let path = bundle.pathForResource("img", ofType: "json") {
            if let jsonData = NSData(contentsOfFile: path) {
                do{
                    if let data = try NSJSONSerialization.JSONObjectWithData(jsonData, options: .MutableLeaves) as? [[String:String]] {
                        return data ////load img datas
                    }
                } catch {
                    //error
                }
            }
        }
        
        return []
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func clickCancelItem(sender: AnyObject) {
        
        //重要: 隱藏選單
        self.sideMenuViewController?.hideMenu()
    }
    
    
    
    // MARK: - UITableViewDelegate, UITableViewDataSource
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.imgDatas.count
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        tableView.deselectRowAtIndexPath(indexPath, animated: true)
        
        //這裡取得你自己要替換的ViewController
        let mainStoryboard = UIStoryboard(name: "Main", bundle: nil)
        let contentVC = mainStoryboard.instantiateViewControllerWithIdentifier("NavDetail") as! UINavigationController //內容頁面(你應該自己製作的頁面)
        let vc = contentVC.viewControllers.first as! DetailViewController
        vc.data = self.imgDatas[indexPath.row]
        
        //重要！  呼叫此方法替換KVDownMenu中持有的contentVC，並關閉Menu頁面。
        self.sideMenuViewController?.changeContentViewControllerAndDismissMenu(contentVC)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        let menuCell = tableView.dequeueReusableCellWithIdentifier("MenuCell", forIndexPath: indexPath) as! MenuCell
        
        let data = self.imgDatas[indexPath.row]
        let img = data["img"]
        let title = data["title"]
        let source = data["source"]
        
        menuCell.photoImageView.image = UIImage(named: img!)
        menuCell.titleLabel.text = title
        menuCell.sourceLabel.text = source
        
        return menuCell
    }
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
