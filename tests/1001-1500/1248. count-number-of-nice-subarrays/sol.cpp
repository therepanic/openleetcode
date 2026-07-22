class Solution {
public:
    int numberOfSubarrays(vector<int>& nums, int k) {
        unordered_map<int, int> count;
        count[0] = 1;
        int odd = 0;
        int answer = 0;
        for (int value : nums) {
            odd += value % 2;
            answer += count[odd - k];
            count[odd]++;
        }
        return answer;
    }
};
