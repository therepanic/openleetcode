class Solution {
public:
    vector<int> decrypt(vector<int>& code, int k) {
        int n = code.size();
        vector<int> result(n, 0);
        
        if (k == 0) return result;

        int window = abs(k);
        int total = 0;

        int start = k > 0 ? 1 : n - window;
        int end = k > 0 ? window : n - 1;

        for (int i = start; i <= end; i++) {
            total += code[i % n];
        }
        for (int i = 0; i < n; i++) {
            result[i] = total;

            total -= code[start % n];
            start++;

            end++;
            total += code[end % n];
        }
        return result;
    }
};
