import Foundation

class TimerManager {
    private var timer: Timer?
    private var interval: TimeInterval
    private var action: () -> Void
    
    init(interval: TimeInterval, action: @escaping () -> Void) {
        self.interval = interval
        self.action = action
    }
    
    func start() {
        stop() // Ensure any existing timer is stopped before starting a new one
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] _ in
            self?.action()
        }
    }
    
    func stop() {
        timer?.invalidate()
        timer = nil
    }
    
    deinit {
        stop()
    }
}
