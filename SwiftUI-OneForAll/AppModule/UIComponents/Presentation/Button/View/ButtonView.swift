import SwiftUI

struct ButtonView: View {
    @StateObject var viewModel: ButtonViewModel

    init(viewModel: ButtonViewModel) {
        self._viewModel = .init(wrappedValue: viewModel)
    }

    var body: some View {
        bodyContent
    }
}

extension ButtonView {
    
    var bodyContent: some View {
        VStack(spacing: Dimensions.Stacks.small) {
            MyButton(text: "Filled Button", style: .filled) {
                print("JAA")
            }

            MyButton(text: "Filled Shadow Button", style: .filledShadow) {
                print("JAA")
            }

            IconButton(
                icon: Assets.Images.General.checkIcon,
                action: {print("ASD")})
        }
    }
}

#Preview {
    UIComponentsView(viewModel: .init(coordinator: .init(container: .init())))
}
