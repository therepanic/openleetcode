public class Solution {
    public string LicenseKeyFormatting(string s, int k) {
        s = s.Replace("-", "").ToUpper();
        List<string> result = new List<string>();
        int i = s.Length;
        while (i > 0) {
            int start = Math.Max(0, i - k);
            result.Insert(0, s.Substring(start, i - start));
            i -= k;
        }
        return string.Join("-", result);
    }
}
