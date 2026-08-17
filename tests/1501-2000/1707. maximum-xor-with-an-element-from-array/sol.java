import java.util.*;

class Solution {
    public int[] maximizeXor(int[] nums, int[][] queries) {
        List<int[]> trie = new ArrayList<>();
        trie.add(new int[]{-1, -1});
        java.util.function.IntConsumer insert = num -> {
            int node = 0;
            for (int i = 31; i >= 0; --i) {
                int bit = (num >> i) & 1;
                if (trie.get(node)[bit] == -1) {
                    trie.get(node)[bit] = trie.size();
                    trie.add(new int[]{-1, -1});
                }
                node = trie.get(node)[bit];
            }
        };
        java.util.function.IntUnaryOperator maxor = num -> {
            if (trie.get(0)[0] == -1 && trie.get(0)[1] == -1) return -1;
            int node = 0;
            int ans = 0;
            for (int i = 31; i >= 0; --i) {
                int bit = (num >> i) & 1;
                int opp = 1 - bit;
                if (trie.get(node)[opp] != -1) {
                    ans |= (1 << i);
                    node = trie.get(node)[opp];
                } else {
                    node = trie.get(node)[bit];
                }
            }
            return ans;
        };

        Arrays.sort(nums);
        List<int[]> q = new ArrayList<>();
        for (int i = 0; i < queries.length; ++i) {
            q.add(new int[]{queries[i][1], queries[i][0], i});
        }
        q.sort((a, b) -> Integer.compare(a[0], b[0]));
        int[] res = new int[queries.length];
        Arrays.fill(res, -1);
        int idx = 0;
        int n = nums.length;
        for (int[] item : q) {
            int m = item[0], x = item[1], i = item[2];
            while (idx < n && nums[idx] <= m) {
                insert.accept(nums[idx]);
                idx++;
            }
            res[i] = maxor.applyAsInt(x);
        }
        return res;
    }
}
