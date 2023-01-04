//
//  DollsView.swift
//  disney_plus
//
//  Created by Abby on 2022/12/17.
//

import SwiftUI

struct DollsView: View {
    @State private var items = [Dollsdata.Record]()
    @State private var searchText=""
    @State private var showError=false
    var body: some View {
        let  columns=Array(repeating: GridItem(spacing:4), count: 1)
        NavigationView {
            ScrollView{
                LazyVGrid(columns:columns ,spacing: 10){
                    ForEach(searchResults,id: \.id){ doll in
                        DollsRow(dolls: doll)
                    }
                }
            }
            .searchable(text: $searchText, prompt: "Search")
            .onSubmit(of:.search) {
                if searchResults.isEmpty{
                    showError=true
                }
            }
            .alert("Can't find!", isPresented: $showError, actions: {
                        Button("OK") { }
                    })
            .onAppear{
                if items.isEmpty{
                    fetchItems(term: "swift")
                }
            }
        }
    }
    
    var searchResults:[Dollsdata.Record]{
        if searchText.isEmpty{
            return items
        } else{
            return items.filter{$0.fields.type.contains(searchText)}
            }
        }
    
    func fetchItems(term:String){
        let url = URL(string: "https://api.airtable.com/v0/apprf08CIUMwRfaSW/disney_dolls")!
        var request = URLRequest(url: url)
        request.setValue("Bearer keyiuq1oLYBBO7G8c", forHTTPHeaderField: "Authorization")
        URLSession.shared.dataTask(with: request) { (data, response, error) in
        
            if let data{
                print(String(data: data, encoding: .utf8)!)
                let decoder=JSONDecoder()
                do{
                    let dollsdata = try decoder.decode(Dollsdata.self, from: data)
                    items = dollsdata.records
                }catch{
                    print(error)
                }
            }else if let error{
                print(error)
            }
        }.resume()
    }
}

struct DollsView_Previews: PreviewProvider {
    static var previews: some View {
        DollsView()
    }
}
