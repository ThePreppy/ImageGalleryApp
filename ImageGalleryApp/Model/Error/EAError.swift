//
//  EAError.swift
//  ImageGalleryApp
//
//  Created by Alexander on 29.12.2022.
//

import Foundation

enum EAError: LocalizedError {
    case somethingWentWrong
    
    var errorDescription: String? {
        switch self {
        case .somethingWentWrong:
            return R.string.localizable.commonSomethingWentWrong()
        }
    }
}
