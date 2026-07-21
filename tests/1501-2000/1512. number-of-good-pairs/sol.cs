public class Solution {
    public int NumIdenticalPairs(int[] nums) {
        var pairs = new Dictionary<int, int>();
        int count = 0;
        foreach (int num in nums) {
            if (pairs.ContainsKey(num)) {
                count += pairs[num];
            }
            pairs[num] = pairs.GetValueOrDefault(num, 0) + 1;
        }
        return count;
    }
}
