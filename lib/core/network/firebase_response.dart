import 'package:firebase_auth/firebase_auth.dart';
import 'package:fruits_hub/core/helper/custom_logger.dart';
import '../utils/app_strings.dart';

class FirebaseErrorHandler {
  static String getErrorMessage(dynamic error) {
    if (error is FirebaseAuthException) {
      return _handleAuthError(error);
    } else if (error is FirebaseException) {
      return _handleFirebaseError(error);
    } else {
      return AppStrings.unexpectedError;
    }
  }

  /// ✅ Errors Authentication
  static String _handleAuthError(FirebaseAuthException error) {
    switch (error.code) {
      case 'user-not-found':
        return AppStrings.invalidCredentials;
      case 'wrong-password':
        return AppStrings.invalidCredentials;

      case 'invalid-credential':
        return AppStrings.invalidCredentials;

      case 'email-already-in-use':
        return AppStrings.emailAlreadyInUse;
      case 'weak-password':
        return AppStrings.weakPassword;
      case 'invalid-email':
        return AppStrings.invalidEmail;
      case 'user-disabled':
        return AppStrings.userDisabled;
      case 'too-many-requests':
        return AppStrings.tooManyRequests;
      case 'operation-not-allowed':
        return AppStrings.operationNotAllowed;
      case 'network-request-failed':
        return AppStrings.networkRequestFailed;
      default:
        CustomLogger.red(
            "Unhandled FirebaseAuthException: ${error.code}, error massage: ${error.message}");
        return error.message ?? AppStrings.defaultAuthError;
    }
  }

  /// ✅ Errors Firestore And Storage
  static String _handleFirebaseError(FirebaseException error) {
    switch (error.code) {
      // Firestore
      case 'permission-denied':
        return AppStrings.permissionDenied;
      case 'not-found':
        return AppStrings.notFound;
      case 'already-exists':
        return AppStrings.alreadyExists;
      case 'cancelled':
        return AppStrings.cancelled;
      case 'deadline-exceeded':
        return AppStrings.deadlineExceeded;
      case 'unavailable':
        return AppStrings.unavailable;

      // Storage
      case 'object-not-found':
        return AppStrings.objectNotFound;
      case 'unauthorized':
        return AppStrings.unauthorized;
      case 'retry-limit-exceeded':
        return AppStrings.retryLimitExceeded;
      case 'quota-exceeded':
        return AppStrings.quotaExceeded;
      case 'canceled':
        return AppStrings.canceled;
      case 'invalid-checksum':
        return AppStrings.invalidChecksum;
      case 'unknown':
        return AppStrings.unknownError;

      case 'network-request-failed':
        return AppStrings.networkRequestFailed;

      default:
        CustomLogger.red(
            "Unhandled FirebaseException: ${error.code}, error massage: ${error.message}");
        return error.message ?? AppStrings.unexpectedError;
    }
  }
}
