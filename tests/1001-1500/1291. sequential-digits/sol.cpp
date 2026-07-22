class Solution {
public:
    vector<int> sequentialDigits(int low, int high) {
        vector<int> q;
        for (int i = 1; i <= 9; i++) {
            q.push_back(i);
        }
        for (int i = 0; i < q.size(); i++) {
            int x = q[i];
            int d = x % 10;
            if (d < 9) {
                q.push_back(x * 10 + d + 1);
            }
        }
        vector<int> result;
        for (int x : q) {
            if (low <= x && x <= high) {
                result.push_back(x);
            }
        }
        return result;
    }
};
