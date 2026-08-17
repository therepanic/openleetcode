class Solution {
public:
    string reversePrefix(string word, char ch) {
        size_t pos = word.find(ch);
        if (pos == string::npos) {
            return word;
        }
        reverse(word.begin(), word.begin() + pos + 1);
        return word;
    }
};
