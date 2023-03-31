//
//  empty.swift
//  Artopia
//
//  Created by Samira Omer on 11/03/2023.
//

import SwiftUI

struct empty: View {
    var gridItems: GridItem
    
    @State private var isActive : Bool = false
   
    var body: some View {
        ZStack{
            VStack{
                GeometryReader { reader in
                    
                    //                Image(imagstring)
                    //            Image(gridItem.imgString)
                    Image(gridItems.imgString)
                        .resizable()
                        .scaledToFill()
                        .frame(width: reader.size.width,
                               height: reader.size.height,
                               alignment: .center)
                    
                    
                    
                        .aspectRatio(contentMode: .fit)
                    .edgesIgnoringSafeArea(.top)}
                Spacer()
            }
            VStack{
                Spacer()
                descriptionView(years: "").offset(y: -1)
                
            }
           
          
        }
        
    }
}
struct descriptionView: View {
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
                TextField("", text: $years)
                    .padding(10).frame(height: 79)
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
    

//struct empty_Previews: PreviewProvider {
//    static var previews: some View {
//        empty(gridItems: gridItems)
//    }
//}

