class Solution {
    public int[] restoreArray(int[][] adjacentPairs) {
        Map<Integer, Integer> xorMap = new HashMap<>();
        Map<Integer, Integer> degree = new HashMap<>();

        for (int[] pair : adjacentPairs) {
            int u = pair[0], v = pair[1];
            xorMap.put(u, xorMap.getOrDefault(u, 0) ^ v);
            xorMap.put(v, xorMap.getOrDefault(v, 0) ^ u);
            degree.put(u, degree.getOrDefault(u, 0) + 1);
            degree.put(v, degree.getOrDefault(v, 0) + 1);
        }

        int start = 0;
        for (Map.Entry<Integer, Integer> entry : degree.entrySet()) {
            if (entry.getValue() == 1) {
                start = entry.getKey();
                break;
            }
        }

        int n = adjacentPairs.length + 1;
        int[] res = new int[n];

        res[0] = start;
        int prev = 0;

        for (int i = 1; i < n; i++) {
            res[i] = xorMap.get(res[i - 1]) ^ prev;
            prev = res[i - 1];
        }

        return res;
    }
}
