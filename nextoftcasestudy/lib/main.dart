import 'package:flutter/material.dart';
import 'package:logger/logger.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';
import 'dart:io';
import 'package:nextoftcasestudy/openapi.dart';
import 'package:provider/provider.dart';
import './views/contacts_screen.dart';
import './views/add_edit_contact_screen.dart';
import 'loading_notifier.dart';
import 'loading_widget.dart';

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  HttpOverrides.global = MyHttpOverrides();
  runApp(
    ChangeNotifierProvider(
      create: (_) => LoadingNotifier(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final Logger logger = Logger();
  late Openapi openApi;
  static const String baseUrl = 'https://146.59.52.68:11234';
  static const String apiKey = 'a4497999-2e50-4ec9-b06b-d7994f361bed';

  @override
  void initState() {
    super.initState();
    logger.i('Application started');

    final dio = Dio(BaseOptions(
      baseUrl: baseUrl,
      connectTimeout: const Duration(milliseconds: 50000),
      receiveTimeout: const Duration(milliseconds: 30000),
    ))
      ..interceptors.add(LogInterceptor(
        request: true,
        requestHeader: true,
        requestBody: true,
        responseHeader: true,
        responseBody: true,
        error: true,
        logPrint: (obj) => logger.i(obj),
      ))
      ..httpClientAdapter = IOHttpClientAdapter(createHttpClient: () {
        final client = HttpClient();
        client.badCertificateCallback =
            (X509Certificate cert, String host, int port) => true;
        return client;
      });

    openApi = Openapi(dio: dio);
    openApi.setApiKey('ApiKey', apiKey);
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Telefon Rehberi',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      debugShowCheckedModeBanner: false,
      home: Stack(
        children: [
          ContactsScreen(openApi: openApi),
          LoadingWidget(),
        ],
      ),
      routes: {
        '/add': (context) => AddEditContactScreen(openApi: openApi),
        '/profile': (context) => AddEditContactScreen(openApi: openApi),
      },
    );
  }
}
