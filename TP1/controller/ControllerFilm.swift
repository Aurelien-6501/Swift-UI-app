//
//  ControllerFilm.swift
//  TP1
//
//  Created by digital on 05/06/2023.
//

import Foundation
import SwiftUI

//Request to catch movie
func fetchFilm(idFilm:Int) async -> ResponseFilm?{
    let apiUrl = URL(string: "https://api.themoviedb.org/3/movie/"+String(idFilm)+"%20?api_key=9a8f7a5168ace33d2334ba1fe14a83fb&append_to_response=videos\(currentLocale)")!
    let session = URLSession.shared
    do {
        let request = URLRequest(url: apiUrl)
        let (data, _) = try await session.data(for: request)
        let responseFilm = try JSONDecoder().decode(ResponseFilm.self, from:data)
        return responseFilm
            
    } catch {
        print("Erreur : \(error)")
    }
    return nil
}

// Request to catch trailer
func bandeAnnonce(videos:[VideoType]){
    @Environment(\.openURL) var openURL

    let trailer = (videos.filter{ $0.type?.lowercased() == "trailer"})
    if let url = trailer.first{
        let trailerKey = url.key
        if let trailerNotNull = trailerKey{
        openURL(URL(string: "https://youtube.com/watch?v=" + String(trailerNotNull))!)
        }
    }
}


