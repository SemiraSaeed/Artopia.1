//
//  ArtistProfile.swift
//  Artopia
//
//  Created by Samira Omer on 08/03/2023.
//

import SwiftUI
    //
struct ArtistProfile: View {
    
    struct Column: Identifiable {
        let id = UUID()
        var gridItems = [GridItem]()
        
    }
    
        let columns: [Column]
        let spacing: CGFloat
        let horizontalPadding: CGFloat
        //now we have to calculate the grid Layout so that it is more dynamic
        init(gridItems: [GridItem], numOfColumns: Int, spacing: CGFloat = 20, horizontalPadding: CGFloat = 20) {
            self.spacing = spacing
            self.horizontalPadding = horizontalPadding
    
            var columns = [Column]()
            for _ in 0 ..< numOfColumns {
                columns.append (Column())
            }
    
            // this stores the current height
            var columnsHeight = Array<CGFloat>(repeating: 0, count: numOfColumns)
    
            // now comes the hardest part!
            for gridItem in gridItems {
    
                var smallestColumnIndex = 0
                var smallestHeight = columnsHeight.first!
                for i in 1 ..< columnsHeight.count {
                    let curHeight = columnsHeight[i]
                    if curHeight < smallestHeight {
                        smallestHeight = curHeight
                        smallestColumnIndex = i
                    }
                }
    
    
    
    
                columns [smallestColumnIndex].gridItems
                    .append(gridItem)
                   columnsHeight[smallestColumnIndex] += gridItem.height
    
                }
    
            self.columns = columns
                }
  
        var body: some View {

           HStack(alignment: .top, spacing: spacing){

               ForEach(columns) {column in
                    LazyVStack(spacing: spacing) {
                        ForEach(column.gridItems) { gridItem in
                                    getItemView(gridItem: gridItem)
    
    
                                }
                            }
    
                        }
    
                        }.padding(.horizontal, horizontalPadding)
                    }
        func getItemView(gridItem: GridItem) -> some View {
            ZStack {
                GeometryReader { reader in
                    Image(gridItem.imgString)
                        .resizable()
                        .scaledToFill()
                        .frame(width: reader.size.width,
                               height: reader.size.height,
                             alignment: .center)
                }
            }
            .frame(height: gridItem.height)
            .frame (maxWidth: .infinity)
            .clipShape (RoundedRectangle (cornerRadius: 13))
        }
    
        }
    
  
    
struct ArtistProfile_Previews: PreviewProvider {
    static var previews: some View {
        ArtistProfileBackup()
       
    
    
    }
}
    
    
