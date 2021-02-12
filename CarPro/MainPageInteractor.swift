//
//  MainPageInteractor.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 2/12/21.
//

import Cocoa
import Combine
import CartoolKit

class MainPageInteractor {

    let filtered: CurrentValueSubject<[LazyRendition], Error> = .init([])
    
    let subject: CurrentValueSubject<[LazyRendition], Error> = .init([])
    
    let focusOn: CurrentValueSubject<LazyRendition?, Never> = .init(nil)
    
    let predicate: CurrentValueSubject<String, Never> = .init("")
    
    private(set) var disposeBag: Set<AnyCancellable> = .init()
    
    let reader: Car.Reader<LazyRendition>
    
    init(reader: Car.Reader<LazyRendition>) {
        self.reader = reader
        combine()
    }

    private func combine() {
        subject
            .map { [weak self] newValue in
                guard let self = self else { return [] }
                let p = self.predicate.value
                return p.isEmpty ? newValue : newValue.filter { $0.name.contains(p) }
            }
            .subscribe(filtered)
            .store(in: &disposeBag)
        
        predicate
            .sink { [weak self] p in
                guard let self = self else { return }
                self.filtered.value = p.isEmpty ? self.subject.value : self.subject.value.filter { $0.name.contains(p) }
            }
            .store(in: &disposeBag)
    }
    
    func read() {
        reader.read { result in
            switch result {
            case .success(let elements):
                self.subject.send(elements)
            case .failure(let error):
                self.subject.send(completion: .failure(error))
            }
        }
    }
}
