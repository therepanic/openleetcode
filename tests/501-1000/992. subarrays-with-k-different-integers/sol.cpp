class Solution {
public:
    int subarraysWithKDistinct(vector<int>& nums, int k) {
        auto atMost = [&](int k) -> int {
            unordered_map<int, int> freq;
            int count = 0;
            int left = 0;
            int n = nums.size();

            for (int right = 0; right < n; right++) {
                freq[nums[right]]++;

                while (freq.size() > k) {
                    if (freq[nums[left]] > 1) {
                        freq[nums[left]]--;
                    } else {
                        freq.erase(nums[left]);
                    }
                    left++;
                }

                count += (right - left + 1);
            }

            return count;
        };

        return atMost(k) - atMost(k - 1);
    }
};
