class Solution {
public:
    bool checkIfCanBreak(string s1, string s2) {
        vector<int> freq(26, 0);
        int n = s1.length();

        for (char ch : s1) {
            freq[ch - 'a']++;
        }

        string temp1 = "";

        for (int i = 25; i >= 0; i--) {
            while (freq[i] > 0) {
                temp1 += ('a' + i);
                freq[i]--;
            }
        }

        freq = vector<int>(26, 0);

        for (char ch : s2) {
            freq[ch - 'a']++;
        }

        string temp2 = "";

        for (int i = 25; i >= 0; i--) {
            while (freq[i] > 0) {
                temp2 += ('a' + i);
                freq[i]--;
            }
        }

        bool all1 = true;
        bool all2 = true;

        for (int i = 0; i < n; i++) {
            if (temp1[i] < temp2[i]) {
                all1 = false;
            }
            if (temp2[i] < temp1[i]) {
                all2 = false;
            }
        }

        return all1 || all2;
    }
};
