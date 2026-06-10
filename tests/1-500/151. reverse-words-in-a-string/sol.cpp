class Solution {
public:
    string reverseWords(string s) {
        stringstream ss(s);
        vector<string> words;
        string word;
        while (ss >> word) words.push_back(word);
        reverse(words.begin(), words.end());
        string result;
        for (int i = 0; i < (int)words.size(); ++i) {
            if (i) result += " ";
            result += words[i];
        }
        return result;
    }
};
