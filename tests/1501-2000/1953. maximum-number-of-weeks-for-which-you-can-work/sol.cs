public class Solution {
    public long NumberOfWeeks(int[] milestones) {
        long total = 0;
        long maxVal = 0;
        foreach (int m in milestones) {
            total += m;
            if (m > maxVal) maxVal = m;
        }
        if (maxVal <= total - maxVal) {
            return total;
        } else {
            return 2 * (total - maxVal) + 1;
        }
    }
}
