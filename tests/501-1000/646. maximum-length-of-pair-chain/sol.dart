class Solution {
  int findLongestChain(List<List<int>> pairs) {
    pairs.sort((a, b) => a[1].compareTo(b[1]));
    List<int> prev = pairs[0];
    int res = 1;
    for (int i = 1; i < pairs.length; i++) {
      List<int> cur = pairs[i];
      if (cur[0] > prev[1]) {
        res++;
        prev = cur;
      }
    }
    return res;
  }
}
