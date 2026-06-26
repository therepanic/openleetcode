class Solution {
public:
    int subarraySum(vector<int>& nums, int k) {
        unordered_map<int, int> sub_num;
        sub_num[0] = 1;
        int total = 0;
        int count = 0;
        
        for (int n : nums) {
            total += n;
            
            if (sub_num.find(total - k) != sub_num.end()) {
                count += sub_num[total - k];
            }
            
            sub_num[total]++;
        }
        
        return count;
    }
};
