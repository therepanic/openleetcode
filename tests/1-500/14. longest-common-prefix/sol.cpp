class Solution {
public:
    string longestCommonPrefix(vector<string>& strs) {
        if (strs.empty()) return "";
        sort(strs.begin(), strs.end());
        string ans;
        int i = 0;
        while (i < (int)strs[0].size() && strs[0][i] == strs.back()[i]) {
            ans.push_back(strs[0][i]);
            ++i;
        }
        return ans;
    }
};
