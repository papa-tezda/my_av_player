import Flutter
import UIKit

public class AVPlayerViewRepresentable: NSObject, FlutterPlatformView {
    private var _view: AVPlayerView

    init(frame: CGRect, viewId: Int64, args: Any?) {
        let arguments = args as? [String: Any]
        let url = arguments?["url"] as? String ?? ""
        _view = AVPlayerView(frame: frame, url: url)
    }

    public func view() -> UIView {
        return _view
    }
}

public class AVPlayerViewFactory: NSObject, FlutterPlatformViewFactory {
    public func create(
        withFrame frame: CGRect,
        viewIdentifier viewId: Int64,
        arguments args: Any?
    ) -> FlutterPlatformView {
        return AVPlayerViewRepresentable(frame: frame, viewId: viewId, args: args)
    }
}
