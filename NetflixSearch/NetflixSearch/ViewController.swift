import UIKit
import SwiftyJSON
import Alamofire
class ViewController: UIViewController {
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBOutlet weak var DirectorField: UITextField!
    @IBOutlet weak var ActorField: UITextField!
    
    @IBAction func Search(_ sender: Any) {
        let apiToContact = "http://netflixroulette.net/api/api.php"
        
        var parameters: Parameters = [ : ];
        if DirectorField.text != nil{
            parameters["director"] = DirectorField.text;
        }
        if ActorField.text != nil{
            parameters["actor"] = ActorField.text;
        }
        
        
        
        
        
        
        
        let test = Alamofire.request(apiToContact, parameters: parameters).validate().responseJSON() { response in
            switch response.result {
            case .success:
                if let value = response.result.value {
                    let json = JSON(value)
                    
                    
                    print(json)
                    
                    
                }
            case .failure(let error):
                print(error)
            }
        }
        print(test);
        
    }

    }
