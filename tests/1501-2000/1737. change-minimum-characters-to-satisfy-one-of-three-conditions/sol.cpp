class Solution {
public:
    int minCharacters(string a, string b) {
        vector<int> freqA(26, 0);
        vector<int> freqB(26, 0);

        for (char ch : a) freqA[ch - 'a']++;
        for (char ch : b) freqB[ch - 'a']++;

        int lenA = a.size();
        int lenB = b.size();
        int res = INT_MAX;
        int sumA = 0, sumB = 0;

        for (int i = 0; i < 25; i++) {
            sumA += freqA[i];
            sumB += freqB[i];
            res = min(res, lenA - sumA + sumB);
            res = min(res, lenB - sumB + sumA);
        }

        for (int i = 0; i < 26; i++) {
            res = min(res, (lenA - freqA[i]) + (lenB - freqB[i]));
        }

        return res;
    }
};
