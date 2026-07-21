public class Solution {
    public int MaxSatisfaction(int[] satisfaction) {
        Array.Sort(satisfaction, (a, b) => b.CompareTo(a));
        int presum = 0, res = 0;
        foreach (int s in satisfaction) {
            presum += s;
            if (presum < 0) break;
            res += presum;
        }
        return res;
    }
}
