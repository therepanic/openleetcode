class Solution {
public:
    string makeFancyString(string s) {
        if (s.empty()) return "";
        string result = "";
        result += s[0];
        char last = s[0];
        int count = 1;

        for (int i = 1; i < s.size(); i++) {
            if (s[i] != last) {
                last = s[i];
                count = 0;
            }

            count++;
            if (count > 2) continue;

            result += s[i];
        }

        return result;
    }
};
