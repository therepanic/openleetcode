class Solution {
public:
    int countCharacters(vector<string>& words, string chars) {
        unordered_map<char, int> ch;
        for (char c : chars) {
            ch[c]++;
        }
        
        int res = 0;
        for (const string& word : words) {
            unordered_map<char, int> copy = ch;
            bool good = true;
            for (char c : word) {
                if (copy.find(c) != copy.end() && copy[c] > 0) {
                    copy[c]--;
                } else {
                    res -= word.length();
                    good = false;
                    break;
                }
            }
            res += word.length();
        }
        return res;
    }
};
