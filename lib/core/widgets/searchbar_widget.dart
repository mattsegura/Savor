import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:meal_ai/core/provider/search_provider.dart';
import 'package:meal_ai/core/styles/sizes.dart';

class SearchBarWidget extends ConsumerWidget {
  final bool showFilter;

  const SearchBarWidget({Key? key, this.showFilter = false}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: PaddingSizes.sm),
      child: Row(
        children: [
          Expanded(
            child: TextFormField(
              onChanged: (value) {
                ref.read(searchRecipeProvider.notifier).updateSearch(value);
              },
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                hintText: 'Search any recipes',
                contentPadding: const EdgeInsets.symmetric(
                    vertical: PaddingSizes.sm, horizontal: PaddingSizes.sm),
                prefixIconConstraints:
                    const BoxConstraints(minHeight: 10, minWidth: 10),
                prefixIcon: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: PaddingSizes.xs),
                  child: SvgPicture.asset(
                    'images/search-normal.svg',
                  ),
                ),
                suffixIconConstraints:
                    const BoxConstraints(minHeight: 10, minWidth: 10),
                suffixIcon: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: PaddingSizes.xs),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      SvgPicture.asset(
                        'images/line-6.svg',
                      ),
                      const SizedBox(width: PaddingSizes.sm),
                      SvgPicture.asset(
                        'images/setting-4.svg',
                      ),
                    ],
                  ),
                ),
                border: OutlineInputBorder(
                  borderSide: BorderSide.none,
                  borderRadius: kStandardBorderRadius,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
