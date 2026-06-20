class Solution {
public:
    int longestConsecutive(vector<int>& nums) {
        unordered_set<int> seen(nums.begin(), nums.end());
        int best = 0;
        for (int num : seen) {
            if (seen.count(num - 1)) continue;
            int current = num, streak = 1;
            while (seen.count(current + 1)) { current++; streak++; }
            best = max(best, streak);
        }
        return best;
    }
};
