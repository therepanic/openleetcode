class Solution {
public:
    bool isPossibleDivide(vector<int>& nums, int k) {
        if (nums.size() % k != 0) return false;
        map<int, int> count;
        for (int num : nums) {
            count[num]++;
        }
        sort(nums.begin(), nums.end());
        for (int num : nums) {
            if (count[num] == 0) continue;
            for (int i = 0; i < k; i++) {
                int cur = num + i;
                if (count[cur] == 0) return false;
                count[cur]--;
            }
        }
        return true;
    }
};
