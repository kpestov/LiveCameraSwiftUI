import SwiftUI

struct FrameView: View {
    var image: CGImage?
    private let label = Text("frame")
    @State private var isRecording: Bool = false
    @State private var counter: Int = 0
    
    var body: some View {
        ZStack {
            if let image = image {
                Image(image, scale: 1.0, orientation: .up, label: label)
            } else {
                Color.white
            }
            Text("00:0\(self.counter)")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(self.isRecording == true ? Color.red : Color.black)
                .offset(y: -325)
            
            VStack(alignment: .center) {
                Button {
                    self.isRecording.toggle()
                    
                    Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true) { timer in
                        print("Timer fired!")
                        self.counter += 1

                        if !self.isRecording {
                            timer.invalidate()
                            self.counter = 0
                        }
                    }
                    
                } label: {
                    Image(self.isRecording == true ? "stop" : "record")
                }
                .offset(y: 325)
            }
        }
    }
}

struct FrameView_Previews: PreviewProvider {
    static var previews: some View {
        FrameView()
    }
}
