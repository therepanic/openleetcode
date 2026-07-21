class Solution {
    public int maxStudents(char[][] seats) {
        int m = seats.length;
        int n = seats[0].length;
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

        java.util.List<Integer> validMasks = new java.util.ArrayList<>();
        for (int mask = 0; mask < (1 << n); mask++) {
            if ((mask & (mask << 1)) == 0) {
                validMasks.add(mask);
            }
        }

        java.util.Map<Integer, Integer> dp = new java.util.HashMap<>();
        dp.put(0, 0);
        for (int row = 0; row < m; row++) {
            java.util.Map<Integer, Integer> nextDp = new java.util.HashMap<>();
            for (int current : validMasks) {
                if ((current & ~available[row]) != 0) continue;
                int count = Integer.bitCount(current);
                for (java.util.Map.Entry<Integer, Integer> entry : dp.entrySet()) {
                    int previous = entry.getKey();
                    int total = entry.getValue();
                    if ((current & ((previous << 1) | (previous >> 1))) != 0) continue;
                    nextDp.put(current, Math.max(nextDp.getOrDefault(current, 0), total + count));
                }
            }
            dp = nextDp;
        }

        int maxVal = 0;
        for (int val : dp.values()) {
            maxVal = Math.max(maxVal, val);
        }
        return maxVal;
    }
}
