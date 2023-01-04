//
//  login.swift
//  disney_plus
//
//  Created by Abby on 2022/12/7.
//

import SwiftUI

struct login: View {
    @State private var islogin=false
    @State private var showAlert=false
    @State private var name=""
    @State private var password=""
    @State private var alertText=""
    @State private var who=0
    let role=["Hodi","Airel","Areil2","Bas","bell","duck","duck2","elsa2","mama","Mickey","Minnie","pela","three"]
    var body: some View {
        ZStack{
            LinearGradient(gradient: Gradient(colors: [.yellow,.pink]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
                .ignoresSafeArea()
                .opacity(0.3)
            VStack{
                Text("Login")
                    .font(.custom("Genre Line Demo", size: 40))
                    .foregroundColor(.purple)
                Image(role[who])
                    .resizable()
                    .scaledToFit()
                    .clipShape(Circle())
                    .frame(width: 200,height: 200)
                Picker(selection: $who) {
                    ForEach(role.indices){item in
                        Text(role[item])
                    }
                } label: {
                    Text("Head shot")
                }
                TextField("User Name", text: $name, prompt: Text("enter your name"))
                    .padding()
                    .cornerRadius(20)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.blue,lineWidth: 5)
                    }
                    .padding()
                TextField("Password", text: $password, prompt: Text("Password"))
                    .padding()
                    .cornerRadius(20)
                    .overlay {
                        RoundedRectangle(cornerRadius: 20)
                            .stroke(Color.pink,lineWidth: 5)
                    }
                    .padding()
                Button {
                    check()
                } label: {
                    Text("Submit")
                        .font(.custom("Imagine Serif Stamp Rough", size: 20))
                        .foregroundColor(.purple)
                }
                .buttonStyle(.bordered)
                .buttonBorderShape(.capsule)
                .padding()
                .alert(alertText, isPresented: $showAlert, actions: {
                    Button("OK!") {}})
                
                if islogin{
                    NavigationLink {
                        ContentView()
                    } label: {
                        Text("Let's start!")
                            .font(.custom("Imagine Serif Stamp Rough", size: 20))
                    }
                }
            }
        }
    }
    
    func check(){
        let url = URL(string: "https://favqs.com/api/session")!
        var request=URLRequest(url: url)
        request.httpMethod="post"
        request.addValue("Token token=12fdaf881b00171d1a0add24d25dd8f5", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let userBody=ConfirmUser(user: confirm(login: name, password: password))
        let data=try?JSONEncoder().encode(userBody)
        request.httpBody=data

        URLSession.shared.dataTask(with: request){
            data,response,error in
            if let data{
                do{
                    let dic=try JSONDecoder().decode(catcherror2.self, from: data)
                    print(dic)
                    showAlert=true
                    if dic.login==nil{
                        alertText=dic.message ?? ""
                    }else{
                        alertText="Hi \(dic.login ?? "")"
                        islogin=true
                    }
                }catch{
                    print(error)
                }
            }
        }.resume()
    }
}

struct login_Previews: PreviewProvider {
    static var previews: some View {
        login()
    }
}
