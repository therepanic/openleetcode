public class Solution {
    public string OrderlyQueue(string s, int k) {
        if (k > 1) {
            char[] chars = s.ToCharArray();
            System.Array.Sort(chars);
            return new string(chars);
        }
        
        string res = s;
        for (int i = 0; i < s.Length; i++) {
            s = s.Substring(1) + s[0];
            if (string.Compare(s, res) < 0) {
                res = s;
            }
        }
        
        return res;
    }
}
