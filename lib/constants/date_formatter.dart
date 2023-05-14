String dateFormatter(String dateString, String formatString) {
  final DateTime dateTime = DateTime.parse(dateString);
  final String formattedDate = timeAgo(dateTime);
  // final DateFormat formatter = DateFormat(formatString);
  //final String formattedDate = formatter.format(dateTime);
  return formattedDate;
}

String timeAgo(DateTime date) {
  final Duration diff = DateTime.now().difference(date);
  if (diff.inDays > 1) {
    return '${diff.inDays} days ago';
  } else if (diff.inHours == 1) {
    return '${diff.inDays} day ago';
  } else if (diff.inHours > 0) {
    return '${diff.inHours} hours ago';
  } else if (diff.inMinutes > 0) {
    return '${diff.inMinutes} minutes ago';
  } else {
    return 'just now';
  }
}
