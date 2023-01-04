//
//  Songview.swift
//  disney_plus
//
//  Created by Abby on 2022/12/11.
//

import SwiftUI

struct Songview: View {
    @State private var items=[more]()
    let songs:EachSongdata
    var body: some View {
            List{
                ForEach(items,id: \.trackId) { item in
                    NavigationLink{
                        Songplay(item: item)
                    }label: {
                        SongRow(item: item)
                    }
                }
                
            }
            
            .onAppear{
                if items.isEmpty{
                    fetchItems(term: "swift")
                }
            }
            .navigationTitle(songs.name)
            .navigationBarTitleDisplayMode(.inline)
            .scrollContentBackground(.hidden)
            .background(Color.pink.opacity(0.3))
        }
    
    func fetchItems(term:String){
        if let urlstr=songs.url.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed),
         let url=URL(string: urlstr){
            URLSession.shared.dataTask(with:url){ data,response,error in
                if let data{
                    let decoder=JSONDecoder()
                    decoder.dateDecodingStrategy = .iso8601
                    do{
                        let song = try
                        decoder.decode(Songdata.self, from: data)
                        items = song.results
                    }catch{
                        print(error)
                    }
                }else if let error{
                    print(error)
                }
            }.resume()
        }
    }
}
struct Songview_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
            Songview(songs: .meriand)
        }
    }
}
