class Solution {
  int getKth(int lo, int hi, int k) {
    List<List<int>> vc = [];
    for (int i = lo; i <= hi; i++) {
      int num = i;
      int count = 0;
      while (num != 1) {
        if (num % 2 == 0) {
          num ~/= 2;
        } else {
          num = 3 * num + 1;
        }
        count++;
      }
      vc.add([i, count]);
    }
    vc.sort((a, b) {
      if (a[1] != b[1]) return a[1].compareTo(b[1]);
      return a[0].compareTo(b[0]);
    });
    return vc[k - 1][0];
  }
}
