class Solution {
  int numEquivDominoPairs(List<List<int>> dominoes) {
    List<int> mpp = List.filled(100, 0);
    int count = 0;
    for (var d in dominoes) {
      int a = d[0], b = d[1];
      int key = a <= b ? a * 10 + b : b * 10 + a;
      count += mpp[key];
      mpp[key]++;
    }
    return count;
  }
}
