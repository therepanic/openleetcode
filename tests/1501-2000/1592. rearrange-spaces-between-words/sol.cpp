class Solution {
public:
    string reorderSpaces(string text) {
        vector<string> words;
        stringstream ss(text);
        string word;
        while (ss >> word) {
            words.push_back(word);
        }
        int total = count(text.begin(), text.end(), ' ');
        if (words.size() == 1) {
            return words[0] + string(total, ' ');
        }
        int gap = total / (words.size() - 1);
        int extra = total % (words.size() - 1);
        string result;
        for (int i = 0; i < words.size(); ++i) {
            if (i > 0) result += string(gap, ' ');
            result += words[i];
        }
        result += string(extra, ' ');
        return result;
    }
};
