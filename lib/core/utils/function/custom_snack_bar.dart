
import 'package:flutter/material.dart';

/// Lightweight, reusable snack bar service for showing messages.
class SnackBarService {
  SnackBarService._();

  /// Shows a [SnackBar] with the given [message].
  ///
  /// This helper centralizes snack bar creation so callers don't need to
  /// interact with `ScaffoldMessenger` directly.
  static void show(
    BuildContext context,
    String message, {
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
    Color? backgroundColor,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: duration,
      action: action,
      backgroundColor: backgroundColor,
    );

    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  /// Variant that accepts a captured [ScaffoldMessengerState]. Use this when
  /// calling after an `await` to avoid `use_build_context_synchronously` lints.
  static void showWithMessenger(
    ScaffoldMessengerState messenger,
    String message, {
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
    Color? backgroundColor,
  }) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: duration,
      action: action,
      backgroundColor: backgroundColor,
    );

    messenger.showSnackBar(snackBar);
  }
}

/// Backwards-compatible alias used in some places in the codebase.
void customSnackBar(BuildContext context, String text) =>
    SnackBarService.show(context, text);