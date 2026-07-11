class Solution {
public:
    vector<int> numsSameConsecDiff(int n, int k) {
        unordered_set<int> res;
        for (int x = 1; x <= 9; x++) {
            res.insert(x);
        }
        n -= 1;
        
        while (n > 0) {
            unordered_set<int> next;
            for (int val : res) {
                int last = val % 10;
                if (last + k < 10) {
                    next.insert(val * 10 + last + k);
                }
                if (last - k >= 0) {
                    next.insert(val * 10 + last - k);
                }
            }
            res = next;
            n -= 1;
        }
        
        vector<int> result(res.begin(), res.end());
        return result;
    }
};
