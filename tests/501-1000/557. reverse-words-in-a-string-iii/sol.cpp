class Solution {
public:
    string reverseWords(string s) {
        istringstream iss(s);
        string word;
        vector<string> words;
        while (iss >> word) {
            reverse(word.begin(), word.end());
            words.push_back(word);
        }
        string result;
        for (int i = 0; i < words.size(); i++) {
            result += words[i];
            if (i < words.size() - 1) {
                result += " ";
            }
        }
        return result;
    }
};
