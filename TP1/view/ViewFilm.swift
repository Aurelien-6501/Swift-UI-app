//
//  ContentView.swift
//  TP1
//
//  Created by digital on 04/04/2023.
//

import SwiftUI
import UIKit

struct ViewFilm: View{
    @State var movie: ResponseFilm? = nil;
    
    let idFilm: Int
    init(idFilm:Int){
        self.idFilm = idFilm
    }

    var body: some View {
        
        ScrollView{

            VStack   {
                //Movie poster
                if let movie = self.movie{
                    AsyncImage(url:URL(string:"https://www.themoviedb.org/t/p/w600_and_h900_bestv2/"+movie.poster_path))
                    { image in
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                    } placeholder: {
                        Image(systemName: "photo.fill")
                        
                    }.padding(.top, 50.0).frame(width: 200, height: 200)
                    
                    HStack(){
                        
                        VStack(){
                            //Title
                            Text(movie.title)
                                .fontWeight(.bold)
                                .multilineTextAlignment(.center)
                                .padding(.bottom, 10.0)
                            
                            
                            ScrollView(.horizontal){
                                
                                HStack(alignment: .center){
                                    //ForEach with all categories
                                    if let genres = self.movie?.genres {
                                        ForEach(genres, id: \.self){
                                            category in Text(category.name!).multilineTextAlignment(.center).frame(width: 120)
                                        }
                                    }
                                }
                            }
                            .padding(.top, 20.0).padding(.horizontal)
                            
                        } .padding(.top, 100.0)
                        
                    }
                    
                    HStack{
                        //return the release date and the duration of the movie
                        Text(movie.release_date)
                        Text(String(movie.runtime) + " mins")
                    }
                    .padding(.top, 20.0)
                    
                    VStack(){
                        HStack(){
                            
                            HStack{
                                Button("Play"){
                                    
                                }
                            }.multilineTextAlignment(.center)
                                .foregroundColor(Color.white)
                                .frame(width: 150, height: 30)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray).shadow(radius: 2))
                            
                            HStack{
                                //Button for the trailer
                                Button("Bande Annonce"){
                                    if let video = movie.videos?.results {
                                        bandeAnnonce(videos: video)
                                    }
                                }
                            }.multilineTextAlignment(.center)
                                .foregroundColor(Color.white)
                                .frame(width: 150, height: 30)
                                .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray).shadow(radius: 2))
                        }
                        .padding(.vertical, 10.0)
                        
                        .padding(.top, 5.0)
                        
                        HStack(){
                            //Description
                            Text(movie.overview)
                                .fixedSize(horizontal: false, vertical: true)
                                .multilineTextAlignment(.center)
                                .foregroundColor(.black)
                                .frame(width: 350)
                        }.padding(.top, 8.0).frame(width: 350)
                    }
                    
                    Spacer()
                }
            }.onAppear{
                Task{
                    movie = await fetchFilm(idFilm: idFilm)
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ViewFilm(idFilm: 466272)
    }
}


