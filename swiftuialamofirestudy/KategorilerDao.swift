//
//  KategorilerDao.swift
//  WebservisKullanimi
//
//  Created by Kasım on 25.02.2023.
//

import Foundation

class KategorilerDao {
    func kategorileriYukle(){
        let url = URL(string: "http://kasimadalan.pe.hu/filmler/tum_kategoriler.php")!
        
        URLSession.shared.dataTask(with: url){ data,response,error in
            do{
                let cevap = try JSONDecoder().decode(KategorilerCevap.self, from: data!)
                
                if let liste = cevap.kategoriler {
                    for k in liste {
                        print("-------------------")
                        print("Kategori Id  : \(k.kategori_id!)")
                        print("Kategori Ad  : \(k.kategori_ad!)")
                    }
                }
                print("--------------------")
                print("Başarı : \(cevap.success!)")
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
}
