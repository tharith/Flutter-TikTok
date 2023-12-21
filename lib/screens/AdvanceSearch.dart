import 'package:flutter/material.dart';
import 'package:advanced_search/advanced_search.dart';

class AdvanceSearch extends StatelessWidget {
  AdvanceSearch({super.key});

  // create new list
  final List<String> searchableList = [
    "Thavrith",
    "Orange",
    "Apple",
    "Banana",
    "Mango Orange",
    "Carrot Apple",
    "Yellow Watermelon",
    "Zhe Fruit",
    "White Oats",
    "Dates",
    "Raspberry Blue",
    "Green Grapes",
    "Red Grapes",
    "Dragon Fruit"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Advanced Search"),
      ),
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(top: 30, left: 30, right: 30),
          child: AdvancedSearch(
            searchItems: searchableList,
            maxElementsToDisplay: 10,
            singleItemHeight: 50,
            borderColor: Colors.grey,
            minLettersForSearch: 0,
            selectedTextColor: Color(0xFF3363D9),
            fontSize: 14,
            borderRadius: 12.0,
            hintText: "Search here...",
            cursorColor: Colors.blueGrey,
            autoCorrect: false,
            focusedBorderColor: Colors.blue,
            searchResultsBgColor: Color(0xFAFAFA),
            disabledBorderColor: Colors.cyan,
            enabledBorderColor: Colors.black,
            enabled: true,
            caseSensitive: false,
            inputTextFieldBgColor: Colors.white54,
            clearSearchEnabled: true,
            itemsShownAtStart: 10,
            searchMode: SearchMode.CONTAINS,
            showListOfResults: true,
            horizontalPadding: 10,
            hideHintOnTextInputFocus: true,
            hintTextColor: Colors.blueAccent,
            searchItemsWidget: searchAdvanceWidget,
            onItemTap: (index, value) {
              print("Selected item index is $index");
            },
            onSearchClear: () {
              print("Cleared Search");
            },
            onSubmitted: (value1, value2) {
              print("TextEdited: " + value1);
              print("LENGTH: " + value2.length.toString());
            },
          ),
        ),
      ),
    );
  }

  // create new widget
  Widget searchAdvanceWidget(String text) {
    return ListTile(
      title: Text(
        text.length > 3 ? text.substring(0, 5) : text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 16.0,
          color: Colors.indigoAccent
        ),
      ),
      subtitle: Text(
        text,
        maxLines: 1,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.black38
        ),
      ),
    );
  }
}
