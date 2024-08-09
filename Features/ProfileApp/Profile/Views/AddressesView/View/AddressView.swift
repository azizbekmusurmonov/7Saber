import SwiftUI
import Core
import AssetKit

struct AddressView: View {
    
    @EnvironmentObject var vm: AddressesViewModel
    @StateObject private var addressFromViewModel = AddressFormViewModel()
    
    @State var addLocationView = false
    
    @Environment(\.dismiss) var pop
    
    var body: some View {
        
        switch vm.viewState {
        case .show:
            VStack(spacing: .zero) {
                navBar
                Spacer()
                if #available(iOS 16.0, *) {
                    List {
                        ForEach($vm.items, id: \.self) { $item in
                            AddressItemView(item: item, onDelete: {})
                        }
                        .onDelete(perform: delete)
                    }
                    .listStyle(.plain)
                    .onChange(of: vm.message) { newValue in
                        guard let newValue else { return }
                        switch newValue {
                        case .succes(message: let message):
                            Snackbar.show(message: message, theme: .success)
                        case .error(message: let message):
                            Snackbar.show(message: message, theme: .error)
                        }
                    }
                } else {
                    VStack{}
                }
            }
            AddButton(title: Localizations.addNewAddress, buttonPressed:{
                addLocationView = true
            }, isDisabled: $addressFromViewModel.isFormValid )
            .sheet(isPresented: $addLocationView) {
                AddNewAddress()
                    .environmentObject(addressFromViewModel)
            }
            .navigationBarBackButtonHidden()
        case .loading:
            LoaderView()
        case .empty:
            navBar
            Spacer()
            AddressesIsEmpty()
        default:
            EmptyView()
        }
    }
    
    func delete(at offsets: IndexSet) {
        offsets.forEach { index in
            let item = vm.items[index]
            vm.deleteAddress(item: item)
        }
        vm.items.remove(atOffsets: offsets)
    }
}

extension AddressView {
    var navBar: some View {
        VStack(spacing: .zero) {
            BaseNavigationBar(title: Localizations.addresses, leftImage: Asset.Image.Navigation.arrowLeftNav.image, leftButtonPressed: {
                print("leftButtonPressed")
                self.pop()
            })
        }
    }
}

#Preview {
    AddressView()
}
