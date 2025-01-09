import Foundation

@MainActor
class ViewModel: ObservableObject {
    @Published var news: NewsModel? = nil
    @Published var error: String? = nil
    @Published var newsURL: String = "https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=ae1b6a29d8d741d9b94f1d7acfe64d48"
    
    func fetchNews() async {
        guard let url = URL(string: newsURL) else {
                self.error = "Invalid URL"
            return
        }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            let decodeNews = try JSONDecoder().decode(NewsModel.self, from: data)
                self.news = decodeNews
        } catch {
                self.error = "Error fetching news: \(error.localizedDescription)"
        }
    }
}
