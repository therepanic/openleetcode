class Solution {
    public int countPairs(int[] nums, int low, int high) {
        int maxVal = 0;
        for (int n : nums) maxVal = Math.max(maxVal, n);
        int width = 1;
        while ((1 << width) <= Math.max(maxVal, high + 1)) width++;
        final int bits = width;

        java.util.function.Function<Integer, Integer> countLess = bound -> {
            if (bound <= 0) return 0;
            int[][] child = new int[400005][2];
            for (int[] row : child) { row[0] = -1; row[1] = -1; }
            int[] counts = new int[400005];
            int usedNodes = 1;
            int total = 0;
            for (int value : nums) {
                int node = 0;
                for (int bit = bits - 1; bit >= 0; bit--) {
                    int v = (value >> bit) & 1;
                    int b = (bound >> bit) & 1;
                    if (b == 1) {
                        int same = child[node][v];
                        if (same != -1) total += counts[same];
                        if (node >= child.length || node < 0) { node = -1; break; }
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
                    if (node < 0 || node >= child.length) break;
                    int nxt = child[node][v];
                    if (nxt == -1) {
                        nxt = usedNodes++;
                        child[node][v] = nxt;
                        child[nxt][0] = -1;
                        child[nxt][1] = -1;
                    }
                    node = nxt;
                    counts[node]++;
                }
            }
            return total;
        };

        return countLess.apply(high + 1) - countLess.apply(low);
    }
}
