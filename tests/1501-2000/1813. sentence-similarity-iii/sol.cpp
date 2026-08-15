class Solution {
public:
    bool areSentencesSimilar(string sentence1, string sentence2) {
        vector<string> s1, s2;
        stringstream ss1(sentence1), ss2(sentence2);
        string word;
        while (ss1 >> word) s1.push_back(word);
        while (ss2 >> word) s2.push_back(word);
        
        int l1 = 0, l2 = 0, r1 = s1.size() - 1, r2 = s2.size() - 1;
        
        while (l1 <= r1 && l2 <= r2) {
            if (s1[l1] == s2[l2]) {
                l1++;
                l2++;
            } else if (s1[r1] == s2[r2]) {
                r1--;
                r2--;
            } else {
                return false;
            }
        }
        
        return true;
    }
};
