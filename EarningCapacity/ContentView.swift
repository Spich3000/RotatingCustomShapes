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
                .scaleEffect(CGSize(width: 0.7, height: 0.7))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


