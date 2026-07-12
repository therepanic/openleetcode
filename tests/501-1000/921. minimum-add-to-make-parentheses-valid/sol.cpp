class Solution {
public:
    int minAddToMakeValid(string s) {
        vector<char> l = {'0'};
        for (char i : s) {
            if (l.back() == '(' && i == ')') {
                l.pop_back();
            } else {
                l.push_back(i);
            }
        }
        return l.size() - 1;
    }
};
