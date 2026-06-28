class Solution {
public:
    vector<int> dailyTemperatures(vector<int>& temperatures) {
        int n = temperatures.size();
        vector<int> ans(n, 0);
        vector<int> stack;
        stack.reserve(n);

        for (int i = 0; i < n; i++) {
            while (!stack.empty() && temperatures[i] > temperatures[stack.back()]) {
                int prev = stack.back();
                stack.pop_back();
                ans[prev] = i - prev;
            }
            stack.push_back(i);
        }

        return ans;
    }
};
