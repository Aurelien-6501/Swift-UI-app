//
//  Content2View.swift
//  TP1
//
//  Created by digital on 22/05/2023.
//

import SwiftUI

struct ViewHome: View {
    @State var movie: DataFilmResponse? = nil;
    
    @State var idCategory: Int?
    init(idCategory:Int?){
        self.idCategory = idCategory
    }
    @State var category:CategoryResponse? = nil;
    
    var body: some View {
        NavigationView{
        VStack(alignment: .center){
            
            Text("Movies List")
                .font(.headline)
                .multilineTextAlignment(.center)
                .padding(.bottom, 10.0)
            
            ScrollView(.horizontal){
                HStack{
                    //all the categories
                    if let categorys = self.category?.genres {
                        ForEach(categorys, id: \.self) {
                            catego in
                            if let id = catego.id , let name = catego.name {
                                Button(name){
                                    self.idCategory = id
                                    Task{
                                        self.movie = await fetchGenres(idCategory: idCategory)
                                    }
                                    
                                }
                                .padding(.horizontal, 10.0)
                            }
                        }
                    }
                }.padding(.bottom, 10.0).onAppear{
                    Task{
                        category = await fetchCategory()
                    }
                }
            }
            .padding(0.0)
                
                List{
                    if let movies = self.movie?.results {
                        ForEach(movies, id : \.self){
                            movie in
                            if let title = movie.original_title , let date = movie.release_date, let image_path = movie.poster_path, let _  = movie.adult, let description = movie.overview, let id = movie.id{
                                //Picture of the movie
                                HStack{
                                    AsyncImage(url:URL(string:"https://www.themoviedb.org/t/p/w600_and_h900_bestv2/"+image_path))
                                    { image in image
                                            .resizable()
                                            .aspectRatio(contentMode: .fill)
                                    } placeholder: {
                                        Image(systemName: "photo.fill")
                                    }.frame(width: 100, height: 100)                .padding(.vertical, 30.0)
                                    
                                    VStack{
                                        NavigationLink(title + " " + date){
                                            ViewFilm(idFilm: id)
                                        }
                                        .padding(.vertical, 10.0)
                                        
                                        Text(description).lineLimit(3).padding(.leading, 10.0)
                                    }
                                }
                            }
                        }
                    }
                }
            }
        }.onAppear{
            Task{
                movie = await  fetchGenres(idCategory: idCategory);
            }
        }
    }
}

struct Content2View_Previews: PreviewProvider {
    static var previews: some View {
        ViewHome(idCategory: nil)
    }
}
