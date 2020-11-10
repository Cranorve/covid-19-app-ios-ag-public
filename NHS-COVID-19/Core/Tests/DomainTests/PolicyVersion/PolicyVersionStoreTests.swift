//
// Copyright © 2020 NHSX. All rights reserved.
//

import Common
import Scenarios
import XCTest
@testable import Domain

class PolicyVersionStoreTests: XCTestCase {
    
    private var encryptedStore: MockEncryptedStore!
    private var store: PolicyVersionStore!
    
    override func setUp() {
        super.setUp()
        
        encryptedStore = MockEncryptedStore()
        store = PolicyVersionStore(store: encryptedStore)
    }
    
    func testLoadingNoSavedValue() {
        XCTAssertNil(store.lastAcceptedWithAppVersion)
    }
    
    func testLoadingAcceptedVersion() {
        encryptedStore.stored["policy_version"] = #"""
        {
            "lastAcceptedWithAppVersion": "3.10"
        }
        """# .data(using: .utf8)!
        
        store = PolicyVersionStore(store: encryptedStore)
        
        XCTAssertEqual("3.10", store.lastAcceptedWithAppVersion)
    }
    
    func testSaveAcceptedVersion() throws {
        store.save(currentAppVersion: "3.10")
        XCTAssertEqual("3.10", store.lastAcceptedWithAppVersion)
    }
}
