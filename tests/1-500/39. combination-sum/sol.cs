using System;
using System.Collections.Generic;

public class Solution {
    public IList<IList<int>> CombinationSum(int[] candidates, int target) {
        Array.Sort(candidates);
        var res = new List<IList<int>>();
        Dfs(0, target, candidates, new List<int>(), res);
        return res;
    }

    private void Dfs(int start, int target, int[] candidates, List<int> cur, List<IList<int>> res) {
        if (target == 0) {
            res.Add(new List<int>(cur));
            return;
        }

        for (int i = start; i < candidates.Length; i++) {
            if (candidates[i] > target) break;
            cur.Add(candidates[i]);
            Dfs(i, target - candidates[i], candidates, cur, res);
            cur.RemoveAt(cur.Count - 1);
        }
    }
}
