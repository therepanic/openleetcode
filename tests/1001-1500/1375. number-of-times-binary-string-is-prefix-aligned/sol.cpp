class Solution {
public:
    int numTimesAllBlue(vector<int>& flips) {
        int res = 0;
        int maxFlips = 0;
        
        for (int i = 0; i < flips.size(); i++) {
            maxFlips = max(maxFlips, flips[i]);
            if (maxFlips == i + 1) {
                res++;
            }
        }
        
        return res;
    }
};
