import Foundation

enum CheckoutRequestInfos {
    case getInit(preferenceId: String?, privateKey: String?, body: Data?, headers: [String: String]?)
}

extension CheckoutRequestInfos: RequestInfos {
    var endpoint: String {
        switch self {
        case .getInit(let preferenceId, _, _, _):
            if let preferenceId = preferenceId {
                return "px_mobile/v2/checkout/\(preferenceId)"
            } else {
                return "px_mobile/v2/checkout"
            }
        }
    }

    var method: HTTPMethodType {
        return .post
    }

    var body: Data? {
        switch self {
        case .getInit(_, _, let body, _): return body
        }
    }

    var headers: [String: String]? {
        switch self {
        case .getInit(_, _, _, let header): return header
        }
    }

    var parameters: [String: Any]? {
        switch self {
        case .getInit: return nil
        }
    }

    var accessToken: String? {
        switch self {
        case .getInit(_, let accessToken, _, _):
        if let token = accessToken { return token } else { return nil }
        }
    }

    var mockURL: URL? {
        //     return URL(string: "https://run.mocky.io/v3/3e0e367c-15e8-4228-8480-440ed6df41ad") // con dto
        //     return URL(string: "https://run.mocky.io/v3/1c40eea7-6a92-460f-b657-2f44b1235a37")
            // return URL(string: "https://run.mocky.io/v3/7c74a637-f400-4a70-952d-bd9c40828913")// letras blancas
            // return URL(string: "https://run.mocky.io/v3/0f81c669-caaa-4e02-b94a-db3c04e4287e") // BBVA
//            return URL(string: "https://run.mocky.io/v3/36c6bbea-5a10-49b8-b081-711e13cc0723")// BBVA con msg resaltado
//            return URL(string: "https://run.mocky.io/v3/0ce399b8-1075-48fd-a2fa-ef90cfee580b") // con payerPM
        // return URL(string: "https://run.mocky.io/v3/e5705c9e-7d61-4211-a056-d978c18d461c")!
        return URL(string: "https://run.mocky.io/v3/4bd07c00-57dc-4423-b4a9-538ca925c7ea")!

//        return nil
    }
}
