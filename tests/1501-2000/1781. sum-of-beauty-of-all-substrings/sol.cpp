class Solution {
public:
    int beautySum(string s) {
        int n = s.size();
        int sumOfBeauty = 0;
        for (int i = 0; i < n; i++) {
            vector<int> freq(26, 0);
            for (int j = i; j < n; j++) {
                freq[s[j] - 'a']++;
                int maxi = -1;
                int mini = INT_MAX;
                for (int diff : freq) {
                    if (diff > 0) {
                        maxi = max(maxi, diff);
                        mini = min(mini, diff);
                    }
                }
                sumOfBeauty += maxi - mini;
            }
        }
        return sumOfBeauty;
    }
};
