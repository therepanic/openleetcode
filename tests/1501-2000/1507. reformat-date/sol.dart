class Solution {
  String reformatDate(String date) {
    final monthDict = {
      'Jan': '01', 'Feb': '02', 'Mar': '03', 'Apr': '04',
      'May': '05', 'Jun': '06', 'Jul': '07', 'Aug': '08',
      'Sep': '09', 'Oct': '10', 'Nov': '11', 'Dec': '12',
    };
    final parts = date.split(' ');
    var day = parts[0].substring(0, parts[0].length - 2);
    if (day.length == 1) day = '0$day';
    final month = monthDict[parts[1]]!;
    final year = parts[2];
    return '$year-$month-$day';
  }
}
