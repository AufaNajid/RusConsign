import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:rusconsign/utils/colors.dart';
import 'package:rusconsign/utils/commonWidget/common_appbar.dart';
import 'package:webview_flutter/webview_flutter.dart';

class TestingWebcView extends StatelessWidget {
  final String url;
  const TestingWebcView({super.key, required this.url});

  @override
  Widget build(BuildContext context) {

    final controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setBackgroundColor(const Color(0x00000000))
      ..setNavigationDelegate(
        NavigationDelegate(
          onProgress: (int progress) {
            const CircularProgressIndicator(
              color: AppColors.hargaStat,
            );
          },
          onPageStarted: (String url) {

          },
          onPageFinished: (String url) {},
          onHttpError: (HttpResponseError error) {},
          onWebResourceError: (WebResourceError error) {},
          onNavigationRequest: (NavigationRequest request) {
            if (request.url.startsWith('https://www.youtube.com/')) {
              return NavigationDecision.prevent;
            }
            return NavigationDecision.navigate;
          },
        ),
      )
      ..loadRequest(Uri.parse(url));

    return Scaffold(
      appBar: CommonAppBar(
        title: 'Payment',
        route: () {
          Get.back();
        },
      ),
      body: WebViewWidget(
        controller: controller,
      ),
    );
  }
}
