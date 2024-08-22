import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'my_av_player_platform_interface.dart';

/// An implementation of [MyAvPlayerPlatform] that uses method channels.
class MethodChannelMyAvPlayer extends MyAvPlayerPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('my_av_player');

  @override
  Future<String?> getPlatformVersion() async {
    final version = await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }
}
