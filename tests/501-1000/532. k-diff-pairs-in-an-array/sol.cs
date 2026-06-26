public class Solution {
    public int FindPairs(int[] nums, int k) {
        if (k < 0) return 0;
        int count = 0;
        var numCounts = new Dictionary<int, int>();
        foreach (int num in nums) {
            if (numCounts.ContainsKey(num)) {
                numCounts[num]++;
            } else {
                numCounts[num] = 1;
            }
        }
        foreach (var kvp in numCounts) {
            int num = kvp.Key;
            if (k == 0) {
                if (kvp.Value >= 2) count++;
            } else {
                if (numCounts.ContainsKey(num + k)) count++;
            }
        }
        return count;
    }
}
