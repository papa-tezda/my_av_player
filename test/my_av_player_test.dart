import 'package:flutter_test/flutter_test.dart';
import 'package:my_av_player/my_av_player.dart';
import 'package:my_av_player/my_av_player_platform_interface.dart';
import 'package:my_av_player/my_av_player_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockMyAvPlayerPlatform
    with MockPlatformInterfaceMixin
    implements MyAvPlayerPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
}

void main() {
  final MyAvPlayerPlatform initialPlatform = MyAvPlayerPlatform.instance;

  test('$MethodChannelMyAvPlayer is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelMyAvPlayer>());
  });

  test('getPlatformVersion', () async {
    MyAvPlayer myAvPlayerPlugin = MyAvPlayer();
    MockMyAvPlayerPlatform fakePlatform = MockMyAvPlayerPlatform();
    MyAvPlayerPlatform.instance = fakePlatform;

    expect(await myAvPlayerPlugin.getPlatformVersion(), '42');
  });
}
