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
        VStack(spacing: Dimensions.Stacks.normal) {
            MyButton(
                text: "Filled Button",
                style: .filled
            ) {}

            MyButton(
                text: "Filled Shadow Button",
                style: .filledShadow
            ) {}

            MyButton(
                text: "Bordered Button",
                style: .bordered
            ) {}

            IconTextButton(
                icon: Assets.Images.General.checkIcon,
                text: "Botón",
            ) {}

            IconButton(
                icon: Assets.Images.General.checkIcon
            ) {}
        }
        .padding(.horizontal, Dimensions.Margin.small)
    }
}

#Preview {
    UIComponentsView(viewModel: .init(coordinator: .init(container: .init())))
}
