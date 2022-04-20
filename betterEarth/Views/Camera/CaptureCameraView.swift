//
//  Temp.swift
//  betterEarth
//
//  Created by Hariom Palkar on 12/04/22.
//

import SwiftUI
import Combine
import AVFoundation
import Camera_SwiftUI


struct CameraView: View {
    @StateObject var model = CameraModel()
    @State var currentZoomFactor: CGFloat = 1.0
    @StateObject var viewRouter: ViewRouter
    var body: some View {
        GeometryReader { reader in
            ZStack {
                CameraPreview(session: model.session)
                    .aspectRatio(contentMode: .fill)
                    .edgesIgnoringSafeArea(.all)
                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                    .gesture(
                        DragGesture().onChanged({ (val) in
                            //  Only accept vertical drag
                            if abs(val.translation.height) > abs(val.translation.width) {
                                //  Get the percentage of vertical screen space covered by drag
                                let percentage: CGFloat = -(val.translation.height / reader.size.height)
                                //  Calculate new zoom factor
                                let calc = currentZoomFactor + percentage
                                //  Limit zoom factor to a maximum of 5x and a minimum of 1x
                                let zoomFactor: CGFloat = min(max(calc, 1), 5)
                                //  Store the newly calculated zoom factor
                                currentZoomFactor = zoomFactor
                                //  Sets the zoom factor to the capture device session
                                model.zoom(with: zoomFactor)
                            }
                        })
                    )
                    .onAppear {
                        model.configure()
                    }
                    .alert(isPresented: $model.showAlertError, content: {
                        Alert(title: Text(model.alertError.title), message: Text(model.alertError.message), dismissButton: .default(Text(model.alertError.primaryButtonTitle), action: {
                            model.alertError.primaryAction?()
                        }))
                    })
                
                    .overlay(
                        Group {
                            if model.photo != nil {
                                capturedPhotoThumbnail
                                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height, alignment: .center)
                                    .edgesIgnoringSafeArea(.all)
                            } else {
                                Color.black.opacity(0.2)
                                    .edgesIgnoringSafeArea(.all)
                            }
                        }
                    )
                    .animation(
                        .easeInOut(duration: 1)
                            .repeatForever(autoreverses: false),
                        value: 1.0
                    )
                CameraUI
            }
        }
    }
    
    var captureButton: some View {
        Group {
            if model.photo == nil {
                Button(action: {
                    model.capturePhoto()
                }, label: {
                    Circle()
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .overlay(
                            Circle()
                                .stroke(Color.black.opacity(0.8), lineWidth: 2)
                                .frame(width: 65, height: 65, alignment: .center)
                        )
                }).animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: 1.0
                )
            } else if model.photo != nil {
                Button(action: {
                    viewRouter.currentPage = .home
                }) {
                    HStack(alignment: .center, spacing: 6) {
                        Text("Proceed")
                            .font(.BETitle)
                            .foregroundColor(.black)
                        Image("arrowRight")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 24, height: 24)
                    }
                    .padding(.all, 16)
                    .background(Color.white)
                    .cornerRadius(24)
                }
                .animation(
                    .easeInOut(duration: 1)
                        .repeatForever(autoreverses: false),
                    value: 1.0
                )
                
            }
        }
    }
    
    
    var capturedPhotoThumbnail: some View {
        Group {
            if model.photo != nil {
                Image(uiImage: model.photo.image!)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .animation(
                        .spring()
                            .repeatForever(autoreverses: false),
                        value: 1.0
                    )
                
            } else {
                RoundedRectangle(cornerRadius: 10)
                    .frame(width: 60, height: 60, alignment: .center)
                    .foregroundColor(.black)
            }
        }
    }
    
    var flipCameraButton: some View {
        Button(action: {
            if model.photo != nil {
                model.photo = nil
            } else {
                model.flipCamera()
            }
        }) {
            Image(model.photo != nil ? "redo" : "turnCamera")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
        }
    }
    
    var CameraUI: some View {
        VStack{
            flipCameraButton
                .padding(.top, 60)
            Spacer()
            if model.photo == nil {
                Image("cameraStamp")
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 227, height: 276)
            } else{
                HStack {
                    RecentActivityCell(dataModel: RecentActivity(imageName: "tropicana", productName: "Tropicana Juice Box 1L", offsetted: false, carbonValue: "24lbs", addedTime: "Just Now"))
                        .background(Color.white)
                        .cornerRadius(10)
                }
            }
            Spacer()
            HStack {
                Spacer()
                captureButton
                Spacer()
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 160)
        }
        .edgesIgnoringSafeArea(.all)
        .frame(width: UIScreen.main.bounds.width, height:  UIScreen.main.bounds.height, alignment: .center)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        CameraView(viewRouter: ViewRouter())
    }
}
