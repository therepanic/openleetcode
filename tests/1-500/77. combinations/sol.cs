using System;
using System.Collections.Generic;

public class Solution {
    public IList<IList<int>> Combine(int n, int k) {
        var res = new List<IList<int>>();
        var cur = new List<int>();
        Dfs(1, n, k, cur, res);
        return res;
    }

    private void Dfs(int start, int n, int k, List<int> cur, List<IList<int>> res) {
        if (cur.Count == k) {
            res.Add(new List<int>(cur));
            return;
        }
        for (int i = start; i <= n; i++) {
            cur.Add(i);
            Dfs(i + 1, n, k, cur, res);
            cur.RemoveAt(cur.Count - 1);
        }
    }
}
