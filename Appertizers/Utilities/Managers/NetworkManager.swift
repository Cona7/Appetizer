import UIKit

final class NetworkManager {
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private let baseURL = "https://seanallen-course-backend.herokuapp.com/swiftui-fundamentals/appetizers"
    
    private init() {}
    
    func getAppetizers(completed: @escaping (Result<[Appetizer], APError>) -> Void) {
        guard let url = URL(string: baseURL) else {
            completed(Result.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { (data, resoponse, error) in
            if let _ = error {
                completed(.failure(APError.unableToComplete))
                return
            }
            
            guard let resoponse = resoponse as? HTTPURLResponse, resoponse.statusCode == 200 else {
                completed(.failure(APError.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(APError.invalidData))
                return
            }
            
            do {
                let decodableResponse = try JSONDecoder().decode(AppetizerResponse.self, from: data)
                completed(.success(decodableResponse.request))
            } catch {
                completed(.failure(APError.unableToComplete))
            }
        }
        
        task.resume()
    }
    
    func downloadImage(fromURLString urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard let url = URL(string: urlString) else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            guard let data = data, let image = UIImage(data: data) else {
                completed(nil)
                return
            }
            
            self.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
            
        task.resume()
    }
}
