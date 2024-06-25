//
//  AutumSalesViewModel.swift
//  Home
//
//  Created by islombek on 22/06/24.
//

import SwiftUI
import Combine
import Core
import NetworkManager

public class AutumnSalesViewModel: ObservableObject {
    private var fetchTask: Task<Void, Error>?
    
    @Published var model: AutumSales?
    @Published var isLoading = false
    @Published var showContent = false
    
    public init() {
        startFetchingData()
    }

    public func startFetchingData() {
        isLoading = true
        fetchTask = Task {
            defer {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
            }
            do {
                let urlString = "https://lab.7saber.uz/api/client/banner/discount"
                let sales = try await NetworkService.shared.request(
                    url: urlString,
                    decode: AutumSales.self,
                    method: .get
                )
                DispatchQueue.main.async {
                    self.model = sales
                   // self.triggerAnimation()
                }
            } catch {
                DispatchQueue.main.async {
                    self.isLoading = false
                }
                print("Failed to fetch data: \(error.localizedDescription)")
            }
        }
    }
    
    deinit {
        fetchTask?.cancel()
    }
    
  

    public var salePercentage: String {
        guard let model = model else { return "" }
        return "\(model.details.percent)%"
    }

    public var saleTitle: String {
        guard let model = model else { return "" }
        switch Locale.preferredLanguages.first?.lowercased() ?? "" {
        case "ru":
            return model.titleRu
        case "en":
            return model.titleEn
        default:
            return model.titleUz
        }
    }

    public var collectionDescription: String {
        guard let model = model else { return "" }
        switch Locale.preferredLanguages.first?.lowercased() ?? "" {
        case "ru":
            return model.descRu
        case "en":
            return model.descEn
        default:
            return model.descUz
        }
    }

    public var buttonTitle: String {
        return "View Details"
    }
}
