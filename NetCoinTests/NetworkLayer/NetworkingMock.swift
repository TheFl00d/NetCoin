//
//  NetworkingMock.swift
//  NetCoinTests
//
//  Created by Kwabena Ankamah on 16/01/2023.
//
import XCTest
@testable import NetCoin
class NetworkingMock: Networking {
    static var data: Data?
    func data(
        from url: URL,
        delegate: URLSessionTaskDelegate?
    ) async throws -> (Data, URLResponse) {
        guard let data = NetworkingMock.data else {
            throw NetworkError.dataNotFound
        }
        return (data, URLResponse())
    }
}
