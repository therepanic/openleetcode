public class Solution {
    private int PopCount(int value) {
        int count = 0;
        while (value != 0) { value &= value - 1; count++; }
        return count;
    }
    public int MaxStudents(char[][] seats) {
        int m = seats.Length;
        int n = seats[0].Length;
        int[] available = new int[m];
        for (int i = 0; i < m; i++) {
            int mask = 0;
            for (int j = 0; j < n; j++) {
                if (seats[i][j] == '.') {
                    mask |= 1 << j;
                }
            }
            available[i] = mask;
        }

        var validMasks = new System.Collections.Generic.List<int>();
        for (int mask = 0; mask < (1 << n); mask++) {
            if ((mask & (mask << 1)) == 0) {
                validMasks.Add(mask);
            }
        }

        var dp = new System.Collections.Generic.Dictionary<int, int> { { 0, 0 } };
        for (int row = 0; row < m; row++) {
            var nextDp = new System.Collections.Generic.Dictionary<int, int>();
            foreach (int current in validMasks) {
                if ((current & ~available[row]) != 0) continue;
                int count = PopCount(current);
                foreach (var pair in dp) {
                    int previous = pair.Key;
                    int total = pair.Value;
                    if ((current & ((previous << 1) | (previous >> 1))) != 0) continue;
                    if (nextDp.ContainsKey(current)) {
                        nextDp[current] = Math.Max(nextDp[current], total + count);
                    } else {
                        nextDp[current] = total + count;
                    }
                }
            }
            dp = nextDp;
        }

        int maxVal = 0;
        foreach (int val in dp.Values) {
            maxVal = Math.Max(maxVal, val);
        }
        return maxVal;
    }
}
