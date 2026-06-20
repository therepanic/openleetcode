class Solution {
  bool isPalindrome(String s) {
    return s == s.split('').reversed.join('');
  }

  List<List<int>> palindromePairs(List<String> words) {
    List<List<int>> ans = [];
    Map<String, int> wordMap = {};
    for (int i = 0; i < words.length; i++) {
      wordMap[words[i].split('').reversed.join('')] = i;
    }

    if (wordMap.containsKey("")) {
      int emptyIdx = wordMap[""]!;
      for (int i = 0; i < words.length; i++) {
        if (words[i] != "" && isPalindrome(words[i])) {
          ans.add([i, emptyIdx]);
        }
      }
    }

    for (int i = 0; i < words.length; i++) {
      String word = words[i];
      for (int j = 0; j < word.length; j++) {
        String left = word.substring(0, j + 1);
        String right = word.substring(j + 1);
        if (wordMap.containsKey(left) && isPalindrome(right) && wordMap[left] != i) {
          ans.add([i, wordMap[left]!]);
        }
        if (wordMap.containsKey(right) && isPalindrome(left) && wordMap[right] != i) {
          ans.add([wordMap[right]!, i]);
        }
      }
    }
    return ans;
  }
}
