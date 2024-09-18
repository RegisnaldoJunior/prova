

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:prova/controller/pais_controller.dart';
import 'package:prova/data/repositories/paisesRepository.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late final HomeController _controller;

  @override
  void initState() {
    super.initState();
    _controller = HomeController(
      repository: PaisesRepository(
        dio: Dio()
      ),
    );
    _controller.getPaisesAPI();
  }

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Lista de países',
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        backgroundColor: Colors.black,
      ),
      body: Obx(() {
        return _controller.isLoading.value
            ? Center(child: CircularProgressIndicator())
            : _controller.paises.isEmpty
                ? Center(
                    child: Text('Nenhum país encontrado'),
                  )
                : ListView.builder(
                    itemCount: _controller.paises.length,
                    itemBuilder: (_, index) {
                      final item = _controller.paises[index];
                      return ListTile(
                        title: Text(item.flag),
                      );
                    },
                  );
      },),
    );
  }
}
  
  
  canLaunch(String url) {}
  
  launch(String url) {}


extension on Object {
  get length => null;
}