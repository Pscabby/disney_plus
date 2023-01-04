//
//  DollsRow.swift
//  disney_plus
//
//  Created by Abby on 2022/12/18.
//

import SwiftUI

struct DollsRow: View {
    let dolls:Dollsdata.Record
    @State private var amounts=0
    @State private var showDetail=false
    var body: some View {
        Button {
            showDetail=true
        } label: {
            VStack{
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
            }
        }.sheet(isPresented: $showDetail) {
            BuyView(dolls: dolls)
        }

        Text("SIZE: \(dolls.fields.size,specifier: "%.2f")")
        Text("$\(dolls.fields.price,specifier: "%.2f")")
            .foregroundColor(Color.gray)
        ShareLink(item:dolls.fields.picture[0].url,preview:SharePreview(dolls.fields.name, image: Image(systemName: "heart.fill")))
    }
}

//struct DollsRow_Previews: PreviewProvider {
//    static var previews: some View {
//        DollsRow()
//    }
//}
