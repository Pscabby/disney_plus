//
//  lionlist.swift
//  disney_plus
//
//  Created by Abby on 2022/12/18.
//

import SwiftUI

struct lionlist: View {
    var body: some View {
        NavigationLink{
            Songview(songs: .lion)
        }label: {
            movierow(movie: .lion)
        }
    }
}

struct lionlist_Previews: PreviewProvider {
    static var previews: some View {
        lionlist()
    }
}
