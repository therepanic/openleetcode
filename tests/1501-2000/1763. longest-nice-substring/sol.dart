class Solution {
  String longestNiceSubstring(String s) {
    int lenS = s.length;
    if (lenS <= 1) return "";

    Map<String, int> charToFreqMap = {};
    for (int i = 0; i < s.length; i++) {
      charToFreqMap[s[i]] = (charToFreqMap[s[i]] ?? 0) + 1;
    }
    
    bool isBroken = false;
    int i = 0;
    while (i < s.length) {
      String ch = s[i];
      if (ch.codeUnitAt(0) >= 97 && ch.codeUnitAt(0) <= 122 && charToFreqMap.containsKey(ch.toUpperCase())) {
        // pass
      } else if (ch.codeUnitAt(0) >= 65 && ch.codeUnitAt(0) <= 90 && charToFreqMap.containsKey(ch.toLowerCase())) {
        // pass
      } else {
        isBroken = true;
        break;
      }
      i++;
    }

    if (!isBroken) return s;
    
    String longestNiceSubstr1 = longestNiceSubstring(s.substring(0, i));
    String longestNiceSubstr2 = longestNiceSubstring(s.substring(i + 1));
    
    return longestNiceSubstr1.length >= longestNiceSubstr2.length ? longestNiceSubstr1 : longestNiceSubstr2;
  }
}
