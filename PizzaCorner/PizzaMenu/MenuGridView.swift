//
//  MenuGridView.swift
//  PizzaCorner
//
//  Created by Shayeeb War on 20/03/24.
//

import SwiftUI

struct MenuGridView: View {
    @State var menu: [MenuItem]
    let columnGridLayout = Array(repeating: GridItem(), count: 3)
    let favouritesGridLayout = Array(repeating: GridItem(), count: 5)
    @State private var favouritesItems:[Int] = [-1]
    @Binding var selectedItem: MenuItem
    @Namespace private var nSpace
    func favouritePiza(id: Int) -> MenuItem {
        menu.first(where: {$0.id == id}) ?? noMenuItem
    }
    var body: some View {
        VStack{
            LazyVGrid(columns: favouritesGridLayout, content: {
                ForEach(favouritesItems.sorted(), id: \.self){ itemId in
                    FavoriteTileView(menuItem: favouritePiza(id: itemId))
                        .matchedGeometryEffect(id: itemId, in: nSpace)
                        .onTapGesture {
                            selectedItem = favouritePiza(id: itemId)
                        }
                        .onLongPressGesture{
                            if let index = favouritesItems.firstIndex(of: itemId){
                                favouritesItems.remove(at: index)
                            }
                        }
                }
            })
            //Text(selectedItem.name)
            ScrollView {
                LazyVGrid(columns: columnGridLayout, content: {
                    ForEach(menu){item in
                        if !favouritesItems.contains(where: {$0 == item.id}) {
                            MenuItemTileView(menuItem: item)
                                .matchedGeometryEffect(id: item.id, in: nSpace)
                                .onTapGesture(count: 2) {
                                    if !favouritesItems.contains(where: {$0 == item.id}) {
                                        withAnimation(.easeOut) {
                                            favouritesItems.append(item.id)
                                        }
                                    }
                                }
                                .onTapGesture {
                                    selectedItem = item
                                }
                        }
                    }
                })
            }
        }
        .animation(.easeOut(duration: 0.5), value: favouritesItems)
    }
}

#Preview {
    MenuGridView(menu: MenuModel().menu, selectedItem: .constant(noMenuItem))
}
