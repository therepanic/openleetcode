public class Solution {
    public string MakeLargestSpecial(string s) {
        int count = 0;
        int i = 0;
        var res = new List<string>();
        
        for (int j = 0; j < s.Length; j++) {
            count += (s[j] == '1' ? 1 : -1);
            
            if (count == 0) {
                res.Add("1" + MakeLargestSpecial(s.Substring(i + 1, j - i - 1)) + "0");
                i = j + 1;
            }
        }
        
        res.Sort((a, b) => b.CompareTo(a));
        return string.Join("", res);
    }
}
