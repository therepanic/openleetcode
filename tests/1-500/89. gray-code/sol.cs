using System.Collections.Generic;

public class Solution {
    public IList<int> GrayCode(int n) {
        int total = 1 << n;
        var res = new List<int>(total);
        for (int i = 0; i < total; i++) res.Add(i ^ (i >> 1));
        return res;
    }
}
