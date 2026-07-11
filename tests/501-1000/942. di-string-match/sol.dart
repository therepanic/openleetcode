class Solution {
  List<int> diStringMatch(String s) {
    int low = 0, high = s.length;
    List<int> result = List.filled(s.length + 1, 0);
    for (int i = 0; i < s.length; i++) {
      if (s[i] == 'I') {
        result[i] = low++;
      } else {
        result[i] = high--;
      }
    }
    result[s.length] = low;
    return result;
  }
}
