import Foundation
import Combine

class FoodRecipeList: ObservableObject {
    @Published var categories: [Category] = []
    
    init() {
        fetchFoods()
    }
    
    func fetchFoods() {
        FoodService.shared.getAllFoods { [weak self] result in
            switch result {
            case .success(let foods):
                DispatchQueue.main.async {
                    self?.categories = self?.categorizeFoods(foods) ?? []
                }
            case .failure(let error):
                print("Failed to fetch foods: \(error)")
            }
        }
    }
    
    private func categorizeFoods(_ foods: [Food]) -> [Category] {
        let grouped = Dictionary(grouping: foods) { $0.type }
        return grouped.map { (key, value) in
            Category(title: key.rawValue, items: value)
        }
    }
}
