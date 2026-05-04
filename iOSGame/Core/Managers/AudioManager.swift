import AudioToolbox
import Foundation

final class AudioManager: AudioPlaying {
    func playTap() {
        AudioServicesPlaySystemSound(1104)
    }

    func playGameOver() {
        AudioServicesPlaySystemSound(1521)
    }

    func playSuccess() {
        AudioServicesPlaySystemSound(1519)
    }

    func playPause() {
        AudioServicesPlaySystemSound(1103)
    }
}
