class Solution {
public:
    int minOperations(vector<int>& nums1, vector<int>& nums2) {
        int x = accumulate(nums1.begin(), nums1.end(), 0);
        int y = accumulate(nums2.begin(), nums2.end(), 0);
        if (x == y) return 0;
        
        if (x < y) {
            if (6*nums1.size() < nums2.size()) return -1;
            vector<int> gains;
            for (int v : nums1) gains.push_back(6-v);
            for (int v : nums2) gains.push_back(v-1);
            sort(gains.begin(), gains.end(), greater<int>());
            int diff = y - x;
            int ops = 0;
            for (int g : gains) {
                if (diff <= 0) break;
                diff -= g;
                ops++;
            }
            return diff <= 0 ? ops : -1;
        } else {
            if (6*nums2.size() < nums1.size()) return -1;
            vector<int> gains;
            for (int v : nums1) gains.push_back(v-1);
            for (int v : nums2) gains.push_back(6-v);
            sort(gains.begin(), gains.end(), greater<int>());
            int diff = x - y;
            int ops = 0;
            for (int g : gains) {
                if (diff <= 0) break;
                diff -= g;
                ops++;
            }
            return diff <= 0 ? ops : -1;
        }
    }
};
