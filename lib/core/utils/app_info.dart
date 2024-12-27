
import 'package:flutter/material.dart';
import 'package:flutter_application_2/core/extension/context_extention.dart';
import 'package:package_info_plus/package_info_plus.dart';

class AppInfo {
  const AppInfo._();

  static Future<String> getAppVersion(BuildContext context) async {
    var buildNumberText = '';

    if (context.lang.lang_code=="English") {
      final packgeInfo = await PackageInfo.fromPlatform();
      buildNumberText = '${packgeInfo.version} (${packgeInfo.buildNumber})';
    } else {
      final packgeInfo = await PackageInfo.fromPlatform();
      buildNumberText = '(${packgeInfo.buildNumber}) ${packgeInfo.version}';
    }

    return buildNumberText;
  }
}
