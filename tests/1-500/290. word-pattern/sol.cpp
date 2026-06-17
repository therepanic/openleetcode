class Solution {
public:
    bool wordPattern(string pattern, string s) {
        vector<string> words;
        stringstream ss(s);
        string word;
        while (ss >> word) {
            words.push_back(word);
        }
        
        if (pattern.length() != words.size()) return false;
        
        unordered_set<char> patternSet;
        unordered_set<string> wordSet;
        unordered_set<string> pairSet;
        
        for (int i = 0; i < pattern.length(); i++) {
            patternSet.insert(pattern[i]);
            wordSet.insert(words[i]);
            pairSet.insert(string(1, pattern[i]) + "," + words[i]);
        }
        
        return patternSet.size() == wordSet.size() && wordSet.size() == pairSet.size();
    }
};
