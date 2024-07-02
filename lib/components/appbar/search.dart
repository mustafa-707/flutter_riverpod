import 'package:flutter/material.dart';
import 'package:flutter_templete/utils/constants.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Widget searchField;

  const SearchAppBar({
    super.key,
    required this.searchField,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PreferredSize(
      preferredSize: const Size.fromHeight(xAppBarHeight),
      child: AppBar(
        title: searchField,
        bottomOpacity: 0.0,
        elevation: 0.0,
        leadingWidth: 0,
        leading: const SizedBox(),
        centerTitle: true,
        toolbarHeight: xAppBarHeight,
        backgroundColor: theme.colorScheme.primary,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(xAppRadius),
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(xAppBarHeight);
}
