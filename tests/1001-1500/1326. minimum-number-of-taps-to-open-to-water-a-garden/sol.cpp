class Solution {
public:
    int minTaps(int n, vector<int>& ranges) {
        vector<int> maxRange(n + 1, 0);
        
        for (int i = 0; i < ranges.size(); i++) {
            int left = max(0, i - ranges[i]);
            int right = min(n, i + ranges[i]);
            maxRange[left] = max(maxRange[left], right);
        }
        
        int end = 0, farthest = 0, taps = 0;
        int i = 0;
        
        while (end < n) {
            while (i <= end) {
                farthest = max(farthest, maxRange[i]);
                i++;
            }
            
            if (farthest <= end) {
                return -1;
            }
            
            end = farthest;
            taps++;
        }
        
        return taps;
    }
};
