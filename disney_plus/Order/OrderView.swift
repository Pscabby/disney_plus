//
//  OrderView.swift
//  disney_plus
//
//  Created by Abby on 2023/1/3.
//

import SwiftUI

struct OrderView: View {
    @State private var items = [OrderData.Record]()
    @EnvironmentObject var order:Order
    var body: some View {
        VStack{
            List{
                ForEach(items,id:\.id){ doll in
                    OrderRow(dolls: doll)
                }
            }.onAppear{
                fetchOrder()
            }
            .refreshable {
                fetchOrder()
            }
            HStack{
                Spacer()
                Image(systemName: "heart.fill")
                    .font(.custom("", size:30))
                Spacer()
                VStack{
                    Text("Total: ")
                        .font(.custom("Kindegarten", size: 25))
                        .foregroundColor(.pink)
                    HStack{
                        Image(systemName: "dollarsign")
                            .font(.custom("Kindegarten", size: 20))
                        Text("\(order.total,specifier: "%.4f")")
                            .font(.custom("Kindegarten", size: 25))
                            .foregroundColor(.pink)
                    }
                }
                Spacer()
                Image(systemName: "heart.fill")
                    .font(.custom("", size:30))
                Spacer()
            }
        }
    }
    
    func fetchOrder(){
        let url = URL(string: "https://api.airtable.com/v0/apprf08CIUMwRfaSW/buy")!
        var request = URLRequest(url: url)
        request.setValue("Bearer keyiuq1oLYBBO7G8c", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            if let data{
                print(String(data: data, encoding: .utf8)!)
                let decoder=JSONDecoder()
                do{
                    let Buydata = try decoder.decode(OrderData.self, from: data)
                    items = Buydata.records
                }catch{
                    print(error)
                }
            }else if let error{
                print(error)
            }
        }.resume()
    }
    
    func deleteItem(urlstr:String){
        let url=URL(string:urlstr)!
        var request = URLRequest(url: url)
        request.setValue("Bearer keyiuq1oLYBBO7G8c", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod="DELETE"
        URLSession.shared.dataTask(with: request){(
            data,response,error) in
            if let response = response as? HTTPURLResponse, error == nil {
                print("Delete success")
                print(response.statusCode)
            }else if let error{
                print(error)
            }
        }.resume()
    }
}

struct OrderView_Previews: PreviewProvider {
    static var previews: some View {
        OrderView()
            .environmentObject(Order())
    }
}
