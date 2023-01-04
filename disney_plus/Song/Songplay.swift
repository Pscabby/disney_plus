//
//  Songplay.swift
//  disney_plus
//
//  Created by Abby on 2022/12/16.
//

import SwiftUI
import AVFoundation

struct Songplay: View {
    let item :more
    @State private var player:AVPlayer?
    @State private var play:Bool=false
    @State private var volume:Float = 1
    var body: some View {
        ZStack {
            Color.blue.opacity(0.3)
                .ignoresSafeArea()
            VStack{
                Text(item.trackName)
                    .font(.custom("Travel October", size: 40))
                    .padding()
                
                Text(item.collectionName)
                    .font(.custom("Imagine Serif Stamp Rough", size: 16))
                    .padding(.leading,200)
                
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
                .frame(width: 200,height: 200)
                .clipShape(Rectangle())
                .overlay(Rectangle().stroke(Color.white,lineWidth: 4))
                //.cornerRadius(20)
                .shadow(radius: 10)
                .padding()
                //Text(item.releaseDate,style: .date)
                    //.foregroundColor(.gray)
                    //.padding(.leading,200)
                Button{
                    player=AVPlayer(url: item.previewUrl)
                    play.toggle()
                    play ? player?.play() : player?.pause()
                }label: {
                    Image(systemName: play ? "pause.circle.fill":"play.circle.fill")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 70,height:70)
                        .foregroundColor(.brown)
                }
                
                Stepper("Volume", value: $volume,in: 0...10)
                    .onChange(of: volume) { newValue in
                        player?.volume=volume
                    }
                    .padding()
                
                ShareLink(item: item.trackViewUrl)
            }
            .onDisappear{
                player?.pause()
        }
        }
    }
}

struct Songplay_Previews: PreviewProvider {
    static var previews: some View {
        Songplay(item: .preview)
    }
}
