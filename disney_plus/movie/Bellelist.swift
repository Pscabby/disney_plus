//
//  Bellelist.swift
//  disney_plus
//
//  Created by Abby on 2022/12/18.
//

import SwiftUI

struct Bellelist: View {
    var body: some View {
        NavigationLink{
            Songview(songs: .belle)
        }label: {
            movierow(movie: .belle)
        }
    }
}

struct Bellelist_Previews: PreviewProvider {
    static var previews: some View {
        Bellelist()
    }
}
