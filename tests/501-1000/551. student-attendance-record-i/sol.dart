class Solution {
  bool checkRecord(String s) {
    int aCount = 0;
    int lStreak = 0;
    
    for (int i = 0; i < s.length; i++) {
      String c = s[i];
      if (c == 'A') {
        aCount++;
        if (aCount >= 2) {
          return false;
        }
      }
      if (c == 'L') {
        lStreak++;
        if (lStreak >= 3) {
          return false;
        }
      } else {
        lStreak = 0;
      }
    }
    
    return true;
  }
}
