class Solution {
    public int findMaximumXOR(int[] nums) {
        int maxNum = 0;
        for (int num : nums) maxNum = Math.max(maxNum, num);
        int mxBit = Integer.toBinaryString(maxNum).length();
        
        int[][] trie = new int[1][2];
        trie[0][0] = -1;
        trie[0][1] = -1;
        
        for (int num : nums) {
            int node = 0;
            for (int i = mxBit - 1; i >= 0; i--) {
                int bit = (num >> i) & 1;
                if (trie[node][bit] == -1) {
                    trie[node][bit] = trie.length;
                    trie = java.util.Arrays.copyOf(trie, trie.length + 1);
                    trie[trie.length - 1] = new int[]{-1, -1};
                }
                node = trie[node][bit];
            }
        }
        
        int res = 0;
        for (int num : nums) {
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
            res = Math.max(res, ans);
        }
        
        return res;
    }
}
