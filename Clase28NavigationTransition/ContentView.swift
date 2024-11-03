//
//  ContentView.swift
//  Clase28NavigationTransition
//
//  Created by Escurra Colquis on 3/11/24.
//

import SwiftUI

struct ContentView: View {
    @Namespace private var nameSpace
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Navigation Transition")
                    .bold()
                    .foregroundStyle(.black)
                    .font(.system(size: 26))
                Spacer()
                NavigationLink {
                    DetailView()
                        .navigationTransition(.zoom(sourceID: "navigationDetail", in: nameSpace))
                } label: {
                    Text("Transición IOS 18")
                        .matchedTransitionSource(id: "navigationDetail", in: nameSpace)
                }
                Spacer()
            }
        }
    }
}

struct DetailView: View {
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        Text("Vista de Detalle")
            .navigationBarBackButtonHidden()
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "arrowshape.backward.fill")
                            .resizable()
                            .scaledToFit()
                            .foregroundStyle(.black)
                            .frame(width: 20, height: 20)
                    }
                }
            }
    }
}

#Preview {
    ContentView()
}
