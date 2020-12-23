//
//  Created by iWw on 2020/12/23.
//

import UIKit

public extension Protected where T == Data? {
    /// Adds the contents of a `Data` value to the end of the protected `Data`.
    ///
    /// - Parameter data: The `Data` to be appended.
    func append(_ data: Data) {
        write { (ward: inout T) in
            ward?.append(data)
        }
    }
}
