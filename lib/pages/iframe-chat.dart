import 'dart:developer';
import 'package:ereportapp/utils/constants/urls.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:url_launcher/url_launcher.dart';

class IFrameChatScreen extends StatefulWidget {
  const IFrameChatScreen({super.key, this.title});

  final String? title;

  @override
  State<IFrameChatScreen> createState() => _IFrameChatScreenState();
}

class _IFrameChatScreenState extends State<IFrameChatScreen> {
  final GlobalKey webViewKey = GlobalKey();

  String url = '';
  String title = '';
  double progress = 0;
  bool? isSecure;
  InAppWebViewController? webViewController;
  
  void initData() {
    log("Initialize mobile chat screen");
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  void initState() {
    // initData();
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      initData();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SizedBox.fromSize(
        size: MediaQuery.of(context).size,
        child: InAppWebView(
          key: webViewKey,
          initialUrlRequest: URLRequest(url: WebUri(AppUrls.vercelIFrameChat)),
          initialSettings: InAppWebViewSettings(
              transparentBackground: true,
              safeBrowsingEnabled: true,
              isFraudulentWebsiteWarningEnabled: true),
          onWebViewCreated: (controller) async {
            webViewController = controller;
            if (!kIsWeb &&
                defaultTargetPlatform == TargetPlatform.android) {
              await controller.startSafeBrowsing();
            }
          },
          onLoadStart: (controller, url) {
            if (url != null) {
              //
            }
          },
          onLoadStop: (controller, url) async {
            if (url != null) {
              setState(() {
                this.url = url.toString();
              });
            }
        
            // final sslCertificate = await controller.getCertificate();
            setState(() {
              // isSecure = sslCertificate != null || (url != null && urlIsSecure(url));
            });
          },
          onUpdateVisitedHistory: (controller, url, isReload) {
            if (url != null) {
              setState(() {
                this.url = url.toString();
              });
            }
          },
          onTitleChanged: (controller, title) {
            if (title != null) {
              setState(() {
                this.title = title;
              });
            }
          },
          onProgressChanged: (controller, progress) {
            setState(() {
              this.progress = progress / 100;
            });
          },
          shouldOverrideUrlLoading: (controller, navigationAction) async {
            final url = navigationAction.request.url;
            if (navigationAction.isForMainFrame &&
                url != null &&
                ![
                  'http',
                  'https',
                  'file',
                  'chrome',
                  'data',
                  'javascript',
                  'about'
                ].contains(url.scheme)) {
              if (await canLaunchUrl(url)) {
                launchUrl(url);
                return NavigationActionPolicy.CANCEL;
              }
            }
            return NavigationActionPolicy.ALLOW;
          },
        ),
      ),
    );
  }
}
