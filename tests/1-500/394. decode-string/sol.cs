public class Solution {
    private int i = 0;
    
    public string DecodeString(string s) {
        return Decode(s);
    }
    
    private string Decode(string s) {
        string res = "";
        int num = 0;
        while (i < s.Length) {
            char c = s[i];
            if (char.IsDigit(c)) {
                num = num * 10 + (c - '0');
                i++;
            } else if (c == '[') {
                i++;
                string inner = Decode(s);
                for (int j = 0; j < num; j++) {
                    res += inner;
                }
                num = 0;
            } else if (c == ']') {
                i++;
                return res;
            } else {
                res += c;
                i++;
            }
        }
        return res;
    }
}
