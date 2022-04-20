//
//  ProjectCellView.swift
//  betterEarth
//
//  Created by Hariom Palkar on 02/04/22.
//

import SwiftUI

struct ProjectCellView: View {
    var body: some View {
        HStack{
            Image("redbull")
                 .resizable()
                 .aspectRatio(contentMode: .fill)
                 .frame(width: 85, height: 85)
                 .cornerRadius(6)
            VStack(alignment: .leading, spacing: 4){
                Text("Gandhi")
                    .font(.Label)
                    .foregroundColor(.black)
                    .lineLimit(1)
                Text("India")
                    .font(.subHeader)
                    .foregroundColor(.BEGrey.opacity(0.6))
                    .padding(.bottom, 8)
                Text("$10/t.CO2")
                    .font(.Label)
                    .foregroundColor(.BEGrey)
                    .lineLimit(1)
            }
        }
    }
}

struct ProjectCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProjectCellView()
    }
}
