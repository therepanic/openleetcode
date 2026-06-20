class Solution {
  int findMaximumXOR(List<int> nums) {
    int maxNum = nums.reduce((a, b) => a > b ? a : b);
    int mxBit = maxNum.bitLength;
    
    List<List<int>> trie = [[-1, -1]];
    
    void insert(int num) {
      int node = 0;
      for (int i = mxBit - 1; i >= 0; i--) {
        int bit = (num >> i) & 1;
        if (trie[node][bit] == -1) {
          trie[node][bit] = trie.length;
          trie.add([-1, -1]);
        }
        node = trie[node][bit];
      }
    }
    
    int getMax(int num) {
      int node = 0;
      int ans = 0;
      for (int i = mxBit - 1; i >= 0; i--) {
        int bit = (num >> i) & 1;
        int opp = 1 - bit;
        if (trie[node][opp] != -1) {
          ans |= (1 << i);
          node = trie[node][opp];
        } else {
          node = trie[node][bit];
        }
      }
      return ans;
    }
    
    for (int num in nums) {
      insert(num);
    }
    
    int res = 0;
    for (int num in nums) {
      int val = getMax(num);
      if (val > res) res = val;
    }
    
    return res;
  }
}
