class Solution {
public:
    vector<string> buildArray(vector<int>& target, int n) {
        vector<int> s;
        vector<string> res;
        int a = 0;
        for (int i = 1; i <= n; i++) {
            if (s == target) return res;
            s.push_back(i);
            res.push_back("Push");
            if (s[a] != target[a]) {
                s.pop_back();
                res.push_back("Pop");
            } else {
                a++;
            }
        }
        return res;
    }
};
