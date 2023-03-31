//
//  NewPostView2.swift
//  Artopia
//
//  Created by Samira Omer on 31/03/2023.
//

import SwiftUI

struct trail2: View {
    var body: some View {
        ScrollView{
            VStack(spacing: 13){
                VStack{
                    Image("abstract11")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .cornerRadius(19)
                        .frame(width: .infinity)
                }
                
                VStack{
                    Spacer()
                    descriptionView2(years: "")
                    
                }
                
            }
            
        }.padding(.horizontal, 40)
        
    }
}
struct descriptionView2: View {
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
                Text("Description").foregroundColor(Color("myblue"))
                Text("Paint is any pigmented liquid, liquefiable, or solid mastic composition that, after application to a substrate in a thin layer, converts to a solid film. ").foregroundColor(Color("myblue").opacity(0.6))
                Text("How does this paint make you feel?").foregroundColor(Color("myblue"))
                
//                TextField("", text: $years).frame(height: 95.0)
//                    .multilineTextAlignment(.leading)
                TextField("", text: $years)
                    .padding(10).frame(height: 79)
                .overlay(
                // Add the outline
                    RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("myblue"), lineWidth: 2)
                )
                
                
                
                
            }
               
        
        
    }

}
    

struct trail2_Previews: PreviewProvider {
    static var previews: some View {
        trail2()
    }
}
