using System;
using System.Collections.Generic;

public class Solution {
    public IList<IList<int>> SubsetsWithDup(int[] nums) {
        Array.Sort(nums);
        var res = new List<IList<int>>();
        var cur = new List<int>();
        Dfs(0, nums, cur, res);
        return res;
    }

    private void Dfs(int start, int[] nums, List<int> cur, List<IList<int>> res) {
        res.Add(new List<int>(cur));
        for (int i = start; i < nums.Length; i++) {
            if (i > start && nums[i] == nums[i - 1]) continue;
            cur.Add(nums[i]);
            Dfs(i + 1, nums, cur, res);
            cur.RemoveAt(cur.Count - 1);
        }
    }
}
