public class Solution {
    public int MaxFreq(string s, int maxLetters, int minSize, int maxSize) {
        var count = new Dictionary<string, int>();
        var unique = new Dictionary<char, int>();
        int left = 0;
        int res = 0;
        for (int right = 0; right < s.Length; right++) {
            char rc = s[right];
            if (unique.ContainsKey(rc)) unique[rc]++;
            else unique[rc] = 1;

            while (unique.Count > maxLetters || right - left + 1 > minSize) {
                char lc = s[left];
                unique[lc]--;
                if (unique[lc] == 0) {
                    unique.Remove(lc);
                }
                left++;
            }

            if (right - left + 1 == minSize && unique.Count <= maxLetters) {
                string curr = s.Substring(left, right - left + 1);
                if (count.ContainsKey(curr)) count[curr]++;
                else count[curr] = 1;
                res = Math.Max(res, count[curr]);
            }
        }
        return res;
    }
}
