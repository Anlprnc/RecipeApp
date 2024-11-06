import Foundation

class FoodService {
    static let shared = FoodService()
    private let baseURL = "http://localhost:3000/api/foods"
    
    private init() {}

    func getAllFoods(completion: @escaping (Result<[Food], Error>) -> Void) {
        guard let url = URL(string: baseURL) else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let foods = try decoder.decode([Food].self, from: data)
                completion(.success(foods))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func getFood(by id: String, completion: @escaping (Result<Food, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/\(id)") else { return }
        
        URLSession.shared.dataTask(with: url) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            
            guard let data = data else { return }
            
            do {
                let decoder = JSONDecoder()
                let food = try decoder.decode(Food.self, from: data)
                completion(.success(food))
            } catch {
                completion(.failure(error))
            }
        }.resume()
    }
    
    func createFood(food: Food, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: baseURL) else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        do {
            let jsonData = try JSONEncoder().encode(food)
            request.httpBody = jsonData
            
            URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    completion(.failure(error))
                    return
                }
                completion(.success(()))
            }.resume()
        } catch {
            completion(.failure(error))
        }
    }
    
    func uploadFoodImage(imageData: Data, completion: @escaping (Result<Void, Error>) -> Void) {
        guard let url = URL(string: "\(baseURL)/upload") else { return }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.setValue("application/octet-stream", forHTTPHeaderField: "Content-Type")
        
        request.httpBody = imageData
        
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                completion(.failure(error))
                return
            }
            completion(.success(()))
        }.resume()
    }
}
