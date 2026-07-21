class Solution {
public:
    int numIdenticalPairs(vector<int>& nums) {
        unordered_map<int, int> pairs;
        int count = 0;
        for (int num : nums) {
            if (pairs.find(num) != pairs.end()) {
                count += pairs[num];
            }
            pairs[num]++;
        }
        return count;
    }
};
