import SwiftUI

struct CreateFoodView: View {
    @StateObject private var imagePickerService = ImagePickerService()
    @State private var title: String = ""
    @State private var description: String = ""
    @State private var ingredients: [String] = [""]
    @State private var time: String = ""
    @State private var type: RecipeType = .soup
    @State private var steps: [RecipeStep] = [RecipeStep(stepNumber: 1, description: "")]
    @EnvironmentObject var foodList: FoodRecipeList
    @State private var isFoodCreated: Bool = false
    @State private var createdFood: Food?
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Food Details")) {
                    Button(action: {
                        imagePickerService.pickImage()
                    }) {
                        Text(imagePickerService.selectedImage == nil ? "Select Image" : "Image Selected")
                    }
                    .sheet(isPresented: $imagePickerService.isImagePickerPresented) {
                        ImagePickerView(imagePickerService: imagePickerService)
                    }
                    
                    TextField("Title", text: $title)
                    TextField("Description", text: $description)
                    TextField("Time", text: $time)
                    
                    Picker("Type", selection: $type) {
                        ForEach(RecipeType.allCases, id: \.self) { type in
                            Text(type.rawValue).tag(type)
                        }
                    }
                }
                
                Section(header: Text("Ingredients")) {
                    ForEach(ingredients.indices, id: \.self) { index in
                        TextField("Ingredient", text: $ingredients[index])
                    }
                    Button("Add Ingredient") {
                        ingredients.append("")
                    }
                }
                
                Section(header: Text("Steps")) {
                    ForEach(steps.indices, id: \.self) { index in
                        TextField("Step \(index + 1)", text: $steps[index].description)
                    }
                    Button("Add Step") {
                        let newStep = RecipeStep(stepNumber: steps.count + 1, description: "")
                        steps.append(newStep)
                    }
                }
                
                Button("Create Food") {
                    let newFood = Food(imageName: imagePickerService.selectedImage?.description ?? "", title: title, description: description, ingredients: ingredients, time: time, type: type, steps: steps)
                    
                    FoodService.shared.createFood(food: newFood) { result in
                        switch result {
                        case .success:
                            print("Food created successfully!")
                            createdFood = newFood
                            foodList.fetchFoods() // Gıda oluşturulduktan sonra listeyi güncelle
                            if let selectedImage = imagePickerService.selectedImage {
                                uploadImage(selectedImage)
                            }
                            isFoodCreated = true
                        case .failure(let error):
                            print("Error creating food: \(error)")
                        }
                    }
                }
            }
            .navigationTitle("Create Food")
            .background(
                NavigationLink(destination: SoupsListView().navigationBarBackButtonHidden(true), isActive: $isFoodCreated) {
                    EmptyView()
                }
            )
        }
    }
    
    private func uploadImage(_ image: UIImage) {
        guard let imageData = image.jpegData(compressionQuality: 0.8) else { return }
        
        FoodService.shared.uploadFoodImage(imageData: imageData) { result in
            switch result {
            case .success:
                print("Image uploaded successfully!")
            case .failure(let error):
                print("Error uploading image: \(error)")
            }
        }
    }
}

#Preview {
    CreateFoodView()
}
