import 'package:flutter/material.dart';
import 'package:realtimechat/pages/chat_page.dart';
import 'package:realtimechat/pages/loading_page.dart';
import 'package:realtimechat/pages/login_page.dart';
import 'package:realtimechat/pages/register_page.dart';
import 'package:realtimechat/pages/usuarios_page.dart';

final Map<String, Widget Function(BuildContext)> appRoutes = {
  'usuarios': (_) => UsuariosPage(),
  'chat': (_) => ChatPage(),
  'register': (_) => RegisterPage(),
  'login': (_) => LoginPage(),
  'loading': (_) => LoadingPage(),
};
