import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userName: UITextField!
    @IBOutlet weak var Password: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func Login() {
        
        
        // Poner logica  para login
        
        if((userName.text!.isEmpty) || (Password.text!.isEmpty)){
            
            NSLog("Intentar de nuevo")
            
        }else{
            
            let user = self.userName.text;
            let pass = self.Password.text;
            NSLog(user!, pass!)
            
            let url = URL(string: "http://10.113.55.146/auth/login")!
            var request = URLRequest(url: url)
            request.setValue("application/x-www-form-urlencoded", forHTTPHeaderField: "Content-Type")
            request.httpMethod = "POST"
            let postString = "email="+user!+"&password="+pass!;
            request.httpBody = postString.data(using: .utf8)
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                guard let data = data, error == nil else {                                                 // check for fundamental networking error
                    print("error=\(String(describing: error))")
                    return
                }
                
                if let httpStatus = response as? HTTPURLResponse, httpStatus.statusCode != 200 {           // check for http errors
                    //print("statusCode should be 200, but is \(httpStatus.statusCode)")
                    //print("response = \(String(describing: response))")
                    NSLog("Error , usuario no registrado");
                    return
                    
                }
                
                DispatchQueue.main.async(){
                    self.performSegue(withIdentifier: "push", sender: self)
                }
                let responseString = String(data: data, encoding: .utf8)
                print("responseString = \(String(describing: responseString))")
                NSLog("Logueado correctamente")
            }
            task.resume()
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
