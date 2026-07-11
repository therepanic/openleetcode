class Solution {
public:
    bool isValid(string s) {
        if (s == "abc") {
            return true;
        }
        if (s[0] != 'a' || s[s.length() - 1] != 'c') {
            return false;
        }
        vector<char> l(s.begin(), s.end());
        for (int j = 0; j < l.size(); j++) {
            for (int i = 0; i <= (int)l.size() - 3; i++) {
                if (l.size() == 3 && l[0] == 'a' && l[1] == 'b' && l[2] == 'c') {
                    return true;
                }
                if (i + 2 <= l.size() - 1) {
                    if (l[i] == 'a' && l[i+1] == 'b' && l[i+2] == 'c') {
                        l.erase(l.begin() + i);
                        l.erase(l.begin() + i);
                        l.erase(l.begin() + i);
                        i = -1;
                        continue;
                    }
                }
            }
        }
        if (l.size() == 0) {
            return true;
        }
        return false;
    }
};
