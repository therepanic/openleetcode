class Solution {
  String restoreString(String s, List<int> indices) {
    List<String> res = List.filled(indices.length, '');
    for (int i = 0; i < indices.length; i++) {
      res[indices[i]] = s[i];
    }
    return res.join();
  }
}
