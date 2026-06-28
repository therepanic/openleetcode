class Solution {
  List<int> constructArray(int n, int k) {
    List<int> ans = List.generate(n - k, (i) => i + 1);
    for (int i = 0; i < k; i++) {
        int diff = i ~/ 2 + 1;
        if (i % 2 == 0) {
            ans.add(n - diff + 1);
        } else {
            ans.add(n - k + diff);
        }
    }
    return ans;
  }
}
