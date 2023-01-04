//
//  movierow.swift
//  disney_plus
//
//  Created by Abby on 2022/12/18.
//

import SwiftUI

struct movierow: View {
    let movie:moviedata
    var body: some View {
        HStack{
            Image(movie.pic)
                .resizable()
                .scaledToFit()
                .frame(width: 100)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.white,lineWidth: 4))
                //.cornerRadius(20)
                .shadow(radius: 10)
                .padding(.trailing)
            Text(movie.name)
                .font(.custom("Travel October", size: 30))
                .foregroundColor(.primary)
                
            
        }
    }
}

struct movierow_Previews: PreviewProvider {
    static var previews: some View {
        movierow(movie: .demomovie)
    }
}
