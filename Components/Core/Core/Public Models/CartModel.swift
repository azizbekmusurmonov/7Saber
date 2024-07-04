//
//  CartModel.swift
//  Cart
//
//  Created by Asadbek Yoldoshev on 11/06/24.
//

import Foundation

// MARK: - CartModelElement
public struct CartModel: Codable {
    public var id, qty: Int
    public let product: ProductModel
    
    public init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.qty = try container.decode(Int.self, forKey: .qty)
        self.product = try container.decode(ProductModel.self, forKey: .product)
    }
    
    public var getProduct: Product {
        .init(
            id: id,
            imageURL: product.mainImg.src, 
            title: product.name,
            priceWithCurrency: product.price.display,
            size: product.attribute.size,
            color: product.attribute.color.name,
            quantity: qty
        )
    }
}

// MARK: - Product
public struct ProductModel: Codable {
    public let id: Int
    public let name: String
    public let price: PriceModel
    public let gender: String
    public let discount: DiscountModel?
    public let mainImg: MainImgModel
    public let media: String?
    public let attribute: AttributeModel
    
   public  init(from decoder: any Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.id = try container.decode(Int.self, forKey: .id)
        self.name = try container.decode(String.self, forKey: .name)
        self.price = try container.decode(PriceModel.self, forKey: .price)
        self.gender = try container.decode(String.self, forKey: .gender)
        self.discount = try container.decodeIfPresent(DiscountModel.self, forKey: .discount)
        self.mainImg = try container.decode(MainImgModel.self, forKey: .mainImg)
        self.media = try container.decodeIfPresent(String.self, forKey: .media)
        self.attribute = try container.decode(AttributeModel.self, forKey: .attribute)
    }

    public enum CodingKeys: String, CodingKey {
        case id, name, price, gender, discount
        case mainImg = "main_img"
        case media, attribute
    }
}

// MARK: - Attribute
public struct AttributeModel: Codable {
    public let productID: Int
    public let billzID: String
    public let barcode, colorID: Int
    public let size: String
    public let photos: [PhotoModel]
    public let qty: Int
    public let createdAt, updatedAt: String
    public let color: ColorModel

    public enum CodingKeys: String, CodingKey {
        case productID = "productId"
        case billzID = "billzId"
        case barcode
        case colorID = "colorId"
        case size, photos, qty
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case color
    }
}

// MARK: - Color
public struct ColorModel: Codable {
    public let id: Int
    public let billzID, nameUz, nameRu, nameEn: String
    public let hex: String?
    public let createdAt, updatedAt, name: String

    public enum CodingKeys: String, CodingKey {
        case id
        case billzID = "billzId"
        case nameUz, nameRu, nameEn, hex
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case name
    }
}

// MARK: - Photo
public struct PhotoModel: Codable {
    public let baseName: String
    public let src: String
}

// MARK: - Discount
public struct DiscountModel: Codable {
    public let amount: Int
    public let type: String
    public let productPrice, discountPrice: PriceModel
    public var display: String {
        discountPrice.display
    }
}

// MARK: - Price
public struct PriceModel: Codable {
    public let value: Int
    public let currency: CurrencyModel
    
    public var display: String {
        value.description + " " + currency.rawValue
    }
}

public enum CurrencyModel: String, Codable {
    case uzs = "UZS"
    case usd = "USD"
    case eur = "EUR"
    case rub = "RUB"
}

// MARK: - MainImg
public struct MainImgModel: Codable {
    public let id: Int
    public let src: String
    public let type: String
}


