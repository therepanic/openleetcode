class Solution {
public:
    int maxScoreSightseeingPair(vector<int>& values) {
        int n = values.size();
        vector<int> suffixMax(n);
        suffixMax[n - 1] = values[n - 1] - (n - 1);
        
        for (int i = n - 2; i >= 0; i--) {
            suffixMax[i] = max(suffixMax[i + 1], values[i] - i);
        }
        
        int maxScore = INT_MIN;
        for (int i = 0; i < n - 1; i++) {
            maxScore = max(maxScore, values[i] + i + suffixMax[i + 1]);
        }
        
        return maxScore;
    }
};
