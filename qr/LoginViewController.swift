import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Login() {
        
        if((userName.text?.contains("admin"))! && (Password.text?.contains("123"))!){
            NSLog("Logueado correctamente")
            _ = SweetAlert().showAlert("Exclente!", subTitle: "Ingresaste correctamente", style: AlertStyle.success)
            
            DispatchQueue.main.async(){
                self.performSegue(withIdentifier: "push", sender: self)
            }
        }else{
            NSLog("Intentar de nuevi")
        }
        
    }
    
    
    // esta accion se ejecuta cuando se hace el paso de view , atento al identifier
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "PasarDatos" {
            let Maindata =  segue.destination as! ViewController
            Maindata.user = userName.text!
            
        }
    }

}
