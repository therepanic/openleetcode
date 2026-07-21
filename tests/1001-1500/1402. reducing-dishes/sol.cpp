class Solution {
public:
    int maxSatisfaction(vector<int>& satisfaction) {
        sort(satisfaction.begin(), satisfaction.end(), greater<int>());
        int presum = 0, res = 0;
        for (int s : satisfaction) {
            presum += s;
            if (presum < 0) break;
            res += presum;
        }
        return res;
    }
};
