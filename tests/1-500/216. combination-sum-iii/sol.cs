using System.Collections.Generic;

public class Solution {
    public IList<IList<int>> CombinationSum3(int k, int n) {
        IList<IList<int>> res = new List<IList<int>>();
        Backtrack(1, new List<int>(), n, k, res);
        return res;
    }

    private void Backtrack(int start, IList<int> path, int target, int k, IList<IList<int>> res) {
        if (target == 0 && k == 0) {
            res.Add(new List<int>(path));
            return;
        }
        for (int i = start; i <= 9; i++) {
            if (i > target || k <= 0) break;
            path.Add(i);
            Backtrack(i + 1, path, target - i, k - 1, res);
            path.RemoveAt(path.Count - 1);
        }
    }
}
