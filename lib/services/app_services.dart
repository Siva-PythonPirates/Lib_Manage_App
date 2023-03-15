import 'package:built_collection/built_collection.dart';
import 'package:flutter/widgets.dart';
import 'package:lib_management/models/location.dart';

abstract class AppServices {
  launchURLto(String url);
  double getSize(BuildContext context, double size);
  void sortJournalAsc();
  void sortJournalDesc();
  void resetJournalSort();
  void createtempjournal();
  void applyJournalFilter();
  void resetJournalFilter();
  void sortBooksTitle(BuiltList<Location> books);
  void sortBooksTitleDesc(BuiltList<Location> books);
  void sortBooksAuthor(BuiltList<Location> books);
  void sortBooksAuthorDesc(BuiltList<Location> books);
  void sortBooksDept(BuiltList<Location> books);
  void sortBooksDeptDesc(BuiltList<Location> books);
  void resetBookSort(BuiltList<Location> books);
  BuiltList<Location> applyBooksFilter(BuiltList<Location> books);
  void resetBooksFilter(BuiltList<Location> books);
}
