class Solution {
public:
    string sortSentence(string s) {
        unordered_map<int, string> words;
        stringstream ss(s);
        string word;
        while (ss >> word) {
            int key = word.back() - '0';
            words[key] = word.substr(0, word.length() - 1);
        }
        string result;
        for (int i = 1; i <= 9; i++) {
            auto it = words.find(i);
            if (it == words.end()) continue;
            if (!result.empty()) result += " ";
            result += it->second;
        }
        return result;
    }
};
