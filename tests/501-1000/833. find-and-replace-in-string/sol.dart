class Solution {
  String findReplaceString(String s, List<int> indices, List<String> sources, List<String> targets) {
    Map<int, List<String>> patch = {};
    for (int k = 0; k < indices.length; k++) {
      int i = indices[k];
      String src = sources[k];
      String tgt = targets[k];
      if (i + src.length <= s.length && s.substring(i, i + src.length) == src) {
        patch[i] = [src, tgt];
      }
    }
    StringBuffer res = StringBuffer();
    int i = 0;
    int n = s.length;
    while (i < n) {
      if (patch.containsKey(i)) {
        var pair = patch[i]!;
        res.write(pair[1]);
        i += pair[0].length;
      } else {
        res.write(s[i]);
        i++;
      }
    }
    return res.toString();
  }
}
