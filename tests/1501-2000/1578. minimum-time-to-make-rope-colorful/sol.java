class Solution {
    public int minCost(String colors, int[] neededTime) {
        int n = colors.length();
        int sum = 0;
        for (int i = 1; i < n; i++) {
            if (colors.charAt(i) == colors.charAt(i - 1)) {
                sum += Math.min(neededTime[i], neededTime[i - 1]);
                neededTime[i] = Math.max(neededTime[i], neededTime[i - 1]);
            }
        }
        return sum;
    }
}
