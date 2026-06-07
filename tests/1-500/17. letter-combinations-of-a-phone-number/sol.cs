using System;
using System.Collections.Generic;
using System.Text;

public class Solution {
    public IList<string> LetterCombinations(string digits) {
        if (digits.Length == 0) return new List<string>();
        string[] map = {"", "", "abc", "def", "ghi", "jkl", "mno", "pqrs", "tuv", "wxyz"};
        var res = new List<string>();
        var cur = new StringBuilder();
        Backtrack(digits, 0, map, cur, res);
        return res;
    }

    private void Backtrack(string digits, int idx, string[] map, StringBuilder cur, List<string> res) {
        if (idx == digits.Length) {
            res.Add(cur.ToString());
            return;
        }
        string letters = map[digits[idx] - '0'];
        foreach (char ch in letters) {
            cur.Append(ch);
            Backtrack(digits, idx + 1, map, cur, res);
            cur.Length--;
        }
    }
}
