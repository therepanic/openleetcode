class Solution {
  int repeatedStringMatch(String a, String b) {
    String repeatA = a;
    int count = 1;

    while (repeatA.length < b.length) {
      repeatA += a;
      count++;
      if (repeatA.contains(b)) {
        return count;
      }
    }

    repeatA += a;
    count++;
    if (repeatA.contains(b)) {
      return count;
    }

    return -1;
  }
}
