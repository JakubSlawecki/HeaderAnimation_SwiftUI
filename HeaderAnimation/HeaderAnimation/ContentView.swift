//
//  ContentView.swift
//  HeaderAnimation
//
//  Created by Jakub Slawecki on 30/08/2020.
//  Copyright © 2020 Jakub Slawecki. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        Home()
    }
}


struct Home: View {
    var edges = UIApplication.shared.windows.first?.safeAreaInsets
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .top)) {
            Color.black
            
            ScrollView(showsIndicators: false) {
                VStack(spacing: 0) {
                    GeometryReader { geometry in
                        VStack {
                            Image("header")
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: UIScreen.main.bounds.width, height: geometry.frame(in: .global).minY > 0 ? geometry.frame(in: .global).minY + UIScreen.main.bounds.height / 2.2 : UIScreen.main.bounds.height / 2.2)
                                .offset(y: -geometry.frame(in: .global).minY)
                                //.onChange(of: geometry.frame(in: .global).minY) {
                                    
                            //}
                        }
                        
                    }.frame(height: UIScreen.main.bounds.height / 2.2)
                    
                    VStack(spacing: 10) {
                        ForEach(songs, id: \.name) { song in
                            HStack(spacing: 15) {
                                
                                Image(song.songImage)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 55, height: 55)
                                    .cornerRadius(5)
                                
                                VStack(alignment: .leading, spacing: 5) {
                                    Text(song.name)
                                    Text(song.songAlbum)
                                        .font(.caption)
                                }.foregroundColor(.white)
                                
                                Spacer()
                            }
                                .padding(.horizontal)
                        }
                    }
                        .padding(.vertical)
                        .background(Color.black)
                }
            }
            
            HStack {
                Button(action: {}) {
                    HStack(spacing: 8) {
                        Image(systemName: "chevron.left")
                            .font(.system(size: 22, weight: .bold))
                        Text("Search")
                    }
                }
                Spacer()
                Button(action: {}) {
                    Image(systemName: "ellipsis")
                        .font(.system(size: 22, weight: .bold))
                }
               
            }
                .padding()
                .padding(.top, edges?.top)
                .foregroundColor(.white)
                .background(Color.white.opacity(0))
        }.edgesIgnoringSafeArea(.all)
    }
}










struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

// fake data

struct Song {
    var name: String
    var songImage: String
    var songAlbum: String
}


var songs = [
    Song(name: "Jumpsuit", songImage: "album", songAlbum: "Trench"),
    Song(name: "Levitate", songImage: "album", songAlbum: "Trench"),
    Song(name: "Morph", songImage: "album", songAlbum: "Trench"),
    Song(name: "My Blood", songImage: "album", songAlbum: "Trench"),
    Song(name: "Chlorine", songImage: "album", songAlbum: "Trench"),
    Song(name: "Smithernes", songImage: "album", songAlbum: "Trench"),
    Song(name: "Neon Gravestones", songImage: "album", songAlbum: "Trench"),
    Song(name: "The Hype", songImage: "album", songAlbum: "Trench"),
    Song(name: "Nico and the Niners", songImage: "album", songAlbum: "Trench"),
    Song(name: "Cut My Lip", songImage: "album", songAlbum: "Trench"),
    Song(name: "Bandito", songImage: "album", songAlbum: "Trench"),
    Song(name: "Pet Cheetah", songImage: "album", songAlbum: "Trench"),
    Song(name: "Legend", songImage: "album", songAlbum: "Trench"),
    Song(name: "Leave the City", songImage: "album", songAlbum: "Trench")
]
