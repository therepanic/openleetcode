class Solution {
    public String[] findRelativeRanks(int[] score) {
        int n = score.length;
        int[] sorted = score.clone();
        Arrays.sort(sorted);
        for (int i = 0; i < n / 2; i++) {
            int temp = sorted[i];
            sorted[i] = sorted[n - 1 - i];
            sorted[n - 1 - i] = temp;
        }
        Map<Integer, String> ranks = new HashMap<>();
        for (int i = 0; i < n; i++) {
            ranks.put(sorted[i], String.valueOf(i + 1));
        }
        ranks.put(sorted[0], "Gold Medal");
        if (n > 1) ranks.put(sorted[1], "Silver Medal");
        if (n > 2) ranks.put(sorted[2], "Bronze Medal");
        String[] result = new String[n];
        for (int i = 0; i < n; i++) {
            result[i] = ranks.get(score[i]);
        }
        return result;
    }
}
