class Solution {
  int kthSmallest(List<List<int>> mat, int k) {
    List<int> sums = mat[0].take(k).toList();
    for (int i = 1; i < mat.length; i++) {
      List<int> row = mat[i].take(k).toList();
      List<int> next = [];
      for (int a in sums) {
        for (int b in row) {
          next.add(a + b);
        }
      }
      next.sort();
      sums = next.take(k).toList();
    }
    return sums[k - 1];
  }
}
