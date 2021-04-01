import 'package:flutter_modular_5/app/share/repositories/localstorage/local_storage_interface.dart';
import 'package:mobx/mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

part 'home_controller.g.dart';

@Injectable()
class HomeController = _HomeControllerBase with _$HomeController;

abstract class _HomeControllerBase with Store {
  final ILocalStorage _storage = Modular.get();

  @observable
  ObservableList<String> list = <String>[].asObservable();

  _HomeControllerBase() {
    init();
  }

  @action
  init() async {
    List<String> listLocal = await _storage.get('list');
    if (listLocal == null) {
      list = <String>[].asObservable();
    } else {
      list = listLocal.asObservable();
    }
  }

  @observable
  String text = '';

  @action
  setText(String value) => text = value;

  @action
  void save() {
    list.add(text);
    _storage.put('list', list);
  }

  @action
  void remove(int index) {
    list.removeAt(index);
    _storage.put('list', list);
  }
}
