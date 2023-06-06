//
//  NewPostView.swift
//  Artopia
//
//  Created by Samira Omer on 30/03/2023.
//

import SwiftUI

struct NewPostView: View {
    @State var selectedOption : String = "Choose"
    var typesOfPainting = ["Abstract Paintings", "Portrait Paintings", "Oil Paintings", "Moral Photography", "Landscape Paintings"]
    @State var title: String
    @State var Description: String
    var body: some View {
        VStack{
            
            Rectangle().foregroundColor(.gray.opacity(0.3)).frame(width: 309,height: 218).cornerRadius(21)
                .overlay( Image(systemName: "photo.fill").foregroundColor(Color.white.opacity(0.5)).font(.system(size: 99)).fontWeight(.regular).overlay(Image(systemName: "plus").foregroundColor(Color("mypurple"))).font(.system(size: 49)).fontWeight(.semibold)).padding()
            
            Form {
                Picker("Type of Art", selection: $selectedOption) {
                    ForEach(typesOfPainting, id: \.self) {
                        Text("\($0)").tag($0)
                    }
                    
                }.padding().overlay(
                    // Add the outline
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color("myblue"), lineWidth: 2).frame(width: 349)
               ).listRowSeparator(.hidden)
                TextField("    Title*", text: $title, axis: .vertical)
                    .lineLimit(2)
                    .padding(.trailing)
                    .foregroundColor(.black)
                    .listRowSeparator(.hidden)
                    .frame(height: 49)
                .overlay(
                // Add the outline
                    RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("myblue"), lineWidth: 2).frame(width: 349)
                )
                TextField("   Description*", text: $Description, axis: .vertical) .lineLimit(4).foregroundColor(.black)
                    .padding(.vertical).frame(height: 99 , alignment: .top)
                .overlay(
                // Add the outline
                    RoundedRectangle(cornerRadius: 8)
                    .stroke(Color("myblue"), lineWidth: 2).frame(width: 349)
                )
                //to hide the form's background
            }.scrollContentBackground(.hidden)
                .foregroundColor(.black)
                .listRowSeparator(.hidden)
                
            
            
        }.navigationTitle("New Post").toolbar {
            ToolbarItem(placement: .primaryAction) {
                Button("Post") {
                    print("Pressed")
                }
            }
        }
        
    }

}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView(selectedOption: "", title: "", Description: "").accentColor(Color("mypurple"))
    }
}
