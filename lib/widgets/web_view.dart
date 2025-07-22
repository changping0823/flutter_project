import 'package:flutter/material.dart';
import 'package:flutter_project/widgets/custom_app_bar.dart';
import 'package:webview_flutter/webview_flutter.dart';
class WebViewPage extends StatefulWidget {
  final String url;
  const WebViewPage({super.key, required this.url});

  @override
  State<WebViewPage> createState() => _WebViewPageState();
}

class _WebViewPageState extends State<WebViewPage> {
  late final WebViewController _controller;

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
      ))
      ..loadRequest(Uri.parse(widget.url));

    _controller.getTitle().then((value) {
      debugPrint("title: $value");
      setState(() {
        _title = value ?? "";
      });
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: _title),
      body: WebViewWidget(controller: _controller),
    );
  }
}
