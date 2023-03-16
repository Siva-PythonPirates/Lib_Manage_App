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

  void sortBooksTitle(BuiltList<Location> books,BuildContext context);   void sortBooksTitleDesc(BuiltList<Location> books,BuildContext context) ;
 void sortBooksAuthor(BuiltList<Location> books,BuildContext context);
  void sortBooksAuthorDesc(BuiltList<Location> books,BuildContext context);
 void sortBooksDept(BuiltList<Location> books,BuildContext context) ; 
 void sortBooksDeptDesc(BuiltList<Location> books,BuildContext context);
  void resetBookSort(BuiltList<Location> books,BuildContext context);  BuiltList<Location> applyBooksFilter(BuiltList<Location> books);
  void resetBooksFilter(BuiltList<Location> books);
}
