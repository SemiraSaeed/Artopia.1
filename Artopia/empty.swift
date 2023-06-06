//
//  empty.swift
//  Artopia
//
//  Created by Samira Omer on 11/03/2023.
//

import SwiftUI

struct empty: View {
    var gridItems: GridItem
    
  
   
    var body: some View {
        
        
        
        VStack{
            GeometryReader { reader in
                
                //                Image(imagstring)
                //            Image(gridItem.imgString)
                Image(gridItems.imgString)
                    .resizable()
                    .scaledToFill()
                    .cornerRadius(19)
                    .aspectRatio(contentMode: .fit)
                    .frame(width: reader.size.width,
                           height: reader.size.height,
                           alignment: .center)
                
                    .frame(width: .infinity)
                
                
                
            }
            
            descriptionView2(years: "")
            
        }.padding()
        
        
    }
}

//struct descriptionView: View {
//    @State var thoughts: String
//
//    var body: some View {
//
//            VStack(alignment: .leading, spacing: 15){
//
//                HStack{
//                    Text("The Distance")
//                        .font(.title)
//                        .fontWeight(.bold)
//                    Spacer()
//                    LikeButton()
//                        .font(.title)
//                        .fontWeight(.semibold)
//
//                }
//
//                Text("Semira Saeed") .font(.title3)
//                    .fontWeight(.semibold)
//                Text("Description")
//                Text("Paint is any pigmented liquid, liquefiable, or solid mastic composition that, after application to a substrate in a thin layer, converts to a solid film. ").foregroundColor(Color("myblue").opacity(0.6))
//                Text("How does it make you feal?").foregroundColor(Color("myblue"))
//
////                TextField("", text: $years).frame(height: 95.0)
////                    .multilineTextAlignment(.leading)
//
//
//                //alignment is top to make the text strat on the top right corner
//                TextField("", text: $thoughts, axis: .vertical).lineLimit(6)
//                    .padding(10).frame(height: 79, alignment: .top)
//                .overlay(
//                // Add the outline
//                    RoundedRectangle(cornerRadius: 8)
//                    .stroke(Color("myblue"), lineWidth: 2)
//                )
////                TextField("Description*", text: $Description, axis: .vertical) .lineLimit(4).foregroundColor(.black)
////                    .padding(.vertical).frame(height: 99 , alignment: .top)
////                .overlay(
////                // Add the outline
////                    RoundedRectangle(cornerRadius: 8)
////                    .stroke(Color("myblue"), lineWidth: 2).frame(width: 349)
////                )
//
//
//
//
//            }.padding(30)
//                .background(.white)
//                .cornerRadius(40)
//
//
//    }
//
//}
//
//
////struct empty_Previews: PreviewProvider {
////    static var previews: some View {
////        empty(gridItems: gridItems)
////    }
////}
//
