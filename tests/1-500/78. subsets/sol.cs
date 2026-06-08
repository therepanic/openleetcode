using System;
using System.Collections.Generic;

public class Solution {
    public IList<IList<int>> Subsets(int[] nums) {
        var res = new List<IList<int>> { new List<int>() };
        foreach (var x in nums) {
            int sz = res.Count;
            for (int i = 0; i < sz; i++) {
                var cur = new List<int>(res[i]) { x };
                res.Add(cur);
            }
        }
        return res;
    }
}
