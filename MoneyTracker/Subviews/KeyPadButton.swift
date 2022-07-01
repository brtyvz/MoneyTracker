//
//  KeyPadButton.swift
//  MoneyTracker
//
//  Created by Berat Yavuz on 1.07.2022.
//

import SwiftUI

struct KeyPadButton: View {
    var key: String

      var body: some View {
          Button(action: {
              let generator = UIImpactFeedbackGenerator(style: .soft)
              generator.impactOccurred()
              self.action(self.key)
              
          }) {
              Color.clear
                  .overlay(RoundedRectangle(cornerRadius: 12)
                      .stroke(Color.clear))
                  .overlay (
                    HStack{
                        Text(key)
                            .font(.some(Font.system(.largeTitle,design: .rounded)))
                            .fontWeight(.medium)
                            .foregroundColor(Color.primary)
                    }
                  )
          }
      }

      enum ActionKey: EnvironmentKey {
          static var defaultValue: (String) -> Void { { _ in } }
      }

      @Environment(\.keyPadButtonAction) var action: (String) -> Void
  }

  extension EnvironmentValues {
      var keyPadButtonAction: (String) -> Void {
          get { self[KeyPadButton.ActionKey.self] }
          set { self[KeyPadButton.ActionKey.self] = newValue }
      }
  }

  #if DEBUG
  struct KeyPadButton_Previews: PreviewProvider {
      static var previews: some View {
          KeyPadButton(key: "8")
              .padding()
              .frame(width: 80, height: 80)
              .previewLayout(.sizeThatFits)
      }
  }
  #endif

struct rowItem : Identifiable {
    let id = UUID()
    let text = ""
}


struct KeyPadRow: View {
    var keys: [String]

    var body: some View {
        HStack {
            ForEach(keys, id: \.self) { key in
                KeyPadButton(key: key)
            }
        }
    }
}
struct KeyPad: View {
    @Binding var string: String

    var body: some View {
        VStack {
            KeyPadRow(keys: ["1", "2", "3"])
            KeyPadRow(keys: ["4", "5", "6"])
            KeyPadRow(keys: ["7", "8", "9"])
            KeyPadRow(keys: [".", "0", "⌫"])
        }.environment(\.keyPadButtonAction, self.keyWasPressed(_:))
    }

    private func keyWasPressed(_ key: String) {
        switch key {
        case "." where string.contains("."): break
        case "." where string == "0": string += key
        case "⌫":
            string.removeLast()
            if string.isEmpty { string = "0" }
        case _ where string == "0": string = key
        default:
            if(string.count < 7) {
            string += key
            }
        }
    }
}


//struct ContentView : View {
//    var body: some View {
//        VStack {
//            HStack {
//                Spacer()
//                Text(string)
//            }.padding([.leading, .trailing])
//            Divider()
//            KeyPad(string: $string)
//        }
//        .font(.largeTitle)
//            .padding()
//    }
//
//    @State private var string = "0"
//
//}


//#if DEBUG
//struct ContentView_Previews : PreviewProvider {
//    static var previews: some View {
//        Group {
//            ContentView()
//        }
//    }
//}
//#endif


//struct KeyPadButton_Previews: PreviewProvider {
//    static var previews: some View {
//        KeyPadButton()
//    }
//}
