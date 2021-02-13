//
//  MainPageInteractor.swift
//  Final Car Pro
//
//  Created by Xudong Xu on 2/12/21.
//

import Cocoa
import Combine
import CartoolKit

extension Array {
    
    fileprivate func filter<T>(
        _ keyPath: KeyPath<Element, T>,
        _ predicate: T,
        _ isInclude: (T, T) throws -> Bool) rethrows -> [Element] {
        return try filter {
            try isInclude($0[keyPath: keyPath], predicate)
        }
    }
    
    fileprivate func filter<T>(
        _ keyPath: KeyPath<Element, T>,
        _ predicate: T,
        _ isInclude: (T) throws -> (T) throws -> Bool) rethrows -> [Element] {
        return try filter {
            try isInclude($0[keyPath: keyPath])(predicate)
        }
    }
}

class MainPageInteractor {

    let filtered: CurrentValueSubject<[LazyRendition], Error> = .init([])
    
    let subject: CurrentValueSubject<[LazyRendition], Error> = .init([])
    
    let focusOn: CurrentValueSubject<LazyRendition?, Never> = .init(nil)
    
    let namePredicate: CurrentValueSubject<String, Never> = .init("")
    
    let renditionPredicate: CurrentValueSubject<String, Never> = .init("")
    
    private(set) var disposeBag: Set<AnyCancellable> = .init()
    
    let reader: Car.Reader<LazyRendition>
    
    init(reader: Car.Reader<LazyRendition>) {
        self.reader = reader
        combine()
    }

    private func combine() {
        func filterBuilder<Element, P: StringProtocol>(_ keyPath: KeyPath<Element, P>) -> (P) -> (Element) -> Bool {
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
                    .filter(filterBuilder(\.name)(self.namePredicate.value))
                    .filter(filterBuilder(\.renditionName)(self.renditionPredicate.value))
            }
            .subscribe(filtered)
            .store(in: &disposeBag)

        namePredicate.combineLatest(renditionPredicate)
            .sink { [weak self] name, rendition in
                guard let self = self else { return }
                self.filtered.value = self.subject.value
                    .filter(filterBuilder(\.name)(name))
                    .filter(filterBuilder(\.renditionName)(rendition))
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
