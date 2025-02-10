enum SearchType { character, war, period, souvenir, book }

class SearchItem {
  final String title; // Name/title of the item
  final dynamic data; // The actual object (Character, War, etc.)
  final SearchType type; // Type to differentiate models

  SearchItem({required this.title, required this.data, required this.type});
}
