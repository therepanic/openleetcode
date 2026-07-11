class Solution {
public:
    string mostCommonWord(string paragraph, vector<string>& banned) {
        unordered_set<string> bannedSet(banned.begin(), banned.end());
        unordered_map<string, int> counts;
        string word;
        for (size_t i = 0; i <= paragraph.size(); ++i) {
            if (i < paragraph.size() && isalpha(static_cast<unsigned char>(paragraph[i]))) {
                word += static_cast<char>(tolower(static_cast<unsigned char>(paragraph[i])));
            } else if (!word.empty()) {
                if (!bannedSet.count(word)) counts[word]++;
                word.clear();
            }
        }
        string result;
        int maxCount = 0;
        for (auto& [k, v] : counts) {
            if (v > maxCount) {
                maxCount = v;
                result = k;
            }
        }
        return result;
    }
};
