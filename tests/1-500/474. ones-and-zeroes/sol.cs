using System.Collections.Generic;
using System;

public class Solution {
    public int FindMaxForm(string[] strs, int m, int n) {
        var dp = new Dictionary<string, int>();
        dp["0,0"] = 0;
        foreach (var s in strs) {
            int zeros = 0, ones = 0;
            foreach (char c in s) {
                if (c == '0') zeros++;
                else ones++;
            }
            var newDp = new Dictionary<string, int>(dp);
            foreach (var kvp in dp) {
                var parts = kvp.Key.Split(',');
                int z = int.Parse(parts[0]);
                int o = int.Parse(parts[1]);
                int size = kvp.Value;
                int newZ = z + zeros;
                int newO = o + ones;
                if (newZ <= m && newO <= n) {
                    string newKey = newZ + "," + newO;
                    if (newDp.ContainsKey(newKey)) {
                        newDp[newKey] = Math.Max(newDp[newKey], size + 1);
                    } else {
                        newDp[newKey] = size + 1;
                    }
                }
            }
            dp = newDp;
        }
        int max = 0;
        foreach (var val in dp.Values) {
            max = Math.Max(max, val);
        }
        return max;
    }
}
