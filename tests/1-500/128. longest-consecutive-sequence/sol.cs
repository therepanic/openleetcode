public class Solution {
    public int LongestConsecutive(int[] nums) {
        var seen = new HashSet<int>(nums);
        int best = 0;
        foreach (int num in seen) {
            if (seen.Contains(num - 1)) continue;
            int current = num, streak = 1;
            while (seen.Contains(current + 1)) { current++; streak++; }
            best = System.Math.Max(best, streak);
        }
        return best;
    }
}
