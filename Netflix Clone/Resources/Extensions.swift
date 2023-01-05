//
//  Extensions.swift
//  Netflix Clone
//
//  Created by 박현준 on 2023/01/05.
//

import Foundation

extension String {
    
    //첫번째 글자를 대문자로 바꾸는 함수
    func capitalizeFirstLetter() -> String {
        return self.prefix(1).uppercased() + self.lowercased().dropFirst()
    }
}
