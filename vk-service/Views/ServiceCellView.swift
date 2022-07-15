import SwiftUI

struct ServiceCell: View {
    @ObservedObject var viewModel = ViewModel()
    
    let service: ServiceCellModel
    
    var body: some View {
        HStack {
            viewModel.image
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 70, height: 70)
                .cornerRadius(8)
                
            VStack(alignment: .leading, spacing: 5) {
                Text(service.name)
                    .bold()
                    .foregroundColor(.black)
                
                Text(service.description)
                    .foregroundColor(.secondary)
                    .font(.caption)
            }
            .padding(.leading)
        }.onAppear {
            viewModel.loadImage(url: service.iconUrl)
        }
    }
}

extension ServiceCell {
    final class ViewModel: ObservableObject {
        @Published private(set) var image = Image("EmptyImage")
        
        private var imageManager = ImageManager()
         
        func loadImage(url: String) {

            imageManager.downloadImage(from: url) { image in
                DispatchQueue.main.async { [weak self] in
                    guard let image = image else { return }
                    self?.image = Image(uiImage: image)
                }
            }
        }
    }
}
