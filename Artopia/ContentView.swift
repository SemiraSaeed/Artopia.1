//
//  ContentView.swift
//  Artopia
//
//  Created by Samira Omer on 08/03/2023.
//


class EnvironmentViewModel: ObservableObject/**this can be the mainpage or homepage**/
{
    @Published var gridItems:[String] = []
    init (){
        getData()
    }
    func getData(){
        //self.dataArray.append("iPhone")   ...this is the long way
        self.gridItems.append(contentsOf: gridItems)
    }
    
    
}
    
    
    

import SwiftUI
struct ContentView: View {
    @State private var searchText = ""
    @StateObject var viewModel: EnvironmentViewModel = EnvironmentViewModel()
    
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
        GridItem(height: 450, imgString: "birmingham- flowers")
        
    ]
   
    let selectedItem: GridItem
    @State private var isActive : Bool = false
   
    var body: some View {
        
        
        NavigationView{
            
            ZStack{
                
                
                ScrollView{
                    HStack(alignment: .top){
                        Text( "\(searchText)")
                        
                            .searchable(text: $searchText)
                        //                    Label("Profile", systemImage:"person")
                    }
                    .padding(.top, 1.0)
                    
                    
                    ScrollView(.horizontal, showsIndicators: false ) {
                        ScrollView(.horizontal, showsIndicators: false ) {
                            
                            HStack() {
                                ForEach(0..<4) {index in
                                    
                                    Text("Abstract Paintings")
                                    
                                        .cornerRadius(20)
                                        .fontWeight(.heavy)
                                    Text("Portrait Paintings")
                                        .cornerRadius(20)
                                        .fontWeight(.heavy)
                                    
                                    Text("Oil paintings")
                                        .cornerRadius(20)
                                        .fontWeight(.heavy)
                                    
                                    Text("Moral Photography")
                                        .fontWeight(.heavy)
                                    Text("Landscape Paintings").fontWeight(.heavy).frame(maxWidth: .infinity)
                                    
                                }
                                
                                .padding(.horizontal)
                                .foregroundColor(.white).frame(height: 33.0)
                                .frame(maxWidth: .infinity)
                                //
                                .background(Color(hue: 0.781, saturation: 0.677, brightness: 0.76)).clipShape (RoundedRectangle (cornerRadius: 18))
                                
                            }
                            .padding(.top, 1.0)
                            
                        }
                        
                        //
                        //
                        //   
                        //
                        
                    }
                    List{
                        ForEach(viewModel.gridItems, id: \.self ){ gridItems in
                            
                            NavigationLink {
//                                ArtPage(viewModel: EnvironmentViewModel(), selectedItem: gridItems)
//                                
                                
                                
                                //                                viewModel: EnvironmentViewModel(), selectedItem: PinterestGrid(gridItems: gridItems, numOfColumns: 3, spacing: 9, horizontalPadding:2))/* the most imposrtant line*/
                            } label: {
                                Text(gridItems)
                                
                            }
                        }
                        
                    }
                    
//                    NavigationLink(destination: ArtPage(), isActive: self.$isActive) {
//                        PinterestGrid(gridItems: gridItems, numOfColumns: 3, spacing: 9, horizontalPadding:2)
//                    }
                }
                //            .navigationBarItems (leading: removeBtn, trailing:  View)
                
                
                
                
            }
        }.environmentObject(viewModel)
        
    }
    
    
}


    
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView( selectedItem: GridItem(height: 9, imgString: "String"))
//        ContentView(selectedItem: "")
    }
}

