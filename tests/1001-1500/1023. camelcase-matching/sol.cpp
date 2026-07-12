class Solution {
public:
    vector<bool> camelMatch(vector<string>& queries, string pattern) {
        vector<bool> ans;
        for (const string& query : queries) {
            int j = 0;
            int i = 0;
            while (i < query.size()) {
                if (isupper(query[i]) && ((j < pattern.size() && query[i] != pattern[j]) || j > pattern.size() - 1)) {
                    break;
                }
                if (j < pattern.size() && query[i] == pattern[j]) {
                    j++;
                }
                i++;
            }
            if (i == query.size() && j == pattern.size()) {
                ans.push_back(true);
            } else {
                ans.push_back(false);
            }
        }
        return ans;
    }
};
