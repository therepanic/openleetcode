class Solution {
public:
    int numTriplets(vector<int>& nums1, vector<int>& nums2) {
        auto count_pairs = [](vector<int>& numsA, vector<int>& numsB) {
            unordered_map<long long, int> freq;
            for (int i = 0; i < numsB.size(); i++) {
                for (int j = i + 1; j < numsB.size(); j++) {
                    long long prod = (long long)numsB[i] * numsB[j];
                    freq[prod]++;
                }
            }
            int count = 0;
            for (int num : numsA) {
                long long sq = (long long)num * num;
                count += freq[sq];
            }
            return count;
        };
        return count_pairs(nums1, nums2) + count_pairs(nums2, nums1);
    }
};
