class Solution {
public:
    int largestRectangleArea(vector<int>& heights) {
        vector<int> stack;
        int ans = 0;
        for (int i = 0; i <= (int)heights.size(); ++i) {
            int cur = i == (int)heights.size() ? 0 : heights[i];
            while (!stack.empty() && heights[stack.back()] > cur) {
                int h = heights[stack.back()];
                stack.pop_back();
                int left = stack.empty() ? -1 : stack.back();
                ans = max(ans, h * (i - left - 1));
            }
            stack.push_back(i);
        }
        return ans;
    }
};
