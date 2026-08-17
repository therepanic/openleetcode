class Solution {
public:
    int reductionOperations(vector<int>& nums) {
        vector<int> freq(50001, 0);
        for (int num : nums) {
            freq[num]++;
        }
        int idx = 1;
        while (freq[idx] == 0) idx++;
        int val = 0, total = 0;
        for (int i = 50000; i > idx; i--) {
            if (freq[i] > 0) {
                val += freq[i];
                total += val;
            }
        }
        return total;
    }
};
