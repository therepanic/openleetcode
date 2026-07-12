class Solution {
public:
    int longestStrChain(vector<string>& words) {
        unordered_map<string, int> chains;
        sort(words.begin(), words.end(), [](const string& a, const string& b) {
            return a.length() < b.length();
        });
        
        for (const string& word : words) {
            chains[word] = 1;
            for (int i = 0; i < word.length(); i++) {
                string pred = word.substr(0, i) + word.substr(i + 1);
                if (chains.find(pred) != chains.end()) {
                    chains[word] = max(chains[word], chains[pred] + 1);
                }
            }
        }
        
        int maxLen = 0;
        for (const auto& pair : chains) {
            maxLen = max(maxLen, pair.second);
        }
        return maxLen;
    }
};
