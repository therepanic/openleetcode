class Solution {
  int numOfStrings(List<String> patterns, String word) {
    int count = 0;
    for (String s in patterns) {
      if (word.contains(s)) {
        count++;
      }
    }
    return count;
  }
}
