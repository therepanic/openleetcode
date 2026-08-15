public class Solution {
    public string LongestNiceSubstring(string s) {
        int len_s = s.Length;
        if (len_s <= 1) return "";

        Dictionary<char, int> charToFreqMap = new Dictionary<char, int>();
        foreach (char c in s) {
            charToFreqMap[c] = charToFreqMap.GetValueOrDefault(c, 0) + 1;
        }
        
        bool isBroken = false;
        int i = 0;
        while (i < s.Length) {
            char ch = s[i];
            if (char.IsLower(ch) && charToFreqMap.ContainsKey(char.ToUpper(ch))) {
                // pass
            } else if (char.IsUpper(ch) && charToFreqMap.ContainsKey(char.ToLower(ch))) {
                // pass
            } else {
                isBroken = true;
                break;
            }
            i++;
        }

        if (!isBroken) return s;
        
        string longestNiceSubstr1 = LongestNiceSubstring(s.Substring(0, i));
        string longestNiceSubstr2 = LongestNiceSubstring(s.Substring(i + 1));
        
        return longestNiceSubstr1.Length >= longestNiceSubstr2.Length ? longestNiceSubstr1 : longestNiceSubstr2;
    }
}
