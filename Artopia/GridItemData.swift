//////
//////  GridItemData.swift
//////  Artopia
//////
//////  Created by Samira Omer on 09/04/2023.
//////
////
//import SwiftUI
//import Firebase
//import FirebaseFirestore
//
//
//struct GridItemData: Codable {
//    let imageName: String
//    let name: String
//    let description: String
//
//
//    func getGridItems(completion: @escaping ([GridItem]) -> Void) {
//        let db = Firestore.firestore()
//        let gridItemsRef = db.collection("grid-items")
//        gridItemsRef.getDocuments { (snapshot, error) in
//            if let error = error {
//                print("Error retrieving grid items: \(error.localizedDescription)")
//                completion([])
//                return
//            }
//            guard let snapshot = snapshot else {
//                print("Error retrieving grid items: snapshot is nil")
//                completion([])
//                return
//            }
//            let gridItems = snapshot.documents.compactMap { document -> GridItem? in
//                guard let data = document.data(),
//                      let gridItemData = try? Firestore.Decoder().decode(GridItemData.self, from: data) else {
//                    return nil
//                }
//                return GridItem(imgString: gridItemData.imageName, name: gridItemData.name, description: gridItemData.description)
//            }
//            completion(gridItems)
//        }
//    }
//}
//
//struct GridItemDatabase: View {
//
//
//    var body: some View {
//        @State var gridItems: [GridItem] = []
//
//        var body: some View {
//            ScrollView {
//                LazyVGrid(columns: [GridItem(.adaptive(minimum: 160))]) {
//                    ForEach(gridItems) { gridItem in
//                        getItemView(gridItem: gridItem)
//                    }
//                }
//            }
//            .onAppear {
//                getGridItems { items in
//                    gridItems = items
//                }
//            }
//        }
//
//    }
//}
//
//struct GridItemData_Previews: PreviewProvider {
//    static var previews: some View {
//        GridItemData()
//    }
//}
