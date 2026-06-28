class Solution {
public:
    bool judgePoint24(vector<int>& cards) {
        const double EPS = 1e-6;
        vector<double> nums(cards.begin(), cards.end());

        function<bool(vector<double>&)> dfs = [&](vector<double>& nums) -> bool {
            if (nums.size() == 1) {
                return abs(nums[0] - 24.0) < EPS;
            }

            for (int i = 0; i < nums.size(); i++) {
                for (int j = 0; j < nums.size(); j++) {
                    if (i == j) continue;

                    vector<double> nextNums;
                    for (int k = 0; k < nums.size(); k++) {
                        if (k != i && k != j) {
                            nextNums.push_back(nums[k]);
                        }
                    }

                    double a = nums[i], b = nums[j];
                    vector<double> candidates = {a + b, a - b, b - a, a * b};
                    if (abs(b) > EPS) candidates.push_back(a / b);
                    if (abs(a) > EPS) candidates.push_back(b / a);

                    for (double val : candidates) {
                        nextNums.push_back(val);
                        if (dfs(nextNums)) return true;
                        nextNums.pop_back();
                    }
                }
            }
            return false;
        };

        return dfs(nums);
    }
};
