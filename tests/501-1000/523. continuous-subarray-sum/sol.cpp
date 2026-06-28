class Solution {
public:
    bool checkSubarraySum(vector<int>& nums, int k) {
        if (nums.empty()) return false;

        int prefixSum = 0;
        unordered_map<int, int> remainderMap;
        remainderMap[0] = -1;

        for (int i = 0; i < nums.size(); i++) {
            prefixSum += nums[i];
            int remainder = prefixSum % k;

            if (remainderMap.find(remainder) != remainderMap.end()) {
                if (i - remainderMap[remainder] > 1) return true;
            } else {
                remainderMap[remainder] = i;
            }
        }

        return false;
    }
};
