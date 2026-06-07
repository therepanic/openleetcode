using System.Collections.Generic;

public class Solution {
    public IList<string> RestoreIpAddresses(string s) {
        var result = new List<string>();
        Backtrack(s, 0, new List<string>(), result);
        return result;
    }

    private void Backtrack(string s, int index, List<string> parts, List<string> result) {
        if (parts.Count == 4) {
            if (index == s.Length) {
                result.Add(string.Join(".", parts));
            }
            return;
        }

        for (int len = 1; len <= 3 && index + len <= s.Length; len++) {
            string segment = s.Substring(index, len);
            if (IsValid(segment)) {
                parts.Add(segment);
                Backtrack(s, index + len, parts, result);
                parts.RemoveAt(parts.Count - 1);
            }
        }
    }

    private bool IsValid(string segment) {
        if (segment.Length > 1 && segment[0] == '0') {
            return false;
        }
        return int.Parse(segment) <= 255;
    }
}
