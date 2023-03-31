//
//  content2.swift
//  Artopia
//
//  Created by Samira Omer on 11/03/2023.
//

import SwiftUI
struct Content2: View {
    @State private var searchText = ""
    @State private var selectedIndex: Int = 0
   
    let categories = ["Abstract Paintings", "Portrait Paintings", "Oil paintings", "Moral Photography", "Landscape Paintings"]
    
    let gridItems = [
        GridItem(height: 220, imgString: "oil999"),
        GridItem(height: 170, imgString: "flower"),
        GridItem(height: 250, imgString: "portrait9"),
        GridItem(height: 160, imgString: "fuu-j-Lo7venJ_ywM-unsplash"),
        GridItem(height: 250, imgString: "oil987"),
        GridItem(height: 145, imgString: "portrait2"),
        
        
        
        
        GridItem(height: 190, imgString: "abstartc1111"),
        GridItem(height: 190, imgString: "portrait6"),
        GridItem(height: 160, imgString: "Abstract Painting2"),
        GridItem(height: 220, imgString: "palace"),
        
        GridItem(height: 240, imgString: "Abstract Painting3"),
        GridItem(height: 260, imgString: "oil999"),
        
        
        GridItem(height: 160, imgString: "portrait"),
        GridItem(height: 180, imgString: "abstract3434")
        ,
        GridItem(height: 250, imgString: "landscape"),
        GridItem(height: 200, imgString: "mana"),
        GridItem(height: 260, imgString: "maria"),
        GridItem(height: 300, imgString: "coffeeinmymind"),
        GridItem(height: 380, imgString: "paranormal"),
        GridItem(height: 450, imgString: "birmingham- flowers"),
        
   ]
    @State private var isActive : Bool = false
    var body: some View {
        
        
       
            ScrollView{
                SearchAndProfile()
                     
                ScrollView(.horizontal, showsIndicators: false){
                    HStack{
                        ForEach(0 ..< categories.count ){ i in
                            
                            //if index == 1, then isActive is true
                            CategoryView(isActive: i == selectedIndex , text: categories[i])
                                .onTapGesture {
                                selectedIndex = i
                            }
                            
                            
                        }
                    }
                    
                    
                }.padding(.leading, 9)
                //
                //
                //
                //
                
                
                
                PinterestGrid(gridItems: gridItems, numOfColumns: 3, spacing: 9, horizontalPadding:2)
                
               
            }
    }
    
}
    

    


    
struct CategoryView: View{
    @State private var searchText = ""
    let isActive: Bool
    let text: String
    var body: some View {
        HStack{

            if (isActive){
                Text(text).cornerRadius(20)
                    .fontWeight(.medium).foregroundColor(Color("cateBlue"))
                    .padding(10)
                    .background(Color("myblue"))
                .cornerRadius(100)
                
            }else
            {
                Text(text).cornerRadius(20).fontWeight(.medium).foregroundColor(Color("myblue")).padding(10).background(
                    
                    
                    RoundedRectangle(cornerRadius: 26)
                        .stroke(Color("myblue"), lineWidth: 1.5))
            }
            
            
        }.padding(.vertical, 0.9)
       
        }
        
    
    
}
struct SearchAndProfile : View{
    @State private var searchText = ""
    var gridItems = [GridItem]()
    var body: some View {
        
            HStack{
                HStack(spacing: -0.5){
                    Image(systemName: "magnifyingglass").padding(.leading)
                    TextField( "Search", text: $searchText)
                        .padding(11)
                }.foregroundColor(.gray).background(Color.gray.opacity(0.2)).cornerRadius(10)
                
                NavigationLink(destination:  ArtistProfileBackup()) {Image(systemName:"person.circle").foregroundColor(Color("mypurple")).fontWeight(.semibold).font(.system(size: 29))}
//                Button(action: {
//                    ArtistProfile(gridItems: gridItems, numOfColumns: 3)}
//                ){
//                    Image(systemName:"person.circle").foregroundColor(Color("mypurple")).fontWeight(.semibold).font(.system(size: 29))
//
//                }
                
                
            }.padding()
        
    }
    
}
    
struct Content2_Previews: PreviewProvider {
    static var previews: some View {
        NavigationView{
        Content2()
   
        }
    }
}
