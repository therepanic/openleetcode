public class Solution {
    public int CountPairs(int[] nums, int low, int high) {
        int maxVal = 0;
        foreach (int n in nums) maxVal = Math.Max(maxVal, n);
        int bits = Math.Max(1, Math.Max(Convert.ToString(maxVal, 2).Length, Convert.ToString(high + 1, 2).Length));

        Func<int, int> countLess = bound => {
            if (bound <= 0) return 0;
            var child = new List<List<int>> { new List<int> { -1, -1 } };
            var counts = new List<int> { 0 };
            int total = 0;
            foreach (int value in nums) {
                int node = 0;
                for (int bit = bits - 1; bit >= 0; bit--) {
                    int v = (value >> bit) & 1;
                    int b = (bound >> bit) & 1;
                    if (b == 1) {
                        int same = child[node][v];
                        if (same != -1) total += counts[same];
                        int nxt = child[node][1 - v];
                        if (nxt == -1) { node = -1; break; }
                        node = nxt;
                    } else {
                        int nxt = child[node][v];
                        if (nxt == -1) { node = -1; break; }
                        node = nxt;
                    }
                }
                node = 0;
                for (int bit = bits - 1; bit >= 0; bit--) {
                    int v = (value >> bit) & 1;
                    int nxt = child[node][v];
                    if (nxt == -1) {
                        nxt = child.Count;
                        child[node][v] = nxt;
                        child.Add(new List<int> { -1, -1 });
                        counts.Add(0);
                    }
                    node = child[node][v];
                    counts[node]++;
                }
            }
            return total;
        };

        return countLess(high + 1) - countLess(low);
    }
}
