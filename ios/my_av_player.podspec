#
# To learn more about a Podspec see http://guides.cocoapods.org/syntax/podspec.html.
# Run `pod lib lint my_av_player.podspec` to validate before publishing.
#
Pod::Spec.new do |s|
  s.name             = 'my_av_player'
  s.version          = '0.0.1'
  s.summary          = 'IOS Native AV player in Flutter'
  s.description      = <<-DESC
IOS Native AV player in Flutter
                       DESC
  s.homepage         = 'https://tezda.com'
  s.license          = { :file => '../LICENSE' }
  s.author           = { 'Tezda' => 'papa@tezda.com' }
  s.source           = { :path => '.' }
  s.source_files = 'Classes/**/*'
  s.dependency 'Flutter'
  s.platform = :ios, '12.0'

  # Flutter.framework does not contain a i386 slice.
  s.pod_target_xcconfig = { 'DEFINES_MODULE' => 'YES', 'EXCLUDED_ARCHS[sdk=iphonesimulator*]' => 'i386' }
  s.swift_version = '5.0'

  # If your plugin requires a privacy manifest, for example if it uses any
  # required reason APIs, update the PrivacyInfo.xcprivacy file to describe your
  # plugin's privacy impact, and then uncomment this line. For more information,
  # see https://developer.apple.com/documentation/bundleresources/privacy_manifest_files
  # s.resource_bundles = {'my_av_player_privacy' => ['Resources/PrivacyInfo.xcprivacy']}
end
