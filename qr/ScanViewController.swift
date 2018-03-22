
import UIKit
import AVFoundation
import QRCodeReader


class ScanViewController: UIViewController , QRCodeReaderViewControllerDelegate {

    
    var arrCodes: [String] =  ["","holaa"]
    
    @IBOutlet weak var TextField: UITextField!
    
    @IBOutlet weak var ResultScann: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        TextField.becomeFirstResponder()
    }
    
    
    lazy var readerVC: QRCodeReaderViewController = {
        let builder = QRCodeReaderViewControllerBuilder {
            $0.reader = QRCodeReader(metadataObjectTypes: [.qr], captureDevicePosition: .back)
        }
        
        return QRCodeReaderViewController(builder: builder)
    }()
    
    @IBAction func scanAction(_ sender: AnyObject) {

        readerVC.delegate = self
        
        readerVC.completionBlock = { (result: QRCodeReaderResult?) in
            print(result as Any)
            self.ResultScann.text = result?.value
        
        }
        
        
        readerVC.modalPresentationStyle = .formSheet
        present(readerVC, animated: true, completion: nil)
    }
    
    
    func reader(_ reader: QRCodeReaderViewController, didScanResult result: QRCodeReaderResult) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
    
    
    
    func readerDidCancel(_ reader: QRCodeReaderViewController) {
        reader.stopScanning()
        
        dismiss(animated: true, completion: nil)
    }
  
    @IBAction func text2(_ sender: Any) {
        
        self.arrCodes.append(self.TextField.text!)
        print(self.arrCodes)
        self.TextField.text = ""
        
    }
    
    @IBAction func BackPage (){
        dismiss(animated: true, completion: nil)
    }
    
    @IBAction func openAlert() {
        _ = SweetAlert().showAlert("Here's a message!")
    }
}
