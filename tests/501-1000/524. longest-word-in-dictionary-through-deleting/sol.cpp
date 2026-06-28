class Solution {
public:
    string findLongestWord(string s, vector<string>& dictionary) {
        string ans = "";
        for (const string& word : dictionary) {
            int i = 0, j = 0;
            while (i < word.size() && j < s.size()) {
                if (word[i] == s[j]) {
                    i++;
                }
                j++;
            }
            if (i == word.size()) {
                if (word.size() > ans.size()) {
                    ans = word;
                } else if (word.size() == ans.size() && word < ans) {
                    ans = word;
                }
            }
        }
        return ans;
    }
};
