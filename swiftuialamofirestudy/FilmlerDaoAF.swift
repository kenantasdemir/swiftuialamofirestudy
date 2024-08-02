//
//  FilmlerDaoAF.swift
//  WebservisKullanimi
//
//  Created by Kasım on 26.02.2023.
//

import Foundation
import Alamofire

class FilmlerDaoAF {
    func filmleriYukle(){
        let url = "http://kasimadalan.pe.hu/filmler/tum_filmler.php"
        
        AF.request(url,method: .get).response { response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(FilmlerCevap.self, from: data)
                    if let liste = cevap.filmler {
                        for f in liste {
                            print("------------------")
                            print("Film Id  : \(f.film_id!)")
                            print("Film Ad  : \(f.film_ad!)")
                            print("Film Yıl  : \(f.film_yil!)")
                            print("Film Resim  : \(f.film_resim!)")
                            print("Film Kategori  : \(f.kategori!.kategori_ad!)")
                            print("Film Yönetmen  : \(f.yonetmen!.yonetmen_ad!)")
                        }
                    }
                    print("-------------------")
                    print("Başarı : \(cevap.success!)")
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
}
