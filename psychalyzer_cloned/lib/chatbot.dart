// // // import 'package:flutter/material.dart';
// // //
// // // class ChatBotPage extends StatefulWidget {
// // //   @override
// // //   _ChatBotPageState createState() => _ChatBotPageState();
// // // }
// // //
// // // class _ChatBotPageState extends State<ChatBotPage> {
// // //   @override
// // //   Widget build(BuildContext context) {
// // //     return Scaffold(
// // //       appBar: AppBar(
// // //         title: Text('Chat Bot'),
// // //       ),
// // //       body: Center(
// // //         child: Text('Your chatbot interface goes here'),
// // //       ),
// // //     );
// // //   }
// // // }
// // import 'package:flutter/material.dart';
// // import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
// //
// // class ChatBotPage extends StatelessWidget {
// //   final String chatBotUrl =
// //       'https://a.picoapps.xyz/spring-manage?utm_medium=embed&utm_source=embed';
// //
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: Scaffold(
// //         appBar: AppBar(
// //           title: Text('Chat Bot'),
// //         ),
// //         body: WebViewContainer(url: chatBotUrl),
// //       ),
// //     );
// //   }
// // }
// //
// // class WebViewContainer extends StatefulWidget {
// //   final String url;
// //
// //   WebViewContainer({required this.url});
// //
// //   @override
// //   _WebViewContainerState createState() => _WebViewContainerState();
// // }
// //
// // class _WebViewContainerState extends State<WebViewContainer> {
// //   @override
// //   Widget build(BuildContext context) {
// //     return WebView(
// //       initialUrl: widget.url,
// //       javascriptMode: JavascriptMode.unrestricted,
// //       onPageFinished: (String url) {
// //         // Page loading is finished.
// //         // You can add any additional logic here if needed.
// //       },
// //     );
// //   }
// // }
// //
// // void main() {
// //   runApp(ChatBotPage());
// // }
//
//
// import 'package:flutter/material.dart';
// import 'package:flutter_webview_plugin/flutter_webview_plugin.dart';
//
// void main() {
//   runApp(ChatBotPage());
// }
//
// class ChatBotPage extends StatelessWidget {
//   final String chatBotUrl =
//       'https://a.picoapps.xyz/spring-manage?utm_medium=embed&utm_source=embed';
//
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Chat Bot'),
//         ),
//         body: WebViewContainer(url: chatBotUrl),
//       ),
//     );
//   }
// }
//
// class WebViewContainer extends StatefulWidget {
//   final String url;
//
//   WebViewContainer({required this.url});
//
//   @override
//   _WebViewContainerState createState() => _WebViewContainerState();
// }
//
// class _WebViewContainerState extends State<WebViewContainer> {
//   final flutterWebViewPlugin = FlutterWebviewPlugin();
//
//   @override
//   Widget build(BuildContext context) {
//     return WebviewScaffold(
//       url: widget.url,
//       appBar: AppBar(
//         title: Text('Chat Bot'),
//       ),
//       withZoom: true,
//       withLocalStorage: true,
//       hidden: true,
//       initialChild: Container(
//         color: Colors.white,
//         child: const Center(
//           child: CircularProgressIndicator(),
//         ),
//       ),
//     );
//   }
//
//   @override
//   void dispose() {
//     flutterWebViewPlugin.dispose();
//     super.dispose();
//   }
// }






//
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';

void main() {
  runApp(ChatBotPage());
}

class ChatBotPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('Chat Bot'),
        ),
        body: WebViewContainer(),
      ),
    );
  }
}

class WebViewContainer extends StatefulWidget {
  @override
  _WebViewContainerState createState() => _WebViewContainerState();
}

class _WebViewContainerState extends State<WebViewContainer> {
  late InAppWebViewController _webViewController;

  @override
  Widget build(BuildContext context) {
    return InAppWebView(
      initialUrlRequest: URLRequest(url: Uri.parse('about:blank')),
      onWebViewCreated: (InAppWebViewController webViewController) {
        _webViewController = webViewController;
        _injectScripts();
      },
    );
  }

  // Function to inject JavaScript links
  void _injectScripts() {
    _webViewController.evaluateJavascript(
      source: '''
        var script1 = document.createElement("script");
        script1.src = "https://cdn.botpress.cloud/webchat/v1/inject.js";
        document.head.appendChild(script1);
        var script2 = document.createElement("script");
        script2.src = "https://mediafiles.botpress.cloud/e1c6ae24-824d-4f30-9ee8-f0f6f0804620/webchat/config.js";
        script2.defer = true;
        document.head.appendChild(script2);
      ''',
    );
  }
}
