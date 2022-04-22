//
//  ProjectCellView.swift
//  betterEarth
//
//  Created by Hariom Palkar on 02/04/22.
//

import SwiftUI

struct ProjectCellView: View {
    let dataModel: ProjectModel
    var body: some View {
        HStack{
            Image(dataModel.imageName)
                 .resizable()
                 .aspectRatio(contentMode: .fill)
                 .frame(width: 85, height: 85)
                 .cornerRadius(6)
            VStack(alignment: .leading, spacing: 4){
                Text(dataModel.projectName)
                    .font(.Label)
                    .foregroundColor(.black)
                    .lineLimit(1)
                Text(dataModel.place)
                    .font(.subHeader)
                    .foregroundColor(.BEGrey.opacity(0.6))
                    .padding(.bottom, 8)
                Text("$\(dataModel.carbonValue)/t.CO2")
                    .font(.Label)
                    .foregroundColor(.BEGrey)
                    .lineLimit(1)
            }
        }
    }
}

struct ProjectModel: Hashable, Identifiable {
    let id = UUID()
    let imageName: String
    let projectName: String
    let place: String
    let carbonValue: String
}
