class Solution {
public:
    string truncateSentence(string s, int k) {
        istringstream iss(s);
        string word;
        vector<string> words;
        while (iss >> word) {
            words.push_back(word);
        }
        string result = "";
        for (int i = 0; i < k && i < words.size(); i++) {
            if (i > 0) result += " ";
            result += words[i];
        }
        return result;
    }
};
