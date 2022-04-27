//
//  Fonts.swift
//  TipJar
//
//  Created by Azhar Islam on 27/04/2022.
//

import SwiftUI

extension Font {
    
    struct Roboto {
    
        /// Get Roboto-Bold with a size
        /// - Parameter size: The size of the font
        /// - Returns: A font to apply onto a view
        static func bold(size: CGFloat) -> Font {
            .custom("Roboto-Bold", size: size)
        }
        
        /// Get Roboto-Medium with a size
        /// - Parameter size: The size of the font
        /// - Returns: A font to apply onto a view
        static func medium(size: CGFloat) -> Font {
            .custom("Roboto-Medium", size: size)
        }
        
        /// Get Roboto-Regular with a size
        /// - Parameter size: The size of the font
        /// - Returns: A font to apply onto a view
        static func regular(size: CGFloat) -> Font {
            .custom("Roboto-Regular", size: size)
        }
    }
}
