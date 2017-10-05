//
//  UIAlertViewController+Rx.swift
//  Combinestagram
//
//  Created by Wismin Effendi on 10/5/17.
//  Copyright © 2017 Underplot ltd. All rights reserved.
//

import UIKit
import RxSwift

extension UIViewController {
    func alert(title: String, text: String?) -> Observable<Void> {
        return Observable.create { [weak self] observer -> Disposable in
            let alert = UIAlertController(title: title, message: text, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "Close", style: .default, handler: { _ in
                observer.onCompleted()
            }))
            self?.present(alert, animated: true, completion: nil)
            return Disposables.create {
                self?.dismiss(animated: true, completion: nil)
            }
        }
    }
}


