import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';
@lazySingleton
class UrlLauncher {
  final UrlLauncherPlatform launcher = UrlLauncherPlatform.instance;

  Future<void> makePhoneCall(String phoneNumber) async {
    // Use `Uri` to ensure that `phoneNumber` is properly URL-encoded.
    // Just using 'tel:$phoneNumber' would create invalid URLs in some cases.
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launcher.launchUrl(launchUri.toString(), const LaunchOptions());
  }

  Future<void> launchInBrowser(String url) async {
    if (!await launcher.launchUrl(
      url,
      const LaunchOptions(mode: PreferredLaunchMode.externalApplication),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> openWhatsApp(String url) async {
    if (!await launcher.launchUrl(
      url,
      const LaunchOptions(mode: PreferredLaunchMode.externalApplication),
    )) {
      throw Exception('Could not launch $url');
    }
  }

  Future<void> openMap(double latitude, double longitude) async {
    String googleUrl =
        'https://www.google.com/maps/search/?api=1&query=$latitude,$longitude';
    if (await launcher.canLaunch(googleUrl)) {
      await launcher.launchUrl(
        googleUrl,
        const LaunchOptions(mode: PreferredLaunchMode.externalApplication),
      );
    } else {
      throw 'Could not open the map.';
    }
  }
  Future<void> launchFaceBook() async {
    String fbProtocolUrl = "";
    String fallbackUrl = '';

    try {
      bool launched = await launcher.launchUrl(
        fbProtocolUrl,
        const LaunchOptions(mode: PreferredLaunchMode.externalApplication),
      );
      debugPrint("launching...$fbProtocolUrl");
      if (!launched) {
        debugPrint("can't launch");
        await launcher.launchUrl(
          fallbackUrl,
          const LaunchOptions(mode: PreferredLaunchMode.externalApplication),
        );
      }
    } catch (e) {
      debugPrint("can't launch exp $e");
      await launcher.launchUrl(
        fallbackUrl,
        const LaunchOptions(mode: PreferredLaunchMode.externalApplication),
      );
    }
  }

}

