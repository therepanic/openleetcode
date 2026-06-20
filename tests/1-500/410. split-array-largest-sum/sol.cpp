class Solution {
private:
    bool helper(vector<int>& nums, int perK, int k) {
        int count = 1;
        int currSum = 0;
        for (int num : nums) {
            if (currSum + num > perK) {
                count++;
                currSum = num;
            } else {
                currSum += num;
            }
        }
        return count <= k;
    }

public:
    int splitArray(vector<int>& nums, int k) {
        int high = 0;
        int low = 0;
        for (int num : nums) {
            high += num;
            low = max(low, num);
        }
        int soln = 0;
        while (low <= high) {
            int mid = low + (high - low) / 2;
            if (helper(nums, mid, k)) {
                soln = mid;
                high = mid - 1;
            } else {
                low = mid + 1;
            }
        }
        return soln;
    }
};
