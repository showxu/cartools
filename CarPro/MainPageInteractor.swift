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
    
    let namePredicate: CurrentValueSubject<String, Never> = .init("")
    
    let renditionClassPredicate: CurrentValueSubject<String, Never> = .init("")
    
    private(set) var disposeBag: Set<AnyCancellable> = .init()
    
    let reader: Reader<LazyRendition>
    
    init(reader: Reader<LazyRendition>) {
        self.reader = reader
        combine()
    }

    private func combine() {
        func builder<Element, P: StringProtocol>(_ keyPath: KeyPath<Element, P>) -> (P) -> (Element) -> Bool {
            return { p in
                return { e in
                    let v = e[keyPath: keyPath]
                    guard !p.isEmpty else { return true }
                    return v.contains(p)
                }
            }
        }
        
        subject
            .map { [weak self] newValue in
                guard let self = self else { return [] }
                return newValue
                    .filter(builder(\.fileName)(self.namePredicate.value))
                    .filter(builder(\.renditionClass)(self.renditionClassPredicate.value))
            }
            .subscribe(filtered)
            .store(in: &disposeBag)

        namePredicate.combineLatest(renditionClassPredicate)
            .sink { [weak self] name, rendition in
                guard let self = self else { return }
                self.filtered.value = self.subject.value
                    .filter(builder(\.fileName)(name))
                    .filter(builder(\.renditionClass)(rendition))
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
