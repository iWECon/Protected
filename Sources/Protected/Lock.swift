//
//  Created by iWw on 2020/12/23.
//

import UIKit

protocol Lock {
    func lock()
    func unlock()
}

extension Lock {
    func around<T>(_ closure: () -> T) -> T {
        lock()
        defer {
            unlock()
        }
        return closure()
    }
    
    func around(_ closure: () -> Void) {
        lock()
        defer {
            unlock()
        }
        return closure()
    }
}

