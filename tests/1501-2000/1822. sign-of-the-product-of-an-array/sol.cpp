class Solution {
public:
    int arraySign(vector<int>& nums) {
        for (int num : nums) {
            if (num == 0) return 0;
        }
        int negatives = 0;
        for (int num : nums) negatives += num < 0;
        return negatives % 2 == 0 ? 1 : -1;
    }
};
