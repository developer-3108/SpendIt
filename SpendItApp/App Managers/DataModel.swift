import Foundation


struct NewsApiResponse: Codable {
    let articles: [NewsApi]
}


struct NewsApi: Codable, Identifiable {
    let id: UUID? = UUID()
    let source: NewsAPISources
    let author: String?
    let title: String
    let description: String
    let url: String
    let urlToImage: String
    let publishedAt: String
    let content: String?
}

struct NewsAPISources: Codable {
    let id: String?
    let name: String
}
