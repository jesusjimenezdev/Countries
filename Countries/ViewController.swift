import UIKit
import Alamofire
import SwiftyJSON

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        datosWeb()
    }

    func datosWeb(){
        DispatchQueue.main.async {
            Alamofire.request("http://restcountries.eu/rest/v2/all").responseJSON(completionHandler: { (resultado) in
                switch resultado.result{
                case .success(let value):
                    
                    let json = JSON(value)
                    for item in json.array! {
                        let nombre = item["name"].stringValue
                        let capital = item["capital"].stringValue
                        print(nombre, capital)
                        //let usuarios = Users(nombre: nombre, email: email, calle: calle)
                        //self.lista.append(usuarios)
                    }
                    //self.tabla.reloadData()
                case .failure(let error):
                    print(error.localizedDescription)
                }
            })
        }
    }
}

