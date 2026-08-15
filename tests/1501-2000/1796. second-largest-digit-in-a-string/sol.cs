using System;
using System.Linq;
using System.Collections.Generic;

public class Solution {
    public int SecondHighest(string s) {
        var digits = new HashSet<int>();
        foreach (char c in s) {
            if (char.IsDigit(c)) {
                digits.Add(c - '0');
            }
        }
        if (digits.Count > 1) {
            int max = digits.Max();
            digits.Remove(max);
            return digits.Max();
        }
        return -1;
    }
}
