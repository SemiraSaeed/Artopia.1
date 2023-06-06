//
//  trail.swift
//  Artopia
//
//  Created by Samira Omer on 30/03/2023.
//

import Foundation
import SwiftUI
struct SearchAndProfil : View{
    @State private var searchText = ""
    @State var years: String
    var body: some View {
        ZStack{
            VStack{
                Image("abstract11")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                .edgesIgnoringSafeArea(.top)
                Spacer()
            }
            VStack{
                Spacer()
//                descriptionView(thoughts: "").offset(y: -1)
                
            }
           
      }
                
    }
    
}
struct descriptionVie2: View {
    @State var years: String

    var body: some View {
     
            VStack(alignment: .leading, spacing: 15){
                
                HStack{
                    Text("The Distance")
                        .font(.title)
                        .fontWeight(.bold)
                    Spacer()
                    Image(systemName: "heart")
                        .font(.title)
                        .fontWeight(.semibold)
                    
                }
                
                Text("Semira Saeed") .font(.title3)
                    .fontWeight(.semibold)
                Text("Description")
                Text("Paint is any pigmented liquid, liquefiable, or solid mastic composition that, after application to a substrate in a thin layer, converts to a solid film. ").foregroundColor(Color("myblue").opacity(0.6))
                Text("How does it make you feal?").foregroundColor(Color("myblue"))
                
//                TextField("", text: $years).frame(height: 95.0)
//                    .multilineTextAlignment(.leading)
                TextField("", text: $years).multilineTextAlignment(.leading)
                    .padding(10).frame(height: 79, alignment: .top)
                .overlay(
                // Add the outline
                    RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("myblue"), lineWidth: 2)
                )
                
                
                
                
            }.padding(30)
                .background(.white)
                .cornerRadius(40)
        
        
    }

}
    
struct SearchAndProfil_Previews: PreviewProvider {
    static var previews: some View {
        SearchAndProfil(years: "")
    }

}

