class Solution {
public:
    string licenseKeyFormatting(string s, int k) {
        string str;
        for (char c : s) {
            if (c != '-') str += toupper(c);
        }
        vector<string> result;
        int n = str.length();
        for (int i = n; i > 0; i -= k) {
            int start = max(0, i - k);
            result.insert(result.begin(), str.substr(start, i - start));
        }
        string res;
        for (int i = 0; i < result.size(); ++i) {
            if (i > 0) res += "-";
            res += result[i];
        }
        return res;
    }
};
