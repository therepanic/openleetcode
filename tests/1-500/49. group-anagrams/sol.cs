using System;
using System.Collections.Generic;

public class Solution {
    public IList<IList<string>> GroupAnagrams(string[] strs) {
        var groups = new Dictionary<string, List<string>>();
        var keys = new List<string>();

        foreach (var word in strs) {
            var chars = word.ToCharArray();
            Array.Sort(chars);
            var key = new string(chars);
            if (!groups.ContainsKey(key)) {
                groups[key] = new List<string>();
                keys.Add(key);
            }
            groups[key].Add(word);
        }

        var res = new List<IList<string>>();
        foreach (var key in keys) {
            res.Add(groups[key]);
        }
        return res;
    }
}
