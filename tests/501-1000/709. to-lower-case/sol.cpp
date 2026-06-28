class Solution {
public:
    string toLowerCase(string s) {
        string result = "";
        for (char ch : s) {
            if (ch >= 65 && ch <= 90) {
                result += char(ch + 32);
            } else {
                result += ch;
            }
        }
        return result;
    }
};
