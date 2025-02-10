import 'package:dalel/core/functions/navigation.dart';
import 'package:dalel/core/utils/app_colors.dart';
import 'package:dalel/features/search/data/model/search_model.dart';
import 'package:dalel/features/search/presentation/cubit/search_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  String searchQuery = '';

  @override
  void initState() {
    super.initState();
    // Trigger loading data when the view is created
    final searchCubit = BlocProvider.of<SearchCubit>(context);
    searchCubit.loadAllData();
  }

  @override
  Widget build(BuildContext context) {
    final searchCubit = BlocProvider.of<SearchCubit>(context);

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SearchBar(
                onSearch: (query) {
                  setState(() {
                    searchQuery = query; // Update the search query state
                  });

                  if (query.isEmpty) {
                    searchCubit
                        .loadAllData(); // Load all data if query is empty
                  } else {
                    searchCubit
                        .search(query); // Perform search if query is not empty
                  }
                },
              ),
            ),
            BlocBuilder<SearchCubit, List<SearchItem>>(
              builder: (context, searchResults) {
                if (searchQuery.isEmpty) {
                  // Show a placeholder when the search bar is empty
                  return const SliverFillRemaining(
                    child: Center(
                      child: Text(
                        '    ',
                        style: TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                } else if (searchResults.isEmpty) {
                  // Show a "No results found" message if the search results are empty
                  return SliverFillRemaining(
                    child: Center(
                      child: Text(
                        'No results found for "$searchQuery"',
                        style: const TextStyle(color: Colors.grey),
                      ),
                    ),
                  );
                } else {
                  // Show the search results
                  return SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (context, index) {
                        final searchItem = searchResults[index];
                        return ListTile(
                          title: Text(searchItem.title),
                          onTap: () {
                            customSearchNavigate(context, searchItem);
                          },
                        );
                      },
                      childCount: searchResults.length,
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}

class SearchBar extends StatefulWidget {
  const SearchBar({super.key, required this.onSearch});
  final void Function(String)? onSearch;

  @override
  State<SearchBar> createState() => _SearchBarState();
}

class _SearchBarState extends State<SearchBar> {
  final TextEditingController _controller = TextEditingController();
  bool _isSearchEmpty = true;

  @override
  void initState() {
    super.initState();
    _controller.addListener(_updateSearchState);
  }

  @override
  void dispose() {
    _controller.removeListener(_updateSearchState);
    _controller.dispose();
    super.dispose();
  }

  void _updateSearchState() {
    setState(() {
      _isSearchEmpty = _controller.text.isEmpty;
    });
  }

  void _clearSearch() {
    _controller.clear(); // Clear the text in the TextField
    widget.onSearch
        ?.call(''); // Trigger the onSearch callback with an empty query
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 74),
        Center(
          child: SizedBox(
            height: 56,
            width: 303,
            child: TextField(
              controller: _controller, // Connect the controller
              onChanged: widget.onSearch, // Trigger onSearch when text changes
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: 'Search deep into history',
                hintStyle: const TextStyle(color: Colors.white),
                filled: true,
                fillColor: AppColors.primaryColor,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8),
                  borderSide: BorderSide.none,
                ),
                prefixIcon: const Icon(Icons.search, color: Colors.white),
                suffixIcon: _isSearchEmpty
                    ? null // Hide the clear button when the search bar is empty
                    : IconButton(
                        icon: const Icon(Icons.clear, color: Colors.white),
                        onPressed: _clearSearch, // Clear the search bar
                      ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
