
import UIKit

class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    let nameList = ["brook","chopper","franky","luffy","nami","robin","sanji","zoro",]
    let bountyList = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
    
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "showDetail" {
            let vc = segue.destination as? ModalViewController
        if let index = sender as? Int {
            vc?.name = nameList[index]
            vc?.bounty = bountyList[index]        }
            }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
  

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return bountyList.count
    }
    
    // 여기가 이 셀을 반복한다 이런 곳이니까 이곳에다가 데이터를 넣는다...? 일단 dataSource니까 이쪽이 맞는 것 같긴함
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // "cell"부분에는 tableViewCell의 식별자를 똑같이 cell로 맞춰야 함
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
    
    let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
    cell.imgView.image = img
    cell.nameLabel.text = nameList[indexPath.row]
    cell.bountyLabel.text = "\(bountyList[indexPath.row])"
    return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("-->\(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
        
    }
}

class ListCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
}

