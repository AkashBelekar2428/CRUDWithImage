//
//  DetailsViewController.swift
//  RetriveImageInArrayCD
//
//  Created by Akash Belekar on 17/04/23.
//

import UIKit
protocol dataPassDelegate{
    func dataPass(obj:[String:String],imageData:Data,index:Int,isselect:Bool)
}

class DetailsViewController: UIViewController {
    @IBOutlet weak var profileTbl:UITableView!
    var profileModel = [Profile]()
    var delegate:dataPassDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        self.profileTbl.register(UINib(nibName: "DetailsTVC", bundle: nil), forCellReuseIdentifier: "DetailsTVC")
        profileTbl.dataSource = self
        profileTbl.delegate = self
     
        profileModel = DataBaseHelper.shared.getAllProfile()
        profileTbl.reloadData()
    }
    @IBAction func backPressed(){
        dismiss(animated: true)
    }

}
extension DetailsViewController: UITableViewDataSource,UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return profileModel.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DetailsTVC", for: indexPath) as! DetailsTVC
        cell.nameLbl.text = profileModel[indexPath.row].name
        if let dataImg = self.profileModel[indexPath.row].image{
            cell.img.image = UIImage(data: dataImg)
        }
        if cell.img.image == nil{
            cell.img.image = UIImage(systemName:"homekit")
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete{
            profileModel =  DataBaseHelper.shared.getDeleteData(index: indexPath.row)
            profileTbl.reloadData()
            
        }
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dic = ["name":profileModel[indexPath.row].name]
        let img = profileModel[indexPath.row].image
        
        
        delegate?.dataPass(obj: dic as! [String:String], imageData: img!, index: indexPath.row, isselect: true)
       // DataBaseHelper.shared.getEditData(object: dic as! [String:String], indexpath: indexPath.row, isSelect: true)
    }
    
}
