

import UIKit

class ModalViewController: UIViewController {

    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    var name: String?
    var bounty: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
    }

    func updateUI() {
        if let name = self.name, let bounty = self.bounty {
            let img = UIImage(named: "\(name).jpg")
        imgView.image = img
        nameLabel.text = name
        bountyLabel.text = "\(bounty)"
        }
    }
    
    @IBAction func outBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}


