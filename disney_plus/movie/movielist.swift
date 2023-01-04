//
//  movielist.swift
//  disney_plus
//
//  Created by Abby on 2022/12/18.
//

import SwiftUI

struct movielist: View {
    var body: some View {
            List{
                Cocolist()
                lionlist()
                meriandlist()
                Elsalist()
                Bellelist()
            }
            .navigationTitle("Disney List")
            .navigationBarTitleDisplayMode(.inline)
    }
}

struct movielist_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            movielist()
        }
        .navigationTitle("Disney List")
        .navigationBarTitleDisplayMode(.inline)
    }
}
