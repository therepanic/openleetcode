class Solution {
public:
    int numSquarefulPerms(vector<int>& nums) {
        int n = nums.size();
        sort(nums.begin(), nums.end());

        auto isSquareful = [](const vector<int>& currNums, int num) -> bool {
            if (currNums.empty()) return true;
            int prevNum = currNums.back();
            int pairSum = prevNum + num;
            if (pairSum < 0) return false;
            int sqrtN = (int)sqrt(pairSum);
            return sqrtN * sqrtN == pairSum;
        };

        function<int(int, vector<int>&)> backtrack = [&](int numsMask, vector<int>& currNums) -> int {
            if (numsMask != 0 && currNums.size() == n) return 1;
            int numSquarefulPerms = 0;
            for (int idx = 0; idx < n; idx++) {
                int num = nums[idx];
                if (idx > 0 && nums[idx] == nums[idx - 1] && (numsMask & (1 << (idx - 1))) == 0) {
                    continue;
                }
                if ((numsMask & (1 << idx)) == 0 && isSquareful(currNums, num)) {
                    currNums.push_back(num);
                    numSquarefulPerms += backtrack(numsMask | (1 << idx), currNums);
                    currNums.pop_back();
                }
            }
            return numSquarefulPerms;
        };

        vector<int> currNums;
        return backtrack(0, currNums);
    }
};
