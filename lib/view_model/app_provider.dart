import 'package:built_collection/built_collection.dart';
import 'package:flutter/material.dart';
import 'package:flutter_state_notifier/flutter_state_notifier.dart';
import 'package:lib_management/models/appstate.dart';
import 'package:lib_management/models/book_details.dart';

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

  Future<void> getBookDetails() async {
    List<BookDetails> books = [];
    state = state.rebuild((p0) => p0.books = books.toBuiltList().toBuilder());
  }
}
