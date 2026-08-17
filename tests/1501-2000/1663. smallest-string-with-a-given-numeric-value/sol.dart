class Solution {
  String getSmallestString(int n, int k) {
    List<String> res = List.filled(n, 'a');
    k -= n;

    int i = n - 1;
    while (k > 0) {
      int add = k < 25 ? k : 25;
      res[i] = String.fromCharCode('a'.codeUnitAt(0) + add);
      k -= add;
      i--;
    }

    return res.join();
  }
}
