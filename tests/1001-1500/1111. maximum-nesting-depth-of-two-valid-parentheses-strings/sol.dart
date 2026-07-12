class Solution {
  List<int> maxDepthAfterSplit(String seq) {
    List<int> res = [];
    int depth = 0;
    for (int i = 0; i < seq.length; i++) {
      String ch = seq[i];
      if (ch == '(') {
        depth++;
        res.add(depth % 2);
      } else {
        res.add(depth % 2);
        depth--;
      }
    }
    return res;
  }
}
