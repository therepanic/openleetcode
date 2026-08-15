class Solution {
  List<int> maximizeXor(List<int> nums, List<List<int>> queries) {
    List<List<int>> trie = [
      [-1, -1]
    ];
    void insert(int num) {
      int node = 0;
      for (int i = 31; i >= 0; i--) {
        int bit = (num >> i) & 1;
        if (trie[node][bit] == -1) {
          trie[node][bit] = trie.length;
          trie.add([-1, -1]);
        }
        node = trie[node][bit];
      }
    }
    int maxor(int num) {
      if (trie[0][0] == -1 && trie[0][1] == -1) return -1;
      int node = 0;
      int ans = 0;
      for (int i = 31; i >= 0; i--) {
        int bit = (num >> i) & 1;
        int opp = 1 - bit;
        if (trie[node][opp] != -1) {
          ans |= 1 << i;
          node = trie[node][opp];
        } else {
          node = trie[node][bit];
        }
      }
      return ans;
    }

    nums.sort();
    List<List<int>> q = [];
    for (int i = 0; i < queries.length; i++) {
      q.add([queries[i][1], queries[i][0], i]);
    }
    q.sort((a, b) => a[0].compareTo(b[0]));
    List<int> res = List.filled(queries.length, -1);
    int idx = 0;
    int n = nums.length;
    for (var item in q) {
      int m = item[0];
      int x = item[1];
      int i = item[2];
      while (idx < n && nums[idx] <= m) {
        insert(nums[idx]);
        idx++;
      }
      res[i] = maxor(x);
    }
    return res;
  }
}
