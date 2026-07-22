class Solution {
public:
    vector<string> printVertically(string s) {
        vector<string> words;
        stringstream ss(s);
        string word;
        while (ss >> word) {
            words.push_back(word);
        }
        int maxLen = 0;
        for (const auto& w : words) {
            if (w.length() > maxLen) {
                maxLen = w.length();
            }
        }
        vector<string> res;
        for (int i = 0; i < maxLen; i++) {
            string currWord;
            for (const auto& w : words) {
                if (i < w.length()) {
                    currWord += w[i];
                } else {
                    currWord += ' ';
                }
            }
            while (!currWord.empty() && currWord.back() == ' ') {
                currWord.pop_back();
            }
            res.push_back(currWord);
        }
        return res;
    }
};
