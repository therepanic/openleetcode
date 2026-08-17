class Solution {
public:
    string thousandSeparator(int n) {
        string s = to_string(n);
        if (s.length() <= 3) return s;
        string result = "";
        int count = 0;
        for (int i = s.length() - 1; i >= 0; i--) {
            result += s[i];
            count++;
            if (count % 3 == 0 && i > 0) {
                result += '.';
            }
        }
        reverse(result.begin(), result.end());
        return result;
    }
};
