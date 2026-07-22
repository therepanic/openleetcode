class Solution {
public:
    int isPrefixOfWord(string sentence, string searchWord) {
        istringstream iss(sentence);
        string word;
        int index = 1;
        while (iss >> word) {
            if (word.substr(0, searchWord.length()) == searchWord) {
                return index;
            }
            index++;
        }
        return -1;
    }
};
