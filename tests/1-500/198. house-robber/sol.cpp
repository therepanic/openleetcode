#include <algorithm>
#include <vector>
using namespace std;

class Solution {
public:
    int rob(vector<int>& nums) {
        int next1 = 0;
        int next2 = 0;
        for (int i = static_cast<int>(nums.size()) - 1; i >= 0; --i) {
            int curr = max(nums[i] + next2, next1);
            next2 = next1;
            next1 = curr;
        }
        return next1;
    }
};
