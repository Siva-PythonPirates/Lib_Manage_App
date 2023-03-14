import 'package:flutter/widgets.dart';

abstract class AppServices {
  launchURLto(String url);
  double getSize(BuildContext context, double size);
  void sortJournalAsc();
  void sortJournalDesc();
  void resetJournalSort();
  void createtempjournal();
  void applyJournalFilter();
  void resetJournalFilter();
  void sortBooksTitle();
  void sortBooksTitleDesc();
  void sortBooksAuthor();
  void sortBooksAuthorDesc();
  void sortBooksDept();
  void sortBooksDeptDesc();
  void resetBookSort();
  // List<Map<String, String>> applyBooksFilter();
  void applyBooksFilter();
  void resetBooksFilter();
}
