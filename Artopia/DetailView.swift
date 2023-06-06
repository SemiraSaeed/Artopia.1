//
//  DetailView.swift
//  Artopia
//
//  Created by Samira Omer on 09/04/2023.
//

import SwiftUI

struct DetailView: View {
    
    let gridItem: GridItem
    
    var body: some View {
        VStack {
            Image(gridItem.imgString)
                .resizable()
                .aspectRatio(contentMode: .fit).cornerRadius(19)
            Text(gridItem.imgString)
                .font(.title)
                .fontWeight(.bold)
                .padding()
            HStack{
                Text("The Distance")
                    .font(.title)
                    .fontWeight(.semibold)
                Spacer()
                LikeButton()
                  
                    .font(.title)
                    .fontWeight(.semibold)

            }
            Text("Description goes here")
                .font(.body)
                .multilineTextAlignment(.center)
                .padding()
            Spacer()
        }.padding(.horizontal)
        
        .navigationBarTitle("", displayMode: .inline)
//        .navigationBarHidden(true)
    }
    
    func getItemView(gridItem: GridItem) -> some View {
        NavigationLink(destination: DetailView(gridItem: gridItem)) {
            GeometryReader { reader in
                Image(gridItem.imgString)
                    .resizable()
                    .frame(width: reader.size.width, height: reader.size.height, alignment: .center)
                    .aspectRatio(contentMode: .fit)
            }
            .frame(height: gridItem.height)
            .frame(maxWidth: .infinity)
            .clipShape(RoundedRectangle(cornerRadius: 13))
        }
    }
    
    
}

//struct DetailView_Previews: PreviewProvider {
//    static var previews: some View {
//        DetailView(gridItem: gridItem)
//    }
//}
