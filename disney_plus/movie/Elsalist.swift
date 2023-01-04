//
//  Elsalist.swift
//  disney_plus
//
//  Created by Abby on 2022/12/18.
//

import SwiftUI

struct Elsalist: View {
    var body: some View {
        NavigationLink{
            Songview(songs: .elsa)
        }label: {
            movierow(movie: .demo2)
        }
    }
}

struct Elsalist_Previews: PreviewProvider {
    static var previews: some View {
        Elsalist()
    }
}
