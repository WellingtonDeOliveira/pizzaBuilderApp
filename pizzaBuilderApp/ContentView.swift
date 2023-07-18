//
//  ContentView.swift
//  testes
//
//  Created by Oliver Santos on 19/06/23.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        ZStack {
            PizzaBuilder()
                .setSize(true)
                .addPepperoni()
                .addOnion()
                .addParsley()
                .addCheese()
        }
    }
}

// Builder - Responsável por construir a pizza
struct PizzaBuilder: View {
    @State var size: Bool = false
    @State var cheese: Bool = false
    @State var pepperoni: Bool = false
    @State var onion: Bool = false
    @State var parsley: Bool = false
    
    var body: some View {
        EmptyView()
        bodySize
        if cheese { bodyCheese }
        if pepperoni { bodyPepperoni }
        if onion { bodyOnion }
        if parsley { bodyParsley }
    }
    var bodySize: some View {
        Image("big_pizza")
            .resizable()
            .aspectRatio(contentMode: .fit)
            .scaleEffect(self.size ? 0.3 : 0.35)
    }
    var bodyCheese: some View {
        Image("cheese")
    }
    var bodyPepperoni: some View {
        Image("pepperoni")
    }
    var bodyOnion: some View {
        Image("onion")
    }
    var bodyParsley: some View {
        Image("parsley")
    }
    
    // Definir o tamanho da pizza
    func setSize(_ size: Bool) -> PizzaBuilder {
        return PizzaBuilder(size: size, cheese: self.cheese, pepperoni: self.pepperoni, onion: self.onion, parsley: self.parsley)
    }
    
    // Adicionar queijo à pizza
     func addCheese() -> PizzaBuilder {
         return PizzaBuilder(size: self.size, cheese: true, pepperoni: self.pepperoni, onion: self.onion, parsley: self.parsley)
    }
    
    // Adicionar pepperoni à pizza
    func addPepperoni() -> PizzaBuilder {
        return PizzaBuilder(size: self.size, cheese: self.cheese, pepperoni: true, onion: self.onion, parsley: self.parsley)
    }
    
    // Adicionar bacon à pizza
    func addOnion() -> PizzaBuilder {
        PizzaBuilder(size: self.size, cheese: self.cheese, pepperoni: self.pepperoni, onion: true, parsley: self.parsley)    }
    
    // Adicionar tomate à pizza
    func addParsley() -> PizzaBuilder {
        PizzaBuilder(size: self.size, cheese: self.cheese, pepperoni: self.pepperoni, onion: self.onion, parsley: true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
