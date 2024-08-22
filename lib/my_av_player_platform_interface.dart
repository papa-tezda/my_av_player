import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'my_av_player_method_channel.dart';

abstract class MyAvPlayerPlatform extends PlatformInterface {
  /// Constructs a MyAvPlayerPlatform.
  MyAvPlayerPlatform() : super(token: _token);

  static final Object _token = Object();

  static MyAvPlayerPlatform _instance = MethodChannelMyAvPlayer();

  /// The default instance of [MyAvPlayerPlatform] to use.
  ///
  /// Defaults to [MethodChannelMyAvPlayer].
  static MyAvPlayerPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [MyAvPlayerPlatform] when
  /// they register themselves.
  static set instance(MyAvPlayerPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }
}
