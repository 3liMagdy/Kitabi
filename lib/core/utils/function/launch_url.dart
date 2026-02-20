
import 'package:flutter/material.dart';
import 'package:kitabi/core/utils/function/custom_snack_bar.dart';
import 'package:url_launcher/url_launcher.dart';

/// Attempts to open [url]. Returns `true` on success, `false` otherwise.
///
/// Uses `SnackBarService` to report user-facing errors. Prefer this helper
/// instead of calling `launchUrl` directly from widgets, so error handling
/// and UX are consistent.
Future<bool> launchCustomUrl(BuildContext context, String? url) async {
  if (url == null || url.trim().isEmpty) {
    SnackBarService.show(context, 'No URL provided');
    return false;
  }
  final parsed = Uri.tryParse(url);
  if (parsed == null) {
    SnackBarService.show(context, 'Invalid URL: $url');
    return false;
  }

  // Capture the messenger before any async gaps to avoid using BuildContext
  // after awaits (see lint: use_build_context_synchronously).
  final messenger = ScaffoldMessenger.of(context);

  try {
    final launched = await launchUrl(parsed, mode: LaunchMode.externalApplication);
    if (!launched) {
      SnackBarService.showWithMessenger(messenger, 'Could not open URL');
      return false;
    }
    return true;
  } catch (e) {
    SnackBarService.showWithMessenger(messenger, 'Error launching URL');
    return false;
  }
}

/// Backwards-compatible alias for older code that used the misspelled name.
Future<bool> launchCustomUr(BuildContext context, String? url) =>
    launchCustomUrl(context, url);