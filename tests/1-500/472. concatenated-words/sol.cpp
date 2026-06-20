class Solution {
public:
    vector<string> findAllConcatenatedWordsInADict(vector<string>& words) {
        vector<string> res;
        unordered_set<string> wordSet(words.begin(), words.end());
        unordered_set<string> incorrect;
        
        function<bool(const string&)> dfs = [&](const string& word) -> bool {
            if (wordSet.count(word)) return true;
            if (incorrect.count(word)) return false;
            
            for (int i = 1; i < word.length(); i++) {
                string prefix = word.substr(0, i);
                if (wordSet.count(prefix)) {
                    string suffix = word.substr(i);
                    if (dfs(suffix)) {
                        return true;
                    } else {
                        incorrect.insert(suffix);
                    }
                }
            }
            
            incorrect.insert(word);
            return false;
        };
        
        for (const string& word : words) {
            wordSet.erase(word);
            if (dfs(word)) {
                res.push_back(word);
            }
            wordSet.insert(word);
        }
        
        return res;
    }
};
