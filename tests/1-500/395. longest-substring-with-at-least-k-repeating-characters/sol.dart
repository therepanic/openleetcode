class Solution {
  int longestSubstring(String s, int k) {
    int longestLen = 0;
    int n = s.length;

    for (int targetUniqueChars = 1; targetUniqueChars <= 26; targetUniqueChars++) {
      List<int> charFreq = List.filled(26, 0);
      int uniqueChars = 0;
      int charsMeetingKFreq = 0;
      int left = 0;

      for (int right = 0; right < n; right++) {
        int currIdx = s.codeUnitAt(right) - 'a'.codeUnitAt(0);

        if (charFreq[currIdx] == 0) {
          uniqueChars++;
        }
        if (charFreq[currIdx] == k - 1) {
          charsMeetingKFreq++;
        }
        charFreq[currIdx]++;

        while (uniqueChars > targetUniqueChars) {
          int leftIdx = s.codeUnitAt(left) - 'a'.codeUnitAt(0);

          if (charFreq[leftIdx] == 1) {
            uniqueChars--;
          }
          if (charFreq[leftIdx] == k) {
            charsMeetingKFreq--;
          }
          charFreq[leftIdx]--;
          left++;
        }

        if (uniqueChars == targetUniqueChars && charsMeetingKFreq == uniqueChars) {
          if (right - left + 1 > longestLen) {
            longestLen = right - left + 1;
          }
        }
      }
    }

    return longestLen;
  }
}
