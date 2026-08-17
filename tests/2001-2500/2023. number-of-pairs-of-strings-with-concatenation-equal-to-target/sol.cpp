class Solution {
public:
    int numOfPairs(vector<string>& nums, string target) {
        unordered_map<string, int> freq;
        for (const string& num : nums) {
            freq[num]++;
        }

        int totalCnt = 0;

        for (const string& num : nums) {
            if (target.rfind(num, 0) == 0) {
                string remain = target.substr(num.length());

                if (remain == num) {
                    totalCnt += freq[remain] - 1;
                } else {
                    totalCnt += freq[remain];
                }
            }
        }

        return totalCnt;
    }
};
