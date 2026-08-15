class Solution {
public:
    bool closeStrings(string word1, string word2) {
        if (word1.length() != word2.length()) {
            return false;
        }
        set<char> set1(word1.begin(), word1.end());
        set<char> set2(word2.begin(), word2.end());
        if (set1 != set2) {
            return false;
        }
        unordered_map<int, int> dct;
        for (char x : set1) {
            int n1 = count(word1.begin(), word1.end(), x);
            int n2 = count(word2.begin(), word2.end(), x);
            dct[n1]++;
            dct[n2]--;
        }
        for (auto& [k, v] : dct) {
            if (v != 0) {
                return false;
            }
        }
        return true;
    }
};
