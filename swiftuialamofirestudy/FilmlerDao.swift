//
//  FilmlerDao.swift
//  WebservisKullanimi
//
//  Created by Kasım on 25.02.2023.
//

import Foundation

class FilmlerDao {
    func filmleriYukle(){
        let url = URL(string: "http://kasimadalan.pe.hu/filmler/tum_filmler.php")!
        
        URLSession.shared.dataTask(with: url){ data,response,error in
            do{
                let cevap = try JSONDecoder().decode(FilmlerCevap.self, from: data!)
                
                if let liste = cevap.filmler {
                    for f in liste {
                        print("-------------------")
                        print("Film Id        : \(f.film_id!)")
                        print("Film Ad        : \(f.film_ad!)")
                        print("Film Yıl       : \(f.film_yil!)")
                        print("Film Resim     : \(f.film_resim!)")
                        print("Film Kategori  : \(f.kategori!.kategori_ad!)")
                        print("Film Yönetmen  : \(f.yonetmen!.yonetmen_ad!)")
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
