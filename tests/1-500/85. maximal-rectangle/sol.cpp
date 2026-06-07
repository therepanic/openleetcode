class Solution {
public:
    int maximalRectangle(vector<vector<char>>& matrix) {
        if (matrix.empty() || matrix[0].empty()) return 0;
        int cols = (int)matrix[0].size();
        vector<int> heights(cols, 0);
        int ans = 0;
        auto largest = [&](const vector<int>& h) {
            vector<int> stack;
            int best = 0;
            for (int i = 0; i <= cols; ++i) {
                int cur = i == cols ? 0 : h[i];
                while (!stack.empty() && h[stack.back()] > cur) {
                    int height = h[stack.back()];
                    stack.pop_back();
                    int left = stack.empty() ? -1 : stack.back();
                    best = max(best, height * (i - left - 1));
                }
                stack.push_back(i);
            }
            return best;
        };
        for (auto& row : matrix) {
            for (int c = 0; c < cols; ++c) heights[c] = row[c] == '1' ? heights[c] + 1 : 0;
            ans = max(ans, largest(heights));
        }
        return ans;
    }
};
