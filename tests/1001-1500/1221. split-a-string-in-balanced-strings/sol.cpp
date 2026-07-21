class Solution {
public:
    int balancedStringSplit(string s) {
        int bal = 0;
        int count = 0;
        for (char c : s) {
            if (c == 'L') {
                bal++;
            } else if (c == 'R') {
                bal--;
            }
            if (bal == 0) {
                count++;
            }
        }
        return count;
    }
};
