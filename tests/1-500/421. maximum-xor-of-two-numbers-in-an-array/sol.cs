public class Solution {
    public int FindMaximumXOR(int[] nums) {
        int maxNum = 0;
        foreach (int num in nums) maxNum = Math.Max(maxNum, num);
        int mxBit = Convert.ToString(maxNum, 2).Length;
        
        List<int[]> trie = new List<int[]>();
        trie.Add(new int[] { -1, -1 });
        
        void Insert(int num) {
            int node = 0;
            for (int i = mxBit - 1; i >= 0; i--) {
                int bit = (num >> i) & 1;
                if (trie[node][bit] == -1) {
                    trie[node][bit] = trie.Count;
                    trie.Add(new int[] { -1, -1 });
                }
                node = trie[node][bit];
            }
        }
        
        int GetMax(int num) {
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
        
        foreach (int num in nums) Insert(num);
        
        int res = 0;
        foreach (int num in nums) res = Math.Max(res, GetMax(num));
        
        return res;
    }
}
