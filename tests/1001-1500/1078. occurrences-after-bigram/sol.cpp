class Solution {
public:
    vector<string> findOcurrences(string text, string first, string second) {
        vector<string> words;
        istringstream iss(text);
        string word;
        while (iss >> word) {
            words.push_back(word);
        }
        vector<string> result;
        for (int i = 0; i < (int)words.size() - 2; i++) {
            if (words[i] == first && words[i + 1] == second) {
                result.push_back(words[i + 2]);
            }
        }
        return result;
    }
};
