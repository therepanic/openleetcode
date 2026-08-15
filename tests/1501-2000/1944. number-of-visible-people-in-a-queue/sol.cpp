class Solution {
public:
    vector<int> canSeePersonsCount(vector<int>& heights) {
        int n = heights.size();
        vector<int> result(n, 0);
        vector<int> stack;

        for (int i = n-1; i >= 0; i--) {
            int height = heights[i];
            int visibility = 0;

            while (!stack.empty() && height > stack.back()) {
                stack.pop_back();
                visibility++;
            }

            if (!stack.empty()) {
                visibility++;
            }

            result[i] = visibility;
            stack.push_back(height);
        }

        return result;
    }
};
