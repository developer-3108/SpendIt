import Foundation

class ViewModel: ObservableObject {
    @Published var news: [NewsApi] = []
    @Published var url = "https://saurav.tech/NewsAPI/top-headlines/category/business/in.json"
    
    func fetchData() async {
        guard let url = URL(string: url) else { return }
        
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            let decodedResponse = try JSONDecoder().decode(NewsApiResponse.self, from: data)
            DispatchQueue.main.async {

                self.news = decodedResponse.articles
            }
        } catch {
            print("Error fetching data: \(error)")
        }
    }
}
