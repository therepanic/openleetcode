class Solution {
    public int largestValsFromLabels(int[] values, int[] labels, int numWanted, int useLimit) {
        int n = values.length;
        int[][] pairs = new int[n][2];
        for (int i = 0; i < n; i++) {
            pairs[i][0] = values[i];
            pairs[i][1] = labels[i];
        }
        java.util.Arrays.sort(pairs, (a, b) -> Integer.compare(b[0], a[0]));
        int res = 0;
        java.util.Map<Integer, Integer> freq = new java.util.HashMap<>();
        for (int[] pair : pairs) {
            if (numWanted == 0) break;
            int value = pair[0];
            int label = pair[1];
            if (!freq.containsKey(label) || freq.get(label) < useLimit) {
                res += value;
                freq.put(label, freq.getOrDefault(label, 0) + 1);
                numWanted--;
            }
        }
        return res;
    }
}
