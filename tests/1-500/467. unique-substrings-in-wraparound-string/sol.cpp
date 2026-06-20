class Solution {
public:
    int findSubstringInWraproundString(string s) {
        vector<int> counts(26, 0);
        int maxLen = 0;

        for (int i = 0; i < s.size(); i++) {
            if (i > 0 && (s[i] - s[i-1] + 26) % 26 == 1) {
                maxLen++;
            } else {
                maxLen = 1;
            }
            int idx = s[i] - 'a';
            counts[idx] = max(counts[idx], maxLen);
        }

        int sum = 0;
        for (int count : counts) {
            sum += count;
        }

        return sum;
    }
};
