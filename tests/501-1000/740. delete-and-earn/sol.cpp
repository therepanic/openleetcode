class Solution {
public:
    int deleteAndEarn(vector<int>& nums) {
        unordered_map<int, int> count;
        for (int num : nums) {
            count[num]++;
        }
        vector<int> uniqueNums;
        for (auto& p : count) {
            uniqueNums.push_back(p.first);
        }
        sort(uniqueNums.begin(), uniqueNums.end());
        int prev = -1;
        int take = 0, skip = 0;
        bool hasPrev = false;

        for (int num : uniqueNums) {
            int maxPoints = max(skip, take);
            if (hasPrev && prev == num - 1) {
                take = num * count[num] + skip;
                skip = maxPoints;
            } else {
                take = num * count[num] + maxPoints;
                skip = maxPoints;
            }
            prev = num;
            hasPrev = true;
        }

        return max(take, skip);
    }
};
