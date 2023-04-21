//
//  ContentView.swift
//  EarningCapacity
//
//  Created by Дмитрий Спичаков on 20.04.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            StaticShapeView()

            RotatingCircleView()
                .scaleEffect(CGSize(width: 0.8, height: 0.8), anchor: .top)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


