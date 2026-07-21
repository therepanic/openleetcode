class Solution {
  String minInteger(String num, int k) {
    int n = num.length;
    Map<String, List<int>> dict = {};
    for (int i = 0; i < n; i++) {
      String ch = num[i];
      dict.putIfAbsent(ch, () => []);
      dict[ch]!.add(i);
    }
    
    List<int> bit = List.filled(n + 1, 0);
    void update(int i, int val) {
      while (i < bit.length) {
        bit[i] += val;
        i += i & -i;
      }
    }
    int query(int i) {
      int total = 0;
      while (i > 0) {
        total += bit[i];
        i -= i & -i;
      }
      return total;
    }
    
    for (int i = 1; i <= n; i++) {
      update(i, 1);
    }
    
    StringBuffer res = StringBuffer();
    int remaining = k;
    for (int pos = 0; pos < n; pos++) {
      for (String v in ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9']) {
        if (dict.containsKey(v) && dict[v]!.isNotEmpty) {
          int idx = dict[v]!.first;
          int cnt = query(idx);
          if (cnt <= remaining) {
            dict[v]!.removeAt(0);
            remaining -= cnt;
            res.write(v);
            update(idx + 1, -1);
            break;
          }
        }
      }
    }
    return res.toString();
  }
}
