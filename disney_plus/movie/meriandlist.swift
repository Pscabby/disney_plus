//
//  meriandlist.swift
//  disney_plus
//
//  Created by Abby on 2022/12/18.
//

import SwiftUI

struct meriandlist: View {
    var body: some View {
        NavigationLink{
            Songview(songs: .meriand)
        }label: {
            movierow(movie: .demomovie)
        }
    }
}

struct meriandlist_Previews: PreviewProvider {
    static var previews: some View {
        meriandlist()
    }
}
