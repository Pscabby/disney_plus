//
//  SignUp.swift
//  disney_plus
//
//  Created by Abby on 2022/12/18.
//

import SwiftUI

struct SignUp: View {
    @State private var issign=false
    @State private var showAltert=false
    @State private var who=0
    @State private var name=""
    @State private var email=""
    @State private var password=""
    @State private var alertText=""
    let role=["Hodi","Airel","Areil2","Bas","bell","duck","duck2","elsa2","mama","Mickey","Minnie","pela","three"]
    var body: some View {
        NavigationView{
            ZStack{
                LinearGradient(gradient: Gradient(colors: [.blue,.pink]), startPoint: UnitPoint(x: 0, y: 0), endPoint: UnitPoint(x: 1, y: 1))
                    .ignoresSafeArea()
                    .opacity(0.3)
                VStack{
                    Text("Sign up")
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
                                .stroke(Color.yellow,lineWidth: 5)
                        }
                        .padding()
                    
                    TextField("Email", text: $email, prompt: Text("email"))
                        .padding()
                        .cornerRadius(20)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.blue,lineWidth: 5)
                        }
                        .padding(.horizontal)
                    
                    TextField("Password", text: $password, prompt: Text("Password"))
                        .padding()
                        .cornerRadius(20)
                        .overlay {
                            RoundedRectangle(cornerRadius: 20)
                                .stroke(Color.purple,lineWidth: 5)
                        }
                        .padding()
                    
                    Button {
                        creat()
                    } label: {
                        Text("Submit")
                            .font(.custom("Imagine Serif Stamp Rough", size: 20))
                            .foregroundColor(.pink)
                    }
                    .buttonStyle(.bordered)
                    .buttonBorderShape(.capsule)
                    .alert(alertText, isPresented: $showAltert, actions: {
                        Button("OK!") {}})
                    
                    if !issign{
                        NavigationLink {
                            login()
                        } label: {
                            Text("Have an account?")
                                .font(.custom("Imagine Serif Stamp Rough", size: 20))
                        }.padding()
                    }
                    
                    if issign{
                        NavigationLink {
                            ContentView()
                        } label: {
                            Text("Let's start!")
                                .font(.custom("Imagine Serif Stamp Rough", size: 20))
                                .foregroundColor(.purple)
                        }.padding()
                    }
                }
            }
        }.navigationTitle("Sign up")
    }
    
     func creat(){
        let url = URL(string: "https://favqs.com/api/users")!
        var request=URLRequest(url: url)
        request.httpMethod="post"
        request.addValue("Token token=12fdaf881b00171d1a0add24d25dd8f5", forHTTPHeaderField: "Authorization")
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
         let userBody=CreatUser(user: Users(login: name, email: email, password: password))
        let data=try?JSONEncoder().encode(userBody)
        request.httpBody=data

        URLSession.shared.dataTask(with: request){
            data,response,error in
            if let data{
                do{
                    let dic=try JSONDecoder().decode(catcherror.self, from: data)
                    print(dic)
                    showAltert=true
                    if dic.login==nil{
                        alertText=dic.message ?? ""
                    }else{
                        alertText="Hi \(dic.login ?? "") !"
                        issign=true
                    }
                }catch{
                    print(error)
                }
            }
        }.resume()
    }
}

struct SignUp_Previews: PreviewProvider {
    static var previews: some View {
        SignUp()
    }
}
