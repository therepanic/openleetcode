class Solution {
public:
    int minAbsDifference(vector<int>& nums, int goal) {
        auto sums = [](const vector<int>& values) {
            vector<int> result = {0};
            for (int value : values) {
                int currentLen = result.size();
                for (int i = 0; i < currentLen; i++) {
                    result.push_back(result[i] + value);
                }
            }
            return result;
        };
        int mid = nums.size() / 2;
        vector<int> left = sums(vector<int>(nums.begin(), nums.begin() + mid));
        vector<int> right = sums(vector<int>(nums.begin() + mid, nums.end()));
        sort(left.begin(), left.end());
        sort(right.begin(), right.end());
        int answer = abs(goal);
        int j = right.size() - 1;
        for (int value : left) {
            while (j > 0 && right[j - 1] >= goal - value) {
                j--;
            }
            answer = min(answer, abs(value + right[j] - goal));
            if (j > 0) {
                answer = min(answer, abs(value + right[j - 1] - goal));
            }
        }
        return answer;
    }
};
