class Solution {
public:
    int sumSubarrayMins(vector<int>& arr) {
        const int MOD = 1'000'000'007;
        int n = arr.size();
        stack<int> st;
        vector<long long> res(n, 0);
        for (int i = 0; i < n; i++) {
            while (!st.empty() && arr[st.top()] > arr[i]) {
                st.pop();
            }
            int j = st.empty() ? -1 : st.top();
            res[i] = (j >= 0 ? res[j] : 0) + (long long)(i - j) * arr[i];
            st.push(i);
        }
        long long sum = 0;
        for (long long v : res) {
            sum = (sum + v) % MOD;
        }
        return (int) sum;
    }
};
