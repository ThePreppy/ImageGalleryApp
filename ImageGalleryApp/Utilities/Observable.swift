//
//  Observable.swift
//  ImageGalleryApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

class Observable<T> {
    
    var value: T {
        didSet { fireOnMainThread() }
    }
    
    private var observer: DataClosure<T>?
    
    init(_ value: T) {
        self.value = value
    }
    
    func subscribe(observer: @escaping DataClosure<T>) {
        self.observer = observer
    }
    
    private func fireOnMainThread() {
        DispatchQueue.main.async { [weak self] in
            guard let self = self else { return }
            self.observer?(self.value)
        }
    }
    
}
