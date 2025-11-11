import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';
// 변경 ✅
// import 'package:flutter/material.dart';
// import 'package:webview_flutter/webview_flutter.dart';
import 'package:universal_html/html.dart' as html;
import 'dart:ui_web' as ui; // ✅ 웹 전용 플랫폼뷰 등록용

/// 플랫폼별 HTML 로드 (앱은 WebView, 웹은 iframe)
class HtmlViewer extends StatelessWidget {
  const HtmlViewer({super.key, required this.src});
  final String src;

  @override
  Widget build(BuildContext context) {
    return kIsWeb ? _WebHtmlView(src: src) : _AppHtmlView(src: src);
  }
}

/// web: iframe
class _WebHtmlView extends StatefulWidget {
  const _WebHtmlView({required this.src});
  final String src;

  @override
  State<_WebHtmlView> createState() => _WebHtmlViewState();
}

class _WebHtmlViewState extends State<_WebHtmlView> {
  late final String _viewType;

  @override
  void initState() {
    super.initState();
    _viewType = 'iframe-${DateTime.now().microsecondsSinceEpoch}';
    final iframe = html.IFrameElement()
      ..src = '/${widget.src}'
      ..style.border = '0'
      ..style.width = '100%'
      ..style.height = '100%';
    // ignore: undefined_prefixed_name
    ui.platformViewRegistry.registerViewFactory(_viewType, (int _) => iframe);
  }

  @override
  Widget build(BuildContext context) {
    return HtmlElementView(viewType: _viewType);
  }
}

/// app: WebView
class _AppHtmlView extends StatefulWidget {
  const _AppHtmlView({required this.src});
  final String src;

  @override
  State<_AppHtmlView> createState() => _AppHtmlViewState();
}

class _AppHtmlViewState extends State<_AppHtmlView> {
  late final WebViewController _controller;

  @override
  void initState() {
    super.initState();
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadFlutterAsset(widget.src);
  }

  @override
  Widget build(BuildContext context) => WebViewWidget(controller: _controller);
}
