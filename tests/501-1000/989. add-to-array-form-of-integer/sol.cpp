class Solution {
public:
    vector<int> addToArrayForm(vector<int>& num, int k) {
        vector<int> out;
        int i = (int)num.size() - 1;
        while (i >= 0 || k > 0) {
            if (i >= 0) {
                k += num[i--];
            }
            out.push_back(k % 10);
            k /= 10;
        }
        if (out.empty()) {
            return {0};
        }
        reverse(out.begin(), out.end());
        return out;
    }
};
