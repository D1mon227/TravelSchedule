import SwiftUI
import Combine

struct StoriesProgressBar: View {
    private let storiesCount: Int
    private let timerConfiguration: TimerConfiguration
    
    @Binding var currentProgress: CGFloat
    @State private var timer: Timer.TimerPublisher
    @State private var cancellable: Cancellable?
    
    init(storiesCount: Int,
         timerConfiguration: TimerConfiguration,
         currentProgress: Binding<CGFloat>
    ) {
        self.storiesCount = storiesCount
        self.timerConfiguration = timerConfiguration
        self._currentProgress = currentProgress
        self.timer = Self.createTimer(configuration: timerConfiguration)
    }
    
    var body: some View {
        ProgressBarView(numberOfSections: storiesCount, progress: currentProgress)
            .padding(.init(top: 7, leading: 12, bottom: 12, trailing: 12))
            .onAppear {
                timer = Self.createTimer(configuration: timerConfiguration)
                cancellable = timer.connect()
            }
            .onDisappear {
                cancellable?.cancel()
            }
            .onReceive(timer) { _ in
                timerTick()
            }
    }
    
    private func timerTick() {
        withAnimation {
            currentProgress = timerConfiguration.nextProgress(progress: currentProgress)
        }
    }
}

extension StoriesProgressBar {
    static func createTimer(configuration: TimerConfiguration) -> Timer.TimerPublisher {
        Timer.publish(every: configuration.timerTickInternal, on: .main, in: .common)
    }
}
