using System;
using System.Collections.Generic;

public class Solution {
    public IList<IList<int>> Permute(int[] nums) {
        var res = new List<IList<int>>();
        Dfs(0, nums, res);
        return res;
    }

    private void Dfs(int i, int[] nums, List<IList<int>> res) {
        if (i == nums.Length) {
            res.Add(new List<int>(nums));
            return;
        }

        for (int j = i; j < nums.Length; j++) {
            (nums[i], nums[j]) = (nums[j], nums[i]);
            Dfs(i + 1, nums, res);
            (nums[i], nums[j]) = (nums[j], nums[i]);
        }
    }
}
