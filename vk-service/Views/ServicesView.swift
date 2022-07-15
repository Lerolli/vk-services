import SwiftUI

struct ServicesView: View {
    
    @ObservedObject var viewModel = ViewModel()
        
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.services) { service in
                    Button(action: {
                        viewModel.openApp(link: service.link)
                    }) {
                    ServiceCell(service: service)
                    }
                }
                .navigationTitle("Cервисы VK")
                .navigationBarTitleDisplayMode(.inline)
            }
            .onAppear { viewModel.getServices() }
        }
    }
}

extension ServicesView {
    final class ViewModel: ObservableObject {
        @Published private(set) var services: [ServiceCellModel] = []
            
        private let servicesManager = ServicesManager()
            
        func getServices() {
            servicesManager.getData { [weak self] result in
                    DispatchQueue.main.async {
                        self?.services = result ?? []
                    }
                }
            }

        func openApp(link: String) {
            if let appUrl = URL(string: link) {
                UIApplication.shared.open(appUrl)
            }
        }
    }
}
