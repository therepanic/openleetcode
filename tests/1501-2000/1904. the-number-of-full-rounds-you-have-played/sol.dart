class Solution {
  int numberOfRounds(String loginTime, String logoutTime) {
    int toMinutes(String t) {
      List<String> parts = t.split(":");
      return int.parse(parts[0]) * 60 + int.parse(parts[1]);
    }

    int start = toMinutes(loginTime);
    int end = toMinutes(logoutTime);

    if (end < start) {
      end += 24 * 60;
    }

    int startRound = (start + 14) ~/ 15;
    int endRound = end ~/ 15;

    return (endRound - startRound) < 0 ? 0 : endRound - startRound;
  }
}
