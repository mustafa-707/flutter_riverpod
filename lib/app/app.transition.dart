import 'package:flutter/material.dart';
import 'package:flutter_templete/utils/helpers/extensions.dart';

PageRouteBuilder<T> createLtrRtlTransition<T>({
  required WidgetBuilder builder,
  required RouteSettings settings,
}) {
  return PageRouteBuilder<T>(
    settings: settings,
    pageBuilder: (context, _, __) => builder(context),
    transitionsBuilder: (context, animation, _, child) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(
        begin: context.isRtl ? -begin : begin,
        end: end,
      ).chain(
        CurveTween(curve: curve),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

PageRouteBuilder<T> createDialogTransition<T>({
  required WidgetBuilder builder,
  required RouteSettings settings,
}) {
  return PageRouteBuilder<T>(
    settings: settings,
    pageBuilder: (context, _, __) => builder(context),
    transitionsBuilder: (_, animation, __, child) {
      const begin = Offset(0.0, 1.0);
      const end = Offset.zero;
      const curve = Curves.easeInOut;

      var tween = Tween(begin: begin, end: end).chain(
        CurveTween(curve: curve),
      );

      return SlideTransition(
        position: animation.drive(tween),
        child: child,
      );
    },
  );
}

PageRouteBuilder<T> createAppTransition<T>({
  required WidgetBuilder builder,
  required RouteSettings settings,
}) {
  return PageRouteBuilder<T>(
    settings: settings,
    pageBuilder: (
      context,
      _,
      __,
    ) =>
        builder(context),
    transitionsBuilder: (
      context,
      animation,
      _,
      child,
    ) {
      const curve = Curves.easeInOut;

      // Fade transition
      var fadeTween = Tween(begin: 0.0, end: 1.0).chain(
        CurveTween(curve: curve),
      );

      // Scale transition
      var scaleTween = Tween(begin: 0.8, end: 1.0).chain(
        CurveTween(curve: curve),
      );

      return FadeTransition(
        opacity: animation.drive(fadeTween),
        child: ScaleTransition(
          scale: animation.drive(scaleTween),
          child: child,
        ),
      );
    },
  );
}
