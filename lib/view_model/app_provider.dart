import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:lib_management/dataservices.dart';
import 'package:lib_management/models/appstate.dart';
import 'package:lib_management/models/location.dart';
import 'package:lib_management/services/app_services.dart';
import 'package:lib_management/services/app_services_impl.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Changes extends StatelessWidget {
  const Changes({Key? key, required this.child}) : super(key: key);
  final Widget child;
  @override
  Widget build(BuildContext context) {
    return StateNotifierProvider<MyModel, Appstate>(
      create: (c) => MyModel(),
      child: child,
    );
  }
}

class MyModel extends StateNotifier<Appstate> with LocatorMixin {
  MyModel() : super(Appstate());

  List<String> _favorites = [];

  List<String> get favorites => _favorites;

  Future<bool> getLoginDetail() async {
    final prefs = await SharedPreferences.getInstance();
    return prefs.getBool('isLoggedIn') ?? false;
  }

  Future<void> updateLogin(bool bool) async {
    final prefs = await SharedPreferences.getInstance();
    prefs.setBool('isLoggedIn', bool);
  }

  Future<void> getBookDetails(BuiltList<Location> books) async {
    AppServices imp = AppServiceImp();
    BuiltList<Location> books1 = imp.applyBooksFilter(books);
    state = state.rebuild((p0) => p0.books = books1.toBuilder());
        state = state.rebuild((p0) => p0.books = books1.toBuilder());

  }

  Future<void> getMailId(String mail) async {
    state = state.rebuild((p0) => p0.mail = mail);
    print(mail);
  }

  Future<void> setFavorites(List<String> favorites) async {
    _favorites = favorites;
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favorites', _favorites);
  }

  Future<void> addToFavorites(String title) async {
    if (!_favorites.contains(title)) {
      _favorites.add(title);
      final prefs = await SharedPreferences.getInstance();
      prefs.setStringList('favorites', _favorites);
    }
  }

  Future<void> removeFromFavorites(String title) async {
    _favorites.remove(title);
    final prefs = await SharedPreferences.getInstance();
    prefs.setStringList('favorites', _favorites);
  }

  Future<void> loadFavorites() async {
    final prefs = await SharedPreferences.getInstance();
    _favorites = prefs.getStringList('favorites') ?? [];
  }

  bool isFavorite(String title) {
    return _favorites.contains(title);
  }

  Future<void> getlocations() async {
    DataServices obj = DataServices();
    final a = await obj.getlocations();
    state = state.rebuild((p0) => p0.locations = a?.toBuilder());
        state = state.rebuild((p0) => p0.books = a?.toBuilder());

  }

  Future<void> updateLocations(BuiltList<Location> books) async{
  state = state.rebuild((p0) => p0.books = books.toBuilder());
  }
}
