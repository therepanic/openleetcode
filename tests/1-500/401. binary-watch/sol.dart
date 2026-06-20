class Solution {
  List<String> readBinaryWatch(int turnedOn) {
    List<String> result = [];
    for (int hour = 0; hour < 12; hour++) {
      for (int minute = 0; minute < 60; minute++) {
        int hourBits = hour.toRadixString(2).replaceAll('0', '').length;
        int minuteBits = minute.toRadixString(2).replaceAll('0', '').length;
        if (hourBits + minuteBits == turnedOn) {
          result.add('$hour:${minute.toString().padLeft(2, '0')}');
        }
      }
    }
    return result;
  }
}
