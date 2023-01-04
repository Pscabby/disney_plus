//
//  ContentView.swift
//  disney_plus
//
//  Created by Abby on 2022/12/6.
//

import SwiftUI
import Foundation

struct ContentView: View {
    @StateObject private var order = Order()
    var body: some View {
        TabView{
            movielist()
                .tabItem {
                    Label("Song", systemImage: "music.note.list")
                }
            DollsView()
                .tabItem {
                    Label("Buy", systemImage: "cart")
                }
            OrderView()
                .tabItem {
                    Label("Order", systemImage: "basket")
                }
            QRcode()
                .tabItem {
                    Label("QRcode", systemImage: "qrcode.viewfinder")
                }
        }.environmentObject(order)
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView {
            ContentView()
        }
    }
}
