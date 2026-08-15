public class Solution {
    public int CountGoodRectangles(int[][] rectangles) {
        int maxLen = 0;
        foreach (var rec in rectangles) {
            maxLen = Math.Max(maxLen, Math.Min(rec[0], rec[1]));
        }
        int count = 0;
        foreach (var rec in rectangles) {
            if (Math.Min(rec[0], rec[1]) == maxLen) {
                count++;
            }
        }
        return count;
    }
}
