//
//  ControllerHome.swift
//  TP1
//
//  Created by digital on 05/06/2023.
//

import Foundation

// Request to catch category
func fetchCategory() async -> CategoryResponse?{
    let apiUrl = URL(string: "https://api.themoviedb.org/3/genre/movie/list?language=en?&api_key=9a8f7a5168ace33d2334ba1fe14a83fb")!
    let session = URLSession.shared
    do {
        let request = URLRequest(url: apiUrl)
        let (data, _) = try await session.data(for: request)
        let responseFilm = try JSONDecoder().decode(CategoryResponse.self, from:data)
        return responseFilm
        
    } catch {
        print("Erreur : \(error)")
    }
    return nil
}

// Request to catch movie by popularity and filtre with the category
func fetchGenres(idCategory:Int?) async -> DataFilmResponse?{
    
    var apiUrl = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=9a8f7a5168ace33d2334ba1fe14a83fb&sort_by=popularity.desc")!
    
    if(idCategory != nil){
        if let id = idCategory {
            apiUrl = URL(string: "https://api.themoviedb.org/3/discover/movie?api_key=9a8f7a5168ace33d2334ba1fe14a83fb&sort_by=popularity.desc&with_genres=" + String(id))!
        }
    }

    let session = URLSession.shared
    do {
        let request = URLRequest(url: apiUrl)
        let (data, _) = try await session.data(for: request)
        let responseFilm = try JSONDecoder().decode(DataFilmResponse.self, from:data)
        return responseFilm
    } catch {
        print("Erreur : \(error)")
    }
    return nil
}

