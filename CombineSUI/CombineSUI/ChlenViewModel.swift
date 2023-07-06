//
//  ChlenViewModel.swift
//  CombineSUI
//
//  Created by Иван Вдовин on 15.06.2023.
//

import Combine
import Foundation
import SwiftUI

class ChlenViewModel: ObservableObject {
    
    @Published var chlen = Chlen()
    
    @Published var isValid = false
    private var cancel: Set<AnyCancellable> = []
    
    init() {
        isFormValid
            .receive(on: RunLoop.main)
            .assign(to: \.isValid, on: self)
            .store(in: &cancel)
    }
    
    private var isNameChlenIvan: AnyPublisher<Bool, Never> {
        $chlen.name
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                return input.lowercased() == "иван" || input.lowercased() == "ivan"
            }
            .eraseToAnyPublisher()
    }
    
    private var isNameChlenEmpty: AnyPublisher<Bool, Never> {
        $chlen.name
            .debounce(for: 0.2, scheduler: RunLoop.main)
            .removeDuplicates()
            .map { input in
                return input.count < 2
            }
            .eraseToAnyPublisher()
    }
    
    private var isFormValid: AnyPublisher<Bool, Never> {
        Publishers.CombineLatest(isNameChlenIvan, isNameChlenEmpty)
            .map { isEmpty, isIvan in
                return !(isEmpty || isIvan)
            }
            .eraseToAnyPublisher()
    }
    
    func save() {
        
    }
}
