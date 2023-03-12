import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:lib_management/models/appstate.dart';
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

  Future<void> getInitialBooks() async {
    state = state.rebuild((p0) => p0.books = [
          {
            'title': 'The Structure of Scientific Revolutions',
            'Author': 'Thomas S. Kuhn',
            'Department': 'Science',
            'image': 'https://images.pexels.com/photos/276743/pexels-photo-276743.jpeg'
          },
          {
            'title': 'The Wealth of Nations',
            'Author': 'Adam Smith',
            'Department': 'Economics',
            'image': 'https://images.pexels.com/photos/276792/pexels-photo-276792.jpeg'
          },
          {
            'title': 'A Brief History of Time',
            'Author': 'Stephen Hawking',
            'Department': 'Science',
            'image': 'https://images.pexels.com/photos/276943/pexels-photo-276943.jpeg'
          },
          {
            'title': 'The Origin of Species',
            'Author': 'Charles Darwin',
            'Department': 'Science',
            'image': 'https://images.pexels.com/photos/276944/pexels-photo-276944.jpeg'
          },
          {
            'title': 'The Elements of Style',
            'Author': 'William Strunk Jr. and E.B. White',
            'Department': 'Language and Writing',
            'image': 'https://images.pexels.com/photos/276757/pexels-photo-276757.jpeg'
          },
          {
            'title': 'Principles of Economics',
            'Author': 'N. Gregory Mankiw',
            'Department': 'Economics',
            'image': 'https://images.pexels.com/photos/276761/pexels-photo-276761.jpeg'
          },
          {
            'title': 'The Selfish Gene',
            'Author': 'Richard Dawkins',
            'Department': 'Science',
            'image': 'https://images.pexels.com/photos/276942/pexels-photo-276942.jpeg'
          },
          {
            'title': 'The Republic',
            'Author': 'Plato',
            'Department': 'Philosophy',
            'image': 'https://images.pexels.com/photos/276947/pexels-photo-276947.jpeg'
          },
          {
            'title': 'The Interpretation of Dreams',
            'Author': 'Sigmund Freud',
            'Department': 'Psychology',
            'image': 'https://images.pexels.com/photos/276799/pexels-photo-276799.jpeg'
          },
          {
            'title': 'The Social Contract',
            'Author': 'Jean-Jacques Rousseau',
            'Department': 'Political Science',
            'image': 'https://images.pexels.com/photos/276741/pexels-photo-276741.jpeg'
          },
        ]);
  }

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

  Future<void> getBookDetails() async {
    AppServices imp = AppServiceImp();
    List<Map<String, String>> books = imp.applyBooksFilter();
    state = state.rebuild((p0) => p0.books = books);
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
}
