class Solution {
  bool arrayStringsAreEqual(List<String> word1, List<String> word2) {
    String s1 = word1.join();
    String s2 = word2.join();
    return s1 == s2;
  }
}
