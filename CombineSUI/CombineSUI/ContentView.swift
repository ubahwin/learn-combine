//
//  ContentView.swift
//  CombineSUI
//
//  Created by Иван Вдовин on 15.06.2023.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var chlenVM: ChlenViewModel
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    TextField("Имя члена", text: $chlenVM.name)
                    Stepper(value: $chlenVM.height, in: 1 ... 20) {
                        HStack {
                            Text("Скок см?")
                            Spacer()
                            Text(String(chlenVM.height))
                            Spacer()
                        }
                    }
                    Stepper(value: $chlenVM.hairCount, in: 1 ... 20) {
                        HStack {
                            Text("Количество волос")
                            Spacer()
                            Text(String(chlenVM.hairCount))
                            Spacer()
                        }
                    }
                    ColorPicker("Цвет залупы", selection: $chlenVM.zalupa)
                }
                
                Section {
                    Button("Сохранить") {
                        
                    }
                    .disabled(!self.chlenVM.isValid)
                }
            }
            .navigationTitle("Какой у тебя член?")
        }
    }
}

#Preview {
    ContentView(chlenVM: ChlenViewModel())
}
