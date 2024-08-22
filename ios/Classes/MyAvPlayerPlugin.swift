import Flutter
import UIKit
import AVKit

public class SwiftMyAvPlayerPlugin: NSObject, FlutterPlugin {
    
    var playerViewController: AVPlayerViewController?
    var player: AVPlayer?

    public static func register(with registrar: FlutterPluginRegistrar) {
        let channel = FlutterMethodChannel(name: "my_av_player", binaryMessenger: registrar.messenger())
        let instance = SwiftMyAvPlayerPlugin()
        registrar.addMethodCallDelegate(instance, channel: channel)
    }

    public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
        if call.method == "play" {
            if let url = call.arguments as? String {
                playVideo(urlString: url)
                result(nil)
            } else {
                result(FlutterError(code: "INVALID_ARGUMENT", message: "URL not provided", details: nil))
            }
        } else {
            result(FlutterMethodNotImplemented)
        }
    }

    private func playVideo(urlString: String) {
        guard let url = URL(string: urlString) else {
            return
        }

        player = AVPlayer(url: url)
        playerViewController = AVPlayerViewController()
        playerViewController?.player = player

        if let viewController = UIApplication.shared.keyWindow?.rootViewController {
            viewController.present(playerViewController!, animated: true) {
                self.player?.play()
            }
        }
    }
}
