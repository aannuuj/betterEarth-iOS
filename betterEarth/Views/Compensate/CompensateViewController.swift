//
//  CompensateViewController.swift
//  betterEarth
//
//  Created by Hariom Palkar on 02/04/22.
//

import SwiftUI

struct CompensateViewController: View {
    @State private var showPaymentsSheet = false
    var body: some View {
        VStack{
            NavigationView() {
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .leading, spacing: 24) {
                        ZStack(alignment: .topLeading) {
                            VStack(spacing: 24){
                                Image("meter")
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
                                    Image("redbull")
                                        .resizable()
                                        .aspectRatio(contentMode: .fit)
                                        .frame(width: 40, height: 40)
                                        .cornerRadius(12)
                                    VStack(alignment: .leading, spacing: 2){
                                        Text("With Gandhi NGO, I compensate \nmy monthly average emission of")
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
                            ForEach(1...3, id: \.self) { item in
                                // pass the object here and handel it inside the cell
                                ProjectCellView()
                                    .frame(width: UIScreen.main.bounds.width - 88, alignment: .leading)
                            }
                            Spacer()
                        }
                        .padding(.all, 20)
                        .background(Color.white)
                        .cornerRadius(20)
                    }
                }
                .frame(width: UIScreen.main.bounds.width)
                .background(Color.gray.opacity(0.1))
                .navigationTitle("Compensate")
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
