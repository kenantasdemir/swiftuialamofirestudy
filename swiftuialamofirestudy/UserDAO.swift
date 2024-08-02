//
//  UserDAO.swift
//  swiftuialamofirestudy
//
//  Created by kenan on 2.08.2024.
//

import Foundation
import Alamofire

class UserDAO{
    func getAllUsers(){
        let url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php"
        AF.request(url,method:.get).response{ response in
            if let data = response.data {
                do{
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let userList = cevap.kisiler{
                        for user in userList{
                            print("-------------------")
                            print("User ID: \(user.kisi_id!)")
                            print("User Name: \(user.kisi_ad!)")
                            print("User Phone: \(user.kisi_tel!)")
                        }
                    }
                    print("---------------------")
                    print("Success \(cevap.success!)")
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
    }
    
    func saveUser(user_name:String,user_phone:String){
        let url = "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php"
        let params:Parameters = ["kisi_ad":user_name,"kisi_tel":user_phone]
    
        AF.request(url,method: .post,parameters: params).response{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("-------------------")
                    print("Success: \(cevap.success!)")
                    print("Message: \(cevap.message!)")
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    
    }
    
    func updateUser(user_id:String,user_name:String,user_phone:String){
        let url = "http://kasimadalan.pe.hu/kisiler/update_kisiler.php"
        let params:Parameters = ["kisi_id":user_id,"kisi_ad":user_name,"kisi_tel":user_phone]
        
        AF.request(url,method: .post,parameters: params).response{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("--------------------")
                    print("Success: \(cevap.success!)")
                    print("Message: \(cevap.message!)")
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func removeUser(user_id:String){
        let url = "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php"
        let params:Parameters = ["kisi_id":user_id]
        
        AF.request(url,method: .post,parameters: params).response{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(CRUDResponse.self, from: data)
                    print("-----------------")
                    print("Success: \(cevap.success!)")
                    print("Message: \(cevap.message!)")
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func searchUser(user_name:String){
        let url = "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php"
        let params:Parameters = ["kisi_ad":user_name]
    
        AF.request(url,method: .post,parameters: params).response{ response in
            if let data = response.data{
                do{
                    let cevap = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    if let userList = cevap.kisiler{
                        for user in userList{
                            print("-------------------")
                            print("User ID: \(user.kisi_id!)")
                            print("User Name: \(user.kisi_ad!)")
                            print("User Phone: \(user.kisi_tel!)")
                        }
                    }
                    print("Success: \(cevap.success!)")
             
                }catch{
                    print(error.localizedDescription)
                }
            }
        }
    
    }
}
