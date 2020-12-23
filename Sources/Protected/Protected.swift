//
//  Created by iWw on 2020/12/23.
//

import UIKit

@propertyWrapper
@dynamicMemberLookup
public class Protected<T> {
    
    private let lock = UnfairLock()
    
    public var value: T
    
    public init(_ value: T) {
        self.value = value
    }
    
    /// The contained value. Unsafe for anything more than direct read or write.
    public var wrappedValue: T {
        get { lock.around { value } }
        set { lock.around { value = newValue } }
    }
    
    public var projectedValue: Protected<T> { self }
    
    public init(wrappedValue: T) {
        value = wrappedValue
    }
    
    /// Synchronously read or transform the contained value.
    public func read<U>(_ closure: (T) -> U) -> U {
        lock.around { closure(self.value) }
    }
    
    /// Synchronously modify the protected value.
    @discardableResult
    public func write<U>(_ closure: (inout T) -> U) -> U {
        lock.around { closure(&self.value) }
    }
    
    public subscript<Property>(dynamicMember keyPath: WritableKeyPath<T, Property>) -> Property {
        get { lock.around { value[keyPath: keyPath] } }
        set { lock.around { value[keyPath: keyPath] = newValue } }
    }
}
