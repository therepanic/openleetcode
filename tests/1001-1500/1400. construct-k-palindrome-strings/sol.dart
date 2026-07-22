class Solution {
  bool canConstruct(String s, int k) {
    if (s.length < k) {
      return false;
    }

    List<int> charCount = List.filled(26, 0);
    for (int i = 0; i < s.length; i++) {
      charCount[s.codeUnitAt(i) - 97]++;
    }

    int oddCount = 0;
    for (int freq in charCount) {
      if (freq % 2 != 0) {
        oddCount++;
      }
    }

    return oddCount <= k;
  }
}
