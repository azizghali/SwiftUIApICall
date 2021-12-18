//
//  URLImageView.swift
//  SwiftUIApICall
//
//  Created by ADMIN on 18/12/2021.
//

import SwiftUI

struct URLImageView: View{
    let urlString: String
    @State var data: Data?

    
    var body: some View{
        if let data = data, let uiimage = UIImage(data: data) {
            Image(uiImage: uiimage)
                .resizable()
                .aspectRatio( contentMode:.fill)
                .frame(width: 130, height: 70, alignment: .center)
                .background(Color.red)
        }
        else{
            
            Image(systemName: "eye")
                .resizable()
                .aspectRatio( contentMode:.fit)
                .frame(width: 130, height: 70, alignment: .center)
                .background(Color.red)
                .onAppear {
                    fetchData()
                }
        }

    }
    
    private func fetchData(){
        guard let url = URL(string: urlString) else {
            return
        }
        let task = URLSession.shared.dataTask(with: url) { data, _, _ in
            self.data = data
        }
        task.resume()
    }
}
