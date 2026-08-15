class Solution {
  String truncateSentence(String s, int k) {
    return s.split(' ').take(k).join(' ');
  }
}
