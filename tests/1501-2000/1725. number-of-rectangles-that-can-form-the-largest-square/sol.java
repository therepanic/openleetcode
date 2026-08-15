class Solution {
    public int countGoodRectangles(int[][] rectangles) {
        int maxLen = 0;
        for (int[] rec : rectangles) {
            maxLen = Math.max(maxLen, Math.min(rec[0], rec[1]));
        }
        int count = 0;
        for (int[] rec : rectangles) {
            if (Math.min(rec[0], rec[1]) == maxLen) {
                count++;
            }
        }
        return count;
    }
}
