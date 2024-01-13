//
//  KeyboardViewController.swift
//  Hodor
//
//  Created by hasan bilgin on 30.09.2023.
//

import UIKit

class KeyboardViewController: UIInputViewController {
    
    /*yeni bir klavye açıp buton eklemedir proje
     
     *eklenti eklicez bunun için
     -en baş klasörü seçip en üst file->new->terget...->İos-> Custom Keyboard Extension seçtik next dedik-> isim verdik-> seçili swift gerine dokunmadan finiş dedik -> sonra aktive edelimmi diyor activate tıkladık ve o siimde klasör oluşur
     -hatta çalıştırma oluşturduğumuz eklentiyi görücektir sol üstte (Hodor->İphone 14 Pro)
     -çalıştırmaya basınca hangi uygulama içersinde deniceksin diyor klavye olduğu için klavye olması yeterlidir.mesela safaride seçtik. zaten kapatsak bile başka uygulamalarda açabiliriz similasyon içinde.
     -yeni klavye çıkmazsa (sol altta dünya simgesine tıklayarak geçişler sağlanıyor) similasyon ayarlara girilir-> General (genel) -> Keyboard(klavye) seçilir -> Keyboards (klavyeler)-> add new keyboard... ile eklicez kendi verdiğimiz ismini seçerek ekleriz
     
     */
    
    //kısa yol Clean Build Folder tüm projeyi build yapar (şhift+command+k)
    //kısa yol build olan hata için build eder (command+b)
    
    
    
    
    @IBOutlet var nextKeyboardButton: UIButton!
    
    override func updateViewConstraints() {
        super.updateViewConstraints()
        
        // Add custom view sizing constraints here
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Hodor....
        
        //nextKeyboardButtonu dünya simgesidir
        //hodor butonu oluşturudk
        let hodorButton = UIButton(type: UIButton.ButtonType.system)
        //çerçesi ve kordinatını yaptık
        hodorButton.frame = CGRect(x: 150, y: 50, width: 100, height: 120)
        //arka planı ekledik
        //resimi bu arada Hodor(Proje ismi) klasörnünü içine atarken  Add to targets yerinde Hodor (proje ismi) Extension(eklenti) seçili olmalıdır yani hodor keyboardda değil hodor da olduğunu söler
        hodorButton.setBackgroundImage(UIImage(named: "hodor.jpg"), for: UIControl.State.normal)
        //o butona üstüne tıkaldığında
        hodorButton.addTarget(self, action: #selector(hodorTapped), for: UIControl.Event.touchUpInside)
        //ve ekrana yada view ekleme ...
        view.addSubview(hodorButton)
        
        
        
        // Perform custom UI setup here
        
        self.nextKeyboardButton = UIButton(type: .system)
        
        self.nextKeyboardButton.setTitle(NSLocalizedString("Next Keyboard", comment: "Title for 'Next Keyboard' button"), for: [])
        self.nextKeyboardButton.sizeToFit()
        self.nextKeyboardButton.translatesAutoresizingMaskIntoConstraints = false
        
        self.nextKeyboardButton.addTarget(self, action: #selector(handleInputModeList(from:with:)), for: .allTouchEvents)
        
        self.view.addSubview(self.nextKeyboardButton)
        
        self.nextKeyboardButton.leftAnchor.constraint(equalTo: self.view.leftAnchor).isActive = true
        self.nextKeyboardButton.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
    }
    
    @objc func hodorTapped(){
        let textProxy = textDocumentProxy as UITextDocumentProxy
        textProxy.insertText("HODOR!!!!")
    }
    
    override func viewWillLayoutSubviews() {
        self.nextKeyboardButton.isHidden = !self.needsInputModeSwitchKey
        super.viewWillLayoutSubviews()
    }
    
    //kullanıcı yazı yazmaya başlayınca..
    override func textWillChange(_ textInput: UITextInput?) {
        // The app is about to change the document's contents. Perform any preparation here.
    }
    
    //kullanıcı yazı yazdı ve değiştirdi vs....
    override func textDidChange(_ textInput: UITextInput?) {
        // The app has just changed the document's contents, the document context has been updated.
        
        var textColor: UIColor
        let proxy = self.textDocumentProxy
        if proxy.keyboardAppearance == UIKeyboardAppearance.dark {
            textColor = UIColor.white
        } else {
            textColor = UIColor.black
        }
        self.nextKeyboardButton.setTitleColor(textColor, for: [])
    }
    
}
