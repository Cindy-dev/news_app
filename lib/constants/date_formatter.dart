import 'package:intl/intl.dart';

String dateFormatter(String dateString, String formatString) {
  final DateTime dateTime = DateTime.parse(dateString);
  final String formattedDate = timeAgo(dateTime);
  return formattedDate;
}

String timeAgo(DateTime date) {
  final Duration diff = DateTime.now().difference(date);
  if (diff.inDays > 0) {
    if (diff.inDays == 1) {
      return '${diff.inDays} day ago';
    }
    return '${diff.inDays} days ago';
  } else if (diff.inHours > 0) {
    return '${diff.inHours} hours ago';
  } else if (diff.inMinutes > 0) {
    return '${diff.inMinutes} minutes ago';
  } else {
    return 'just now';
  }
}



String formatDate(String dateString,) {
  final DateTime dateTime = DateTime.parse(dateString);
  final DateFormat formatter = DateFormat("MMMM dd, yyyy");
  final String formattedDate = formatter.format(dateTime);
  return formattedDate;
}
