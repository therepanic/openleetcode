class Solution {
public:
    bool isPossible(vector<int>& nums) {
        unordered_map<int, int> count;
        unordered_map<int, int> subseq;

        for (int num : nums) {
            count[num]++;
        }

        for (int num : nums) {
            if (count[num] == 0) continue;
            if (subseq[num - 1] > 0) {
                subseq[num - 1]--;
                subseq[num]++;
            } else if (count[num + 1] > 0 && count[num + 2] > 0) {
                count[num + 1]--;
                count[num + 2]--;
                subseq[num + 2]++;
            } else {
                return false;
            }
            count[num]--;
        }

        return true;
    }
};
