import 'package:flutter_vpn/flutter_vpn.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class VPNController extends GetxController {
  var isVPNConnected = false.obs;
  var serverIp = ''.obs;

  Future<void> fetchServerIp() async {
    final url = 'https://iptv-be-production.up.railway.app/best-server';

    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        serverIp.value = data['serverIp'];
      } else {
        Get.snackbar('VPN', 'Failed to fetch server IP', snackPosition: SnackPosition.BOTTOM);
      }
    } catch (e) {
      Get.snackbar('VPN', 'Error: $e', snackPosition: SnackPosition.BOTTOM);
    }
  }

  Future<void> toggleVPN() async {
    if (isVPNConnected.value) {
      // Disconnect VPN
      await FlutterVpn.disconnect();
      isVPNConnected.value = false;
      Get.snackbar('VPN', 'VPN Disconnected', snackPosition: SnackPosition.BOTTOM);
    } else {
      // Fetch the server IP first
      await fetchServerIp();

      if (serverIp.value.isNotEmpty) {
        // Prepare and start VPN using IKEv2 EAP
        await FlutterVpn.prepare().then((isVpnPrepared) {
          if (isVpnPrepared) {
            FlutterVpn.connectIkev2EAP(
              server: serverIp.value,  // Use fetched server IP
              username: "SjiT81o9b2HITDe3",  // Your IKEv2 EAP username
              password: "gbEDHeSndX5Oj9lUoCaACHI6Sh14BINw", // Your IKEv2 EAP password
            ).then((_) {
              isVPNConnected.value = true;
              Get.snackbar('VPN', 'VPN is Connecting......', snackPosition: SnackPosition.BOTTOM);
            });
          } else {
            Get.snackbar('VPN', 'VPN preparation failed', snackPosition: SnackPosition.BOTTOM);
          }
        });
      }
    }
  }
}
