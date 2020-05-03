//
//  RESTClient.swift
//  LetsCook
//
//  Created by Luis David Goyes Garces on 5/2/20.
//  Copyright © 2020 LuisGoyes. All rights reserved.
//

import RxSwift

public final class RESTClient: ClientType {

    let manager: URLSession
    let decoder: JSONDecoder
    let baseURLComponents: URLComponents

    public init(baseURL: String) {
        let configuration = URLSessionConfiguration.default
        self.manager = URLSession(configuration: configuration)
        self.decoder = JSONDecoder()

        if let baseURLComponents = URLComponents(string: baseURL) {
            self.baseURLComponents = baseURLComponents
        } else {
            fatalError("Invalid baseURL")
        }
    }

    public func request<Response: Decodable>(_ endpoint: Endpoint<Response>) -> Single<Response> {
        return Single<Response>.create { emitter -> Disposable in

            var url = self.baseURLComponents
            url.path = endpoint.path

            let httpRequest = self.getURLRequest(
                from: url,
                httpMethod: endpoint.method,
                contentType: endpoint.contentType,
                parameters: endpoint.parameters)

            let task = self.manager.dataTask(with: httpRequest) { [weak self] (data, response, error) in
                self?.handleResponse(
                    request: httpRequest,
                    rawResponse: RESTRawResponse(
                        data: data,
                        response: response,
                        error: error),
                    emitter: emitter)
            }

            task.resume()

            return Disposables.create {
                task.cancel()
            }
        }
    }

    func getURLRequest(
        from basicURLComponents: URLComponents,
        httpMethod: HTTPMethod,
        contentType: APIContentType,
        parameters: [String: Any]?
    ) -> URLRequest {

        var urlComponents = basicURLComponents
        urlComponents.queryItems = getQueryItemsFrom(parameters: parameters, and: contentType)

        var httpRequest = URLRequest(url: urlComponents.url!)
        httpRequest.httpMethod = httpMethod.rawValue
        httpRequest.setValue(contentType.rawValue, forHTTPHeaderField: APIContentType.headerName.rawValue)
        httpRequest.httpBody = getBodyFrom(parameters: parameters, and: contentType)

        return httpRequest
    }

    func getQueryItemsFrom(parameters: [String: Any]?, and contentType: APIContentType) -> [URLQueryItem]? {
        guard let parameters = parameters as? [String: String] else {
            return nil
        }

        guard contentType == APIContentType.formURLEncoded else {
            return nil
        }

        return parameters.map {
            URLQueryItem(name: $0.0, value: $0.1)
        }
    }

    func getBodyFrom(parameters: [String: Any]?, and contentType: APIContentType) -> Data? {
        guard let parameters = parameters else {
            return nil
        }

        guard contentType == APIContentType.json else {
            return nil
        }

        return try? JSONSerialization.data(withJSONObject: parameters, options: [])
    }


    func handleResponse<Response: Decodable>(
        request: URLRequest,
        rawResponse: RESTRawResponse,
        emitter: (SingleEvent<Response>) -> Void) {
        do {
            let httpResponse = try getHttpResponse(from: rawResponse.response)

            try ResponseValidator
                .validateResponse(
                    statusCode: httpResponse.statusCode,
                    responseError: rawResponse.error)

            guard let data = rawResponse.data else {
                throw NetworkError.dataWasNil
            }

            let apiResponse = try decoder.decode(Response.self, from: data)

            emitter(.success(apiResponse))
        } catch {
            emitter(.error(error))
        }
    }

    func getHttpResponse(from response: URLResponse?) throws -> HTTPURLResponse {
        guard let response = response else {
            throw NetworkError.urlResponseWasNil
        }

        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.httpURLResponseCastFailure
        }

        return httpResponse
    }
}
