//
//  SongRow.swift
//  disney_plus
//
//  Created by Abby on 2022/12/14.
//

import SwiftUI
import AVFoundation

struct SongRow: View {
    let item:more
    var body: some View {
        HStack{
            AsyncImage(url:  item.artworkUrl60){ phase in
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
            .frame(width: 100,height: 100)
            .clipShape(Rectangle())
            .overlay(Rectangle().stroke(Color.white,lineWidth: 4))
            //.cornerRadius(20)
            .shadow(radius: 10)
            .padding(.trailing)
            
            Text(item.trackName)
                .font(.custom("Travel October", size: 30))
                .foregroundColor(.primary)
        }
    }
}

struct SongRow_Previews: PreviewProvider {
    static var previews: some View {
        SongRow(item: .preview)
    }
}
