
import Foundation

struct ExampleJson2KtSwift: Codable {

  var page         : Int?       = nil
  var results      : [Results]? = []
  var totalPages   : Int?       = nil
  var totalResults : Int?       = nil

  enum CodingKeys: String, CodingKey {

    case page         = "page"
    case results      = "results"
    case totalPages   = "total_pages"
    case totalResults = "total_results"
  
  }

  init(from decoder: Decoder) throws {
    let values = try decoder.container(keyedBy: CodingKeys.self)

    page         = try values.decodeIfPresent(Int.self       , forKey: .page         )
    results      = try values.decodeIfPresent([Results].self , forKey: .results      )
    totalPages   = try values.decodeIfPresent(Int.self       , forKey: .totalPages   )
    totalResults = try values.decodeIfPresent(Int.self       , forKey: .totalResults )
 
  }

  init() {

  }

}