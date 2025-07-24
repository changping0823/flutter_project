import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/custom_app_bar.dart';
import 'package:get/get.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewPage extends StatefulWidget {
  final String url;
  const WebViewPage({super.key, required this.url});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {

  late final WebViewController _controller;
  /// 页面加载进度
  double _progress = 0;
  String? _title;


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..setNavigationDelegate(NavigationDelegate(
        onPageStarted: (url) {
          debugPrint("onPageStarted: $url");
        },
        onNavigationRequest: (request) {
          debugPrint("onNavigationRequest: $request");
          return NavigationDecision.navigate;
        },
        onPageFinished: (url) {
          debugPrint("onPageFinished: $url");
          _controller.getTitle().then((value) {
            debugPrint("title: $value");
            setState(() {
              _title = value ?? "";
            });
          });
        },
        onProgress: (progress) {
          setState(() {
            _progress = progress * 0.01;
          });
        },
      ));

    _controller.getTitle().then((value) {
      debugPrint("title: $value");
      setState(() {
        _title = value ?? "";
      });
    });

    _controller.loadRequest(Uri.parse(widget.url));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: _title,
        bottom: PreferredSize(
          child: _progressBar(_progress, context),
          preferredSize: const Size.fromHeight(2.0),
        ), // 显示进度条,
        onBackPressed: () async {
          bool canGoBack = await _controller.canGoBack();
          if (canGoBack) {
            _controller.goBack();
          } else {
            Get.back();
          }
        },
      ),
      body: WebViewWidget(controller: _controller),
    );
  }

  _progressBar(double progress,BuildContext context) {
    return LinearProgressIndicator(
      backgroundColor: Colors.white70.withOpacity(0),
      value: progress == 1.0 ? 0 : progress,
      valueColor: const AlwaysStoppedAnimation<Color>(Colors.greenAccent),
    );
  }

}
