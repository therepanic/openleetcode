class Solution {
  bool isAnagram(String s, String t) {
    if (s.length != t.length) {
      return false;
    }
    
    List<int> arr = List.filled(26, 0);
    
    for (int i = 0; i < s.length; i++) {
      arr[s.codeUnitAt(i) - 'a'.codeUnitAt(0)]++;
      arr[t.codeUnitAt(i) - 'a'.codeUnitAt(0)]--;
    }
    
    for (int check in arr) {
      if (check != 0) {
        return false;
      }
    }
    
    return true;
  }
}
