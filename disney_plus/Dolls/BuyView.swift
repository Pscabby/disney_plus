//
//  BuyView.swift
//  disney_plus
//
//  Created by Abby on 2023/1/1.
//

import SwiftUI

struct BuyView: View {
    let dolls:Dollsdata.Record
    @State private var name=""
    @State private var amount=0
    @State private var phone=""
    @State private var OrderAlert=false
    @State private var OrderShow=""
    @EnvironmentObject var order:Order
    var body: some View {
            ScrollView{
                AsyncImage(url:  dolls.fields.picture[0].url){ phase in
                    switch phase{
                    case.empty:
                        Color.gray
                    case.success(let image):
                        image
                            .resizable()
                    case.failure(_):
                        Image("default_pic")
                            .resizable()
                    @unknown default:
                        Image("default_pic")
                            .resizable()
                    }
                }
                .scaledToFill()
                .frame(width: 200,height: 200)
                .padding()
                Text(dolls.fields.name)
                    .fontWeight(.bold)
                Text("SIZE: \(dolls.fields.size,specifier: "%.2f")")
                Text("$\(dolls.fields.price,specifier: "%.2f")")
                    .foregroundColor(Color.gray)
                
                HStack{
                    ForEach(0..<dolls.fields.star){ i in
                        Image(systemName: "star.fill")
                            .frame(width: 30)
                            .foregroundColor(.blue)
                    }
                    ForEach(0..<(5-dolls.fields.star)){ i in
                        Image(systemName: "star")
                            .frame(width: 30)
                            .foregroundColor(.blue)
                    }
                }
                .padding()
                
                DisclosureGroup("Information"){
                    Text("Your Name:")
                        .padding()
                    TextField("Name", text: $name, prompt: Text("Your Name"))
                        .cornerRadius(20)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.brown,lineWidth: 5)
                        }
                        .padding(.horizontal)
                    Text("Phone:")
                        
                    TextField("Phone Number", text: $phone, prompt: Text("Phone Number"))
                        .keyboardType(.numberPad)
                        .cornerRadius(20)
                        .padding()
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.brown,lineWidth: 5)
                        }
                        .padding(.horizontal)
                }.padding()
                
                HStack{
                    Image(systemName: "cart")
                        .fontWeight(.bold)
                    Text("x \(amount)")
                        .fontWeight(.bold)
                }.padding()
                
                Stepper("Buying amount", value: $amount,in: 0...100)
                    .padding(.leading)
                
                Button("Submit"){
                    postItems(dolls: dolls, amount: amount,buyer: name,phone: phone)
                    order.total+=dolls.fields.price*Double(amount)
                }.alert(OrderShow, isPresented: $OrderAlert) {
                    Button("OK"){}
                }
            }
    }
    
    func postItems(dolls:Dollsdata.Record,amount:Int,buyer:String,phone:String){
        let buy=buydetail(dolls: dolls, amount: amount,buyer: buyer,phone: phone)
        let url=URL(string:"https://api.airtable.com/v0/apprf08CIUMwRfaSW/buy")!
        var request = URLRequest(url: url)
        request.setValue("Bearer keyiuq1oLYBBO7G8c", forHTTPHeaderField: "Authorization")
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod="POST"
        let encoder = JSONEncoder()
    //    let buy = buydata(records: [.init(id: dolls.id, fields: .init(name: dolls.fields.name, price: dolls.fields.price, picture: [.init(url: dolls.fields.picture[0].url)], amount: amounts))])
        request.httpBody = try? encoder.encode(buy)
        URLSession.shared.dataTask(with: request){(
            data,response,error) in
            if let data = data,
                   let content = String(data: data, encoding: .utf8) {
                    print(content)
                    OrderAlert=true
                    OrderShow="Receive Your Order!"
                }
            else if let error{
                print(error)
                OrderAlert=true
                OrderShow="Something Wrong!"
            }
        }.resume()
    }

    func buydetail(dolls:Dollsdata.Record,amount:Int,buyer:String,phone:String)->buydata{
        let buy = buydata(
            records: [.init(
                fields: .init(name: dolls.fields.name,
                              price: dolls.fields.price,
                              picture: [.init(url: dolls.fields.picture[0].url)],
                              amount: amount,buyer:buyer,phone: phone ))])
        return buy
    }
}

//struct BuyView_Previews: PreviewProvider {
//    static var previews: some View {
//        BuyView()
//    }
//}
