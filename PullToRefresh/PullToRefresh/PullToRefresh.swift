import SwiftUI

public struct PullToRefresh: View {
  var coordinateSpace: CoordinateSpace
  var onRefresh: () -> Void
  @State var refresh: Bool = false

  public init(coordinateSpace: CoordinateSpace, onRefresh: @escaping () -> Void) {
    self.coordinateSpace = coordinateSpace
    self.onRefresh = onRefresh
  }

  public var body: some View {
    GeometryReader { geo in
      if geo.frame(in: coordinateSpace).midY > 50 {
        Spacer()
          .onAppear {
            if refresh == false {
              onRefresh()
            }
            refresh = true
          }
      } else if geo.frame(in: coordinateSpace).maxY < 1 {
        Spacer()
          .onAppear {
            refresh = false
            ///reset  refresh if view shrink back
          }
      }
      ZStack(alignment: .center) {
        if refresh {
          ProgressView()
        } else {
          ForEach(0..<8) { tick in
            VStack {
              Rectangle()
                .fill(Color(UIColor.tertiaryLabel))
                .opacity((Int((geo.frame(in: coordinateSpace).midY) / 7) < tick) ? 0 : 1)
                .frame(width: 2, height: 7)
                .cornerRadius(3)
              Spacer()
            }.rotationEffect(Angle.degrees(Double(tick) / (8) * 360))
          }.frame(width: 20, height: 20, alignment: .center)
        }
      }.frame(width: geo.size.width)
        .padding(.top, 16)
    }.padding(.top, -40)
  }
}
