import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:neubrutalism_ui/neubrutalism_ui.dart';
import 'package:todoapp/utils/height_width_converter.dart';
import 'package:todoapp/utils/snack_bar/content_type.dart';

class CustomSnackbarUtil {
  static void showSuccess({required String message, String title = ''}) {
    _showSnackbar(
      title: title.isEmpty ? 'Success' : title,
      message: message,
      contentType: ContentType.success,
      icon: Icons.check, // Use the appropriate icon for success
    );
  }

  static void showHelp({required String message, String title = ''}) {
    _showSnackbar(
      title: title.isEmpty ? 'Help' : title,
      message: message,
      contentType: ContentType.help,
      icon: Icons.help, // Use the appropriate icon for help
    );
  }

  static void showWarning({required String message, String title = ''}) {
    _showSnackbar(
      title: title.isEmpty ? 'Warning' : title,
      message: message,
      contentType: ContentType.warning,
      icon: Icons.warning, // Use the appropriate icon for warning
    );
  }

  static void showError({required String message, String title = ''}) {
    _showSnackbar(
      title: title.isEmpty ? 'Error' : title,
      message: message,
      contentType: ContentType.failure,
      icon: Icons.error, // Use the appropriate icon for failure
    );
  }

  static void _showSnackbar({
    required String title,
    required String message,
    required ContentType contentType,
    required IconData icon,
  }) {
    final ScaffoldMessengerState? messenger =
        Get.find<GlobalKey<ScaffoldMessengerState>>().currentState;

    if (messenger != null) {
      messenger.showSnackBar(SnackBar(
        elevation: 0,
        duration: const Duration(seconds: 1),
        behavior: SnackBarBehavior.floating,
        backgroundColor: Colors.transparent,
        content: NeuCard(
          cardColor: contentType.color,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  color: Colors.white,
                ),
                SizedBox(
                  width: widthValue(10),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      message,
                      style: const TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ));
    }
  }
}
