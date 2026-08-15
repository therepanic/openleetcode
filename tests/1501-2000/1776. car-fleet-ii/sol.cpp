class Solution {
public:
    vector<double> getCollisionTimes(vector<vector<int>>& cars) {
        int n = cars.size();
        vector<int> rightGreater(n, -1);
        vector<double> ans(n, -1.0);
        vector<int> stack;
        for (int r = n - 1; r >= 0; r--) {
            while (!stack.empty() && cars[stack.back()][1] >= cars[r][1]) {
                stack.pop_back();
            }
            if (!stack.empty()) {
                rightGreater[r] = stack.back();
            }
            stack.push_back(r);
        }
        for (int r = n - 1; r >= 0; r--) {
            int collideId = rightGreater[r];
            while (collideId != -1 && ans[collideId] != -1 && ans[collideId] < (double)(cars[collideId][0] - cars[r][0]) / (cars[r][1] - cars[collideId][1])) {
                collideId = rightGreater[collideId];
            }
            if (collideId != -1) {
                ans[r] = (double)(cars[collideId][0] - cars[r][0]) / (cars[r][1] - cars[collideId][1]);
            }
        }
        return ans;
    }
};
