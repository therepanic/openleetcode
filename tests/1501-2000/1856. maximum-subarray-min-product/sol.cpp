class Solution {
public:
    int maxSumMinProduct(vector<int>& nums) {
        int n = nums.size();
        vector<long long> prefix(n + 1, 0);
        for (int i = 0; i < n; i++) prefix[i+1] = prefix[i] + nums[i];
        
        vector<int> leftBound(n, -1), rightBound(n, n);
        stack<int> st;
        for (int i = 0; i < n; i++) {
            while (!st.empty() && nums[st.top()] > nums[i]) {
                rightBound[st.top()] = i;
                st.pop();
            }
            st.push(i);
        }
        while (!st.empty()) st.pop();
        for (int i = n-1; i >= 0; i--) {
            while (!st.empty() && nums[st.top()] > nums[i]) {
                leftBound[st.top()] = i;
                st.pop();
            }
            st.push(i);
        }
        
        long long maxProd = 0;
        for (int i = 0; i < n; i++) {
            int l = leftBound[i], r = rightBound[i];
            long long totalSum = prefix[r] - prefix[l+1];
            maxProd = max(maxProd, (long long)nums[i] * totalSum);
        }
        return (int)(maxProd % 1000000007LL);
    }
};
