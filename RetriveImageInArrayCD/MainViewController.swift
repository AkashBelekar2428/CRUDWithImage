//
//  MainViewController.swift
//  RetriveImageInArrayCD
//
//  Created by Akash Belekar on 17/04/23.
//

import UIKit

class MainViewController: UIViewController{

    @IBOutlet weak var image: UIImageView!
    @IBOutlet weak var txtName:UITextField!
    
    var imageNature = UIImagePickerController()
    var indexNum = Int()
    var isSelected = Bool()
    var pngData = Data()
    override func viewDidLoad() {
        super.viewDidLoad()
        imageNature.delegate = self
        image.isUserInteractionEnabled = true
        image.addGestureRecognizer(UITapGestureRecognizer(target: self, action: #selector(imageTapped(_ :))))

    }
    @objc func imageTapped(_ sender:UITapGestureRecognizer){
        imageNature.allowsEditing = false
        imageNature.sourceType = .photoLibrary
        
        present(imageNature, animated: true, completion: nil)
    }

    @IBAction func saveBtnClicked(_ sender: UIButton) {
        print("saved..")
        let dic = ["name":txtName.text]
        var png = image.image?.pngData()
        if isSelected{
            DataBaseHelper.shared.getEditData(object: dic as! [String:String], image: png!, indexpath: indexNum)
        }else{
            DataBaseHelper.shared.getProfileData(objec: dic as! [String:String], imageData: png!)

        }
    }
    @IBAction func showBtnClicked(_ sender: UIButton) {
        let vc = DetailsViewController()
        vc.modalPresentationStyle = .fullScreen
        vc.delegate = self
        present(vc, animated: true)
    }
    

}
extension MainViewController: UIImagePickerControllerDelegate & UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let imageTap = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image.contentMode = .scaleAspectFit
            image.image = imageTap

        }
        dismiss(animated: true, completion: nil)
    }
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
extension MainViewController:dataPassDelegate{
    func dataPass(obj: [String : String], imageData: Data, index: Int, isselect: Bool) {
        txtName.text = obj["name"]
        image.image = UIImage(data: imageData)
        indexNum = index
        isSelected = isselect
        
        
    }
    
}
