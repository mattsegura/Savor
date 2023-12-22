import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'search_provider.g.dart';

@riverpod
class SearchRecipe extends _$SearchRecipe {
  @override
  String build() {
    return '';
  }

  void updateSearch(String text) {
    state = text;
  }
}
