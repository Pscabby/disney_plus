//
//  Cocolist.swift
//  disney_plus
//
//  Created by Abby on 2022/12/18.
//

import SwiftUI

struct Cocolist: View {
    var body: some View {
        NavigationLink{
            Songview(songs: .coco)
        }label: {
            movierow(movie: .coco)
        }
    }
}

struct Cocolist_Previews: PreviewProvider {
    static var previews: some View {
        Cocolist()
    }
}
