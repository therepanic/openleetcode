class Solution {
public:
    vector<vector<string>> groupAnagrams(vector<string>& strs) {
        unordered_map<string, vector<string>> groups;
        vector<string> keys;

        for (auto& word : strs) {
            string key = word;
            sort(key.begin(), key.end());
            if (!groups.count(key)) {
                keys.push_back(key);
            }
            groups[key].push_back(word);
        }

        vector<vector<string>> res;
        for (auto& key : keys) {
            res.push_back(groups[key]);
        }
        return res;
    }
};
