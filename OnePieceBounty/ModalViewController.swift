

import UIKit

class ModalViewController: UIViewController {

    //일단 선언은 필수
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
    //스트링을 붙여 if로 처리함
    //그런데 else가 없네? 신기하네?
    var name: String?
    var bounty: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 뷰가 그려질 때 데이터를 가져와야 하니까 여기에 함수를 넣음
        updateUI()
    }

    // 이 함수는 데이터를 준비하는 함수
    func updateUI() {
        if let name = self.name, let bounty = self.bounty {
            let img = UIImage(named: "\(name).jpg")
        imgView.image = img
        nameLabel.text = name
        bountyLabel.text = "\(bounty)"
        }
    }
    
    
    // diss 버튼
    @IBAction func outBtn(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    
}


