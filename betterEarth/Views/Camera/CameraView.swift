//
//  CameraView.swift
//  betterEarth
//
//  Created by Hariom Palkar on 29/03/22.
//

import SwiftUI
import SwiftUICam

struct ContentView2: View {
    @ObservedObject var events = UserEvents()
    var body: some View {
        ZStack {
            CameraInterfaceView(events: events)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height - 200, alignment: .center)
        }
    }
}

struct CContentView2_Previews: PreviewProvider {
    static var previews: some View {
        ContentView2()
    }
}


struct CameraInterfaceView: View, CameraActions {
    @ObservedObject var events: UserEvents
    @State var isCaptured: Bool = true
    var body: some View {
        VStack {
            HStack(alignment: .center) {
                Button(action: {
                    if isCaptured {
                        self.rotateCamera(events: events)
                    } else {
                        
                    }
                }) {
                    Image(isCaptured ? "redo" : "turnCamera")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 30, height: 30)
                }
                Spacer()
                if isCaptured {
                    Button(action: {}) {
                        HStack(alignment: .center, spacing: 6) {
                            Text("Proceed")
                                .font(.BETitle)
                                .foregroundColor(.black)
                            Image("arrowRight")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .frame(width: 24, height: 24)
                        }
                        .padding(.all, 8)
                        .background(Color.white)
                        .cornerRadius(16)
                    }
                }
            }
            .padding(.horizontal, 24)
            Spacer()
            Image("cameraStamp")
                .aspectRatio(contentMode: .fit)
                .frame(width: 227, height: 276)
            Spacer()
            Button(action: {self.takePhoto(events: events)}) {
                Image("Snap")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .cornerRadius(12)
            }
        }.background(Color.clear)
    }
}
