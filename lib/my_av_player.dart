
import 'my_av_player_platform_interface.dart';

class MyAvPlayer {
  Future<String?> getPlatformVersion() {
    return MyAvPlayerPlatform.instance.getPlatformVersion();
  }
}
