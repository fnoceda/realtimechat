import 'package:flutter/material.dart';
import 'package:realtimechat/models/usuario.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'utils.dart';

class UsuariosPage extends StatefulWidget {
  @override
  State<UsuariosPage> createState() => _UsuariosPageState();
}

class _UsuariosPageState extends State<UsuariosPage> {
  RefreshController _refreshController =
      RefreshController(initialRefresh: false);
  final usuarios = [
    Usuario(
      uid: '1',
      email: 'fnoceda83@gmail.com',
      nombre: 'Francisco',
      online: false,
    ),
    Usuario(
      uid: '2',
      email: 'juan@gmail.com',
      nombre: 'Juan',
      online: true,
    ),
    Usuario(
      uid: '3',
      email: 'maria@gmail.com',
      nombre: 'Maria',
      online: false,
    ),
    Usuario(
      uid: '4',
      email: 'fernando@gmail.com',
      nombre: 'Fernando',
      online: true,
    ),
    Usuario(
      uid: '5',
      email: 'yessi@gmail.com',
      nombre: 'Yessica',
      online: true,
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Mi nombre',
          style: TextStyle(color: Colors.black87),
        ),
        elevation: 1,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(
            Icons.exit_to_app,
            color: Colors.black54,
          ),
          onPressed: () {
            if (kDebugMode) {
              print('cerrar sesion');
            }
          },
        ),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 10),
            child: const Icon(
              Icons.check_circle,
              color: Colors.blueAccent,
            ),

            /*
            Icon(
              Icons.check_circle,
              color: Colors.blueAccent,
            ),
            */
          ),
        ],
      ),
      body: SmartRefresher(
        controller: _refreshController,
        enablePullDown: true,
        header: WaterDropHeader(
          complete: Icon(Icons.check, color: Colors.blue[400]),
          waterDropColor: Colors.blue,
        ),
        onRefresh: _cargarUsuarios,
        child: _listViewUsuarios(),
      ),
    );
  }

  ListView _listViewUsuarios() {
    return ListView.separated(
      physics: BouncingScrollPhysics(),
      itemCount: usuarios.length,
      separatorBuilder: (_, i) => Divider(),
      itemBuilder: (_, i) => _usuarioListTile(usuarios[i]),
    );
  }

  ListTile _usuarioListTile(Usuario usuario) {
    return ListTile(
      title: Text(usuario.nombre),
      subtitle: Text(usuario.email),
      leading: CircleAvatar(
        child: Text(usuario.nombre.substring(0, 2).toUpperCase()),
        backgroundColor: Colors.blue[100],
      ),
      trailing: Container(
        width: 10,
        height: 10,
        decoration: BoxDecoration(
          color: usuario.online ? Colors.green : Colors.red,
          shape: BoxShape.circle,
        ),
      ),
    );
  }

  void _cargarUsuarios() async {
    await Future.delayed(Duration(seconds: 1));
    _refreshController.refreshCompleted();
  }
}
