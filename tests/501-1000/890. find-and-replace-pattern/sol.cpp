class Solution {
public:
    vector<string> findAndReplacePattern(vector<string>& words, string pattern) {
        vector<int> counts;
        for (char c : pattern) {
            counts.push_back(pattern.find(c));
        }
        vector<string> res;
        for (string& word : words) {
            vector<int> count;
            for (char c : word) {
                count.push_back(word.find(c));
            }
            if (count == counts) {
                res.push_back(word);
            }
        }
        return res;
    }
};
