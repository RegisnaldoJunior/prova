


import 'package:get/get.dart';
import 'package:prova/data/repositories/paisesRepository.dart';
import 'package:prova/models/paisesAPI.dart';

class HomeController extends GetxController{
  late final PaisesRepository repository;

  final List<PaisesAPI> _paises = <PaisesAPI>[].obs;
  List<PaisesAPI> get paises => _paises;

  final RxBool _isLoading = false.obs;
  RxBool get isLoading => _isLoading;

  HomeController({required this.repository});


  getPaisesAPI() async {
    _isLoading.value = true;

    final response = await repository.getPaisesAPI();

    _paises.addAll(response);

    _isLoading.value = false;
  }
}
