//
//  OrderRow.swift
//  disney_plus
//
//  Created by Abby on 2023/1/3.
//

import SwiftUI

struct OrderRow: View {
    let dolls:OrderData.Record
    @State private var isdelete=false
    @EnvironmentObject var order:Order
    var body: some View {
        HStack{
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
            .frame(width: 100,height: 80)
            VStack(alignment: .leading){
                HStack{
                    Text("Name: ")
                        .foregroundColor(.purple)
                        .fontWeight(.bold)
                    Text("\(dolls.fields.name)")
                        .font(.custom("Kindegarten", size: 20))
                }.padding(.vertical)
                HStack{
                    Text("Purchaser: ")
                        .foregroundColor(.purple)
                        .fontWeight(.bold)
                    Text("\(dolls.fields.buyer)")
                        .font(.custom("Kindegarten", size: 20))
                }
                HStack{
                    Text("Phone: ")
                        .foregroundColor(.purple)
                        .fontWeight(.bold)
                    Text("\(dolls.fields.phone)")
                        .font(.custom("Kindegarten", size: 20))
                }.padding(.vertical)
                HStack{
                    Button {
                        deleteItem(urlstr: "https://api.airtable.com/v0/apprf08CIUMwRfaSW/buy/" + dolls.id)
                        order.total-=Double(dolls.fields.amount)*dolls.fields.price
                        isdelete=true
                    } label: {
                        
                        Image(systemName: "minus.circle.fill")
                            .foregroundColor(.red)
                            .font(.largeTitle)
                    }
                    .alert("DELETE SUCCESS!", isPresented: $isdelete) {
                        Button("OK!"){}
                    }
                    
                    Spacer()
                    Image(systemName: "cart")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                    Text("x \(dolls.fields.amount)")
                        .fontWeight(.bold)
                        .foregroundColor(.blue)
                }.padding(.horizontal)
            }
        }
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

//struct OrderRow_Previews: PreviewProvider {
//    static var previews: some View {
//        OrderRow()
//    }
//}
