//
//  UIFont+Add.swift
//  ChallengeMedicato
//
//  Created by Luis Aceredo on 25/8/21.
//

import UIKit

extension UIFont {

  public static func helveticaNeueBold(size: CGFloat) -> UIFont {
    return UIFont(name: "HelveticaNeue-Bold", size: size) ?? UIFont.systemFont(ofSize: 15)
  }
  public static func helveticaNeueMedium(size: CGFloat) -> UIFont {
    return UIFont(name: "HelveticaNeue-Medium", size: size) ?? UIFont.systemFont(ofSize: 15)
  }
}
