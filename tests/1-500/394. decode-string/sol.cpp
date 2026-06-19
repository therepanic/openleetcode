class Solution {
private:
    int i = 0;
    
public:
    string decodeString(string s) {
        return decode(s);
    }
    
    string decode(string& s) {
        string res = "";
        int num = 0;
        while (i < s.length()) {
            char c = s[i];
            if (isdigit(c)) {
                num = num * 10 + (c - '0');
                i++;
            } else if (c == '[') {
                i++;
                string inner = decode(s);
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
};
