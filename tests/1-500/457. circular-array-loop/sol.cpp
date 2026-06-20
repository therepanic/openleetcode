class Solution {
public:
    bool circularArrayLoop(vector<int>& nums) {
        int n = nums.size();
        auto nextIndex = [&](int i) {
            return ((i + nums[i]) % n + n) % n;
        };

        for (int i = 0; i < n; i++) {
            int slow = i;
            int fast = nextIndex(i);
            while (nums[slow] * nums[fast] > 0 && nums[slow] * nums[nextIndex(fast)] > 0) {
                if (slow == fast) {
                    if (slow == nextIndex(slow)) break;
                    return true;
                }
                slow = nextIndex(slow);
                fast = nextIndex(nextIndex(fast));
            }
            int j = i;
            while (nums[j] * nums[nextIndex(j)] > 0) {
                int temp = j;
                j = nextIndex(j);
                nums[temp] = 0;
            }
        }
        return false;
    }
};
