class Solution {
public:
    int findLUSlength(vector<string>& strs) {
        sort(strs.begin(), strs.end(), [](const string& a, const string& b) {
            return a.size() > b.size();
        });

        auto isSubsequence = [](const string& s, const string& t) {
            int i = 0;
            for (char c : t) {
                if (i < s.size() && s[i] == c) i++;
            }
            return i == s.size();
        };

        for (int i = 0; i < strs.size(); i++) {
            bool unique = true;
            for (int j = 0; j < strs.size(); j++) {
                if (i == j) continue;
                if (isSubsequence(strs[i], strs[j])) {
                    unique = false;
                    break;
                }
            }
            if (unique) return strs[i].size();
        }

        return -1;
    }
};
