//
//  CompensateViewController.swift
//  betterEarth
//
//  Created by Hariom Palkar on 02/04/22.
//

import SwiftUI

struct CompensateViewController: View {
    let projects = [
        ProjectModel(imageName: "SRM", projectName: "SRM IST", place: "Chennai, TN- India", carbonValue: "09"),
        ProjectModel(imageName: "gandhi", projectName: "Gandhi", place: "Surat, Gujrat- India", carbonValue: "12"),
        ProjectModel(imageName: "matsu", projectName: "Matsu Co", place: "Banglore, Karnataka- India", carbonValue: "16"),
        ProjectModel(imageName: "gandhi", projectName: "Gandhi", place: "Delhi- India", carbonValue: "12"),
        ProjectModel(imageName: "matsu", projectName: "Matsu Co", place: "Kolkata, Karnataka- India", carbonValue: "16"),
    ]
    @State private var showPaymentsSheet = false
    var body: some View {
        VStack{
            NavigationView() {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        ZStack(alignment: .topLeading) {
                            VStack(spacing: 24){
                                Image("Meter")
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .frame(width:  UIScreen.main.bounds.width - 128)
                                Button(action: {callPayments()}) {
                                    Text("Compensate Now")
                                        .foregroundColor(.white)
                                }.frame(width: UIScreen.main.bounds.width - 120, height: 55)
                                    .background(Color.BEGreen)
                                    .cornerRadius(12)
                                HStack(alignment: .center, spacing: 16){
                                    Image("matsu")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .cornerRadius(12)
                                    VStack(alignment: .leading, spacing: 2){
                                        Text("With Matsu NGO, I compensate \nmy monthly average emission of")
                                            .foregroundColor(Color.BEGrey)
                                        Text("5.3t CO2 for 250/month")
                                            .foregroundColor(Color.black)
                                    }.font(.BELabel)
                                }
                            }
                            .padding(.all, 20)
                            .frame(width: UIScreen.main.bounds.width - 48)
                            .background(Color.white)
                            .cornerRadius(20)
                        }
                        .padding(.top, 20)
                        Spacer()
                        
                        VStack(alignment: .leading, spacing: 24){
                            Text("Projects")
                                .font(.LabelBold)
                            ForEach(projects, id: \.self) { item in
                                ProjectCellView(dataModel: item)
                                    .frame(width: UIScreen.main.bounds.width - 88, alignment: .leading)
                            }
                            Spacer()
                        }
                        .padding(.all, 20)
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                    
                    Spacer()
                        .frame(height: 100)
                    VStack{
                        Image("SRM")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                        Text("Handcrafted at SRM IST Chennai")
                            .font(.BELabel)
                            .foregroundColor(.black)
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .background(Color.gray.opacity(0.1))
                .navigationTitle("Offset Carbon")
                .sheet(isPresented: $showPaymentsSheet) {
                    PaymentsView()
                }
            }
        }
    }
    
    private func callPayments() {
        // move to payments
        showPaymentsSheet = true
    }
}

struct CompensateViewController_Previews: PreviewProvider {
    static var previews: some View {
        CompensateViewController()
    }
}
