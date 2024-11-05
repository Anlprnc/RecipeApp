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
}
