using System;
using System.Collections.Generic;

public class Solution {
    public IList<IList<int>> PermuteUnique(int[] nums) {
        Array.Sort(nums);
        var res = new List<IList<int>>();
        var used = new bool[nums.Length];
        Dfs(nums, used, new List<int>(), res);
        return res;
    }

    private void Dfs(int[] nums, bool[] used, List<int> cur, List<IList<int>> res) {
        if (cur.Count == nums.Length) {
            res.Add(new List<int>(cur));
            return;
        }

        for (int i = 0; i < nums.Length; i++) {
            if (used[i]) continue;
            if (i > 0 && nums[i] == nums[i - 1] && !used[i - 1]) continue;
            used[i] = true;
            cur.Add(nums[i]);
            Dfs(nums, used, cur, res);
            cur.RemoveAt(cur.Count - 1);
            used[i] = false;
        }
    }
}
