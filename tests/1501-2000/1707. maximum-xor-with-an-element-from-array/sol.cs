public class Solution {
    public int[] MaximizeXor(int[] nums, int[][] queries) {
        List<int[]> trie = new List<int[]>();
        trie.Add(new int[]{-1, -1});
        void Insert(int num) {
            int node = 0;
            for (int i = 31; i >= 0; --i) {
                int bit = (num >> i) & 1;
                if (trie[node][bit] == -1) {
                    trie[node][bit] = trie.Count;
                    trie.Add(new int[]{-1, -1});
                }
                node = trie[node][bit];
            }
        }
        int Maxor(int num) {
            if (trie[0][0] == -1 && trie[0][1] == -1) return -1;
            int node = 0;
            int ans = 0;
            for (int i = 31; i >= 0; --i) {
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

        Array.Sort(nums);
        var q = new List<(int m, int x, int i)>();
        for (int i = 0; i < queries.Length; ++i) {
            q.Add((queries[i][1], queries[i][0], i));
        }
        q.Sort((a, b) => a.m.CompareTo(b.m));
        int[] res = new int[queries.Length];
        Array.Fill(res, -1);
        int idx = 0;
        int n = nums.Length;
        foreach (var item in q) {
            while (idx < n && nums[idx] <= item.m) {
                Insert(nums[idx]);
                idx++;
            }
            res[item.i] = Maxor(item.x);
        }
        return res;
    }
}
