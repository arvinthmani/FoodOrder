import SwiftUI

// MARK: - ApiServices Environment Support

private struct ApiServicesKey: EnvironmentKey {
    static let defaultValue: ApiServices = ApiServices()
}

public extension EnvironmentValues {
    internal var apiServices: ApiServices {
        get { self[ApiServicesKey.self] }
        set { self[ApiServicesKey.self] = newValue }
    }
}
