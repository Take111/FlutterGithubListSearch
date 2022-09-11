import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:github_searcher_flutter/screen/start_page.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(
    const ProviderScope(
      child: StartPage(),
    ),
  );
}
