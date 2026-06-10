class Solution {
  List<List<String>> partition(String s) {
    final result = <List<String>>[];
    final path = <String>[];
    bool isPalindrome(int left, int right) {
      while (left < right) { if (s[left] != s[right]) return false; left++; right--; }
      return true;
    }
    void backtrack(int index) {
      if (index == s.length) { result.add(List<String>.from(path)); return; }
      for (var end = index; end < s.length; end++) {
        if (isPalindrome(index, end)) {
          path.add(s.substring(index, end + 1));
          backtrack(end + 1);
          path.removeLast();
        }
      }
    }
    backtrack(0);
    return result;
  }
}
