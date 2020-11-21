//
//  AppetizerCell.swift
//  Appertizers
//
//  Created by Josip Glasovac on 19/11/2020.
//

import SwiftUI

struct AppetizerCell: View {
    
    var appetizer: Appetizer
    
    var body: some View {
        HStack {
            AppetizerRemoteImage(urlString: appetizer.imageURL)
                .scaledToFill()
                .frame(width: 120, height: 90, alignment: /*@START_MENU_TOKEN@*/.center/*@END_MENU_TOKEN@*/)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(appetizer.name)
                    .font(.title2)
                    .fontWeight(.medium)
                    .lineLimit(2)
                
                Text("$\(appetizer.price, specifier: "%.2f")")
                    .fontWeight(.medium)
                    .foregroundColor(.secondary)
            }.padding(.leading)
        }
    }
}

struct AppetizerCell_Previews: PreviewProvider {
    static var previews: some View {
        AppetizerCell(appetizer: Appetizer(id: 00, name: "Chicken breast", description: "", price: 2.22, imageURL: "lock", calories: 1, protein: 1, carbs: 1))
    }
}
