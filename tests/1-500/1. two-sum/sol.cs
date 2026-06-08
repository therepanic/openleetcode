using System.Collections.Generic;

public class Solution {
    public int[] TwoSum(int[] nums, int target) {
        var seen = new Dictionary<int, int>();
        for (int i = 0; i < nums.Length; i++) {
            var need = target - nums[i];
            if (seen.TryGetValue(need, out var j)) {
                return new[] { j, i };
            }
            seen[nums[i]] = i;
        }
        return new int[0];
    }
}
