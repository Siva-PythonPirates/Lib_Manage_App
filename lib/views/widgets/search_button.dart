import 'package:flutter/material.dart';
import 'package:lib_management/services/app_services.dart';

class JournalCustomDelegate extends SearchDelegate {
  List<String> filteredJournals = journals;

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      IconButton(
        onPressed: () {
          query = '';
        },
        icon: const Icon(Icons.clear),
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, null);
      },
      icon: const Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    if (query.isEmpty) {
      filteredJournals = journals;
    } else {
      filteredJournals = journals
          .where(
              (journal) => journal.toLowerCase().contains(query.toLowerCase()))
          .toList();
    }

    return ListView.builder(
      padding: const EdgeInsets.all(8),
      itemCount: filteredJournals.length,
      itemBuilder: (BuildContext context, int index) {
        final journalIndex = journals.indexOf(filteredJournals[index]);
        return Padding(
          padding: EdgeInsets.all(getSize(context, 8)),
          child: DecoratedBox(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(getSize(context, 15)),
              color: const Color.fromRGBO(255, 255, 255, 1),
            ),
            child: InkWell(
              onTap: () async {
                await launchURLto(journalLinks[journalIndex]);
              },
              child: Material(
                elevation: 10,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Text(
                    filteredJournals[index],
                    style: TextStyle(
                      color: bgColor,
                      // decoration: TextDecoration.underline,
                    ),
                    textAlign: TextAlign.start,
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return buildResults(context);
  }
}
