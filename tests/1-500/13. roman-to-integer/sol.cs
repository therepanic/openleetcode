using System;
using System.Collections.Generic;

public class Solution {
    public int RomanToInt(string s) {
        var roman = new Dictionary<char, int> {
            ['I'] = 1, ['V'] = 5, ['X'] = 10, ['L'] = 50, ['C'] = 100, ['D'] = 500, ['M'] = 1000
        };
        int res = 0;
        for (int i = 0; i + 1 < s.Length; i++) {
            if (roman[s[i]] < roman[s[i + 1]]) res -= roman[s[i]];
            else res += roman[s[i]];
        }
        return res + roman[s[s.Length - 1]];
    }
}
