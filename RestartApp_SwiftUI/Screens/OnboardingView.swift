//
//  OnboardingView.swift
//  RestartApp_SwiftUI
//
//  Created by Igor Ashurkov on 30.10.2022.
//

import SwiftUI

struct OnboardingView: View {
    
    // MARK: Property
    
    @AppStorage("onboarding") var isOnboardingViewActive: Bool = true
    
    @State private var buttonWidth: Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset: CGFloat = 0
    @State private var isAnimating: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var textTitle: String = "Share."
    
    // MARK: Body
    
    var body: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            VStack(spacing: 20) {
                
                // MARK: HEADER
                
                Spacer()
                
                VStack(spacing: 0) {
                    Text(self.textTitle)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .transition(.opacity)
                        .id(self.textTitle)
                    
                    Text("""
                    It's not how much we give but
                    how much love we put into giving.
                    """)
                        .font(.title3)
                        .fontWeight(.light)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, 10)
                } //: Header VStack
                .opacity(self.isAnimating ? 1 : 0)
                .offset(y: self.isAnimating ? 0 : -40)
                .animation(.easeOut(duration: 1), value: self.isAnimating)
                
                // MARK: CENTER
                
                ZStack {
                    CircleGroupView(ShareColor: .white, ShareOpacity: 0.2)
                        .offset(x: self.imageOffset.width * -1)
                        .blur(radius: abs(self.imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: self.imageOffset)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(self.isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 0.5), value: self.isAnimating)
                        .offset(x: self.imageOffset.width * 1.2, y: 0)
                        .rotationEffect(.degrees(Double(self.imageOffset.width / 20)))
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if abs(self.imageOffset.width) <= 150 {
                                        self.imageOffset = gesture.translation
                                        
                                        withAnimation(.linear(duration: 0.25)) {
                                            self.indicatorOpacity = 0
                                            self.textTitle = "Give."
                                        }
                                    }
                                }
                                .onEnded{ _ in
                                    self.imageOffset = .zero
                                    
                                    withAnimation(.linear(duration: 0.25)) {
                                        self.indicatorOpacity = 1
                                        self.textTitle = "Share."
                                    }
                                }
                        )
                        .animation(.easeOut(duration: 1), value: self.imageOffset)
                } //: Center ZStack
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 44, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(self.isAnimating ? 1 : 0)
                        .animation(.easeOut(duration: 1).delay(2), value: self.isAnimating)
                        .opacity(self.indicatorOpacity),
                    alignment: .bottom
                )
                
                Spacer()
                
                // MARK: FOOTER
                
                ZStack {
                    Capsule()
                        .fill(.white.opacity(0.2))
                    
                    Capsule()
                        .fill(.white.opacity(0.2))
                        .padding(8)
                    
                    Text("Get Started")
                        .font(.system(.title3, design: .rounded))
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .offset(x: 20)
                    
                    HStack {
                        Capsule()
                            .fill(Color("ColorRed"))
                            .frame(width: self.buttonOffset + 80)
                        
                        Spacer()
                    } //: HStack
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed"))
                            
                            Circle()
                                .fill(.black.opacity(0.15))
                                .padding(8)
                            
                            Image(systemName: "chevron.right.2")
                                .font(.system(size: 24, weight: .bold))
                        } //: ZStack
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .offset(x: self.buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    if gesture.translation.width > 0 && self.buttonOffset < (self.buttonWidth - 80) {
                                        self.buttonOffset = gesture.translation.width
                                    }
                                }
                                .onEnded { _ in
                                    withAnimation(Animation.easeOut(duration: 0.4)) {
                                        if self.buttonOffset > (self.buttonWidth / 2) {
                                            self.buttonOffset = self.buttonWidth - 80
                                            self.isOnboardingViewActive = false
                                        } else {
                                            self.buttonOffset = 0
                                        }
                                    }
                                }
                        ) //: Gesture Button
                        
                        Spacer()
                    } //: HStack
                    
                } //: Footer ZStack
                .frame(width: self.buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(self.isAnimating ? 1 : 0)
                .offset(y: self.isAnimating ? 0 : 40)
                .animation(.easeOut(duration: 1), value: self.isAnimating)
                
            } //: VStack
        } //: ZStack
        .onAppear(perform: {
            self.isAnimating = true
        })
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView()
    }
}
