
import UIKit


// dispatchqueue 14 - 3 적용 강의. velog에 업로드
// dispatchqueue 실행 방법 작용
// ids
// 내가 모르는 것 정리
// overriide 개념
// prepare 사용법
// guard에서 as?가 무엇을 의미하는지 모르겠음
///class는 잘 모름 

// 기본 VC에다가 TVDS, TVD를 추가했음 뒤에 두 개는 필수로 들어가야 함
class BountyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    
    
    
    
    // MVVM
    
    // Model
    // - BountyInfo
    // > BountyInfo 만들자
    
    // View
    // ListCell
    // > ListCell에 필요한 정보를 ViewModel에게 받자
    
    // ViewModel
    
    // 들어갈 데이터들임. 이걸 json 형태로 정리했다면 더 편하게 사용할 수 있었을 것
    // let nameBounty = [{brook : 33000000}, chopper : 50] 이런식으로 했다면 데이터를 추가하기도, 제거하기도 더 편리했을 것
    let nameList = ["brook","chopper","franky","luffy","nami","robin","sanji","zoro",]
    let bountyList = [33000000, 50, 44000000, 300000000, 16000000, 80000000, 77000000, 120000000]
    
    
    
    
    
    //override 뭔지 모름
    //prepare는 화면을 전달할 때 뭔가를 준비한다는 의미
    //여기서는 name,bounty를 ModalViewCo에 전달하기 위해 사용함
    //POG에선 필요 없음
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
    
    
  
    //numberOfRowsInSection이 있으면 행의 수를 생각하면 됨
    //bountyList.count를 통해 있는 데이터만큼 만들고자 사용했음
    //당연히 nameList, bountyList 둘 다 가능
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return nameList.count
    }
    
    // 여기가 이 셀을 반복한다 이런 곳이니까 이곳에다가 데이터를 넣는다...? 일단 dataSource니까 이쪽이 맞는 것 같긴함
    // 여기도 데이터를 넣는 곳인데 guard, else를 통해 표현했음. if와 다른 점은 얼리엑싯이라는데 잘 모르겠음
    // cell은 재활용하는데 그게 dequeueReusableCell인 것 같음
    /// as?가 무엇을 의미하는지 모르겠음
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // "cell"부분에는 tableViewCell의 식별자를 똑같이 cell로 맞춰야 함
        /// return인데 왜 UITableViewCell을 시전하는지 모르겠음
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? ListCell else {
            return UITableViewCell()
        }
    
        //guard가 참일 경우 읽는 코드
        //image의 이름이 nameList의 이름들과 같기 때문에 이렇게 표현함
        //즉 UIImage에서 named는 해당 이름을 추적하는 코드임
        
        /// cell은 guard에서 선언했음 그러나 잘은 모름
        // 그 cell의 imgView 부분에 image = img다
        // cell의 namebabel의 글자는 ~
        // 이런식으로 데이터를 넣어주는 것을 볼 수 있음
        // 아~ 데이터를 넣는 부분은 cellForRowAt 부분이구나~
    let img = UIImage(named: "\(nameList[indexPath.row]).jpg")
    cell.imgView.image = img
    cell.nameLabel.text = nameList[indexPath.row]
    cell.bountyLabel.text = "\(bountyList[indexPath.row])"
    return cell
    }

    
    //여기는 Delegate부분임
    //Delegate는 화면에 보이는 모습과 행동을 담당. cell을 터치했을 때 동작, cell의 높이, cell의 들여쓰기 등
    //DataSource는 테이블을 만들 때 필요한 정보를 제공함. 데이터를 받아서 뷰를 그려주는 역할. cell은 몇 개를 그릴까? cell에는 어떤 내용을 담아서 보여줄까?
    //여기서는 cell을 눌렀을 때 print가 되도록 했고
    //두 번째로는 performSegue를 통해 해당 Segue가 활성화되어 modal이 작동할 수 있도록 했음
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("-->\(indexPath.row)")
        performSegue(withIdentifier: "showDetail", sender: indexPath.row)
        
    }
}

///class는 잘 모름
class ListCell: UITableViewCell {
    
    @IBOutlet weak var imgView: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var bountyLabel: UILabel!
    
}

