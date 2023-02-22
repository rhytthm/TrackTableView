import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let resultCount: Int
    let results: [Result]
}

// MARK: - Result
struct Result: Codable {

    let artistName: String
    let image: String
    let trackName: String?
    let shortDescription: String?
    let trackRentalPrice: Double?

    enum CodingKeys: String, CodingKey {
        case artistName
        case image = "artworkUrl60"
        case trackName
        case shortDescription
        case trackRentalPrice
    }
}
