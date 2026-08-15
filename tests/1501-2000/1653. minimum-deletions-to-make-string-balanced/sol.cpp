class Solution {
public:
    int minimumDeletions(string s) {
        int res = 0;
        int count = 0;
        for (char ch : s) {
            if (ch == 'b') {
                count++;
            } else if (count > 0) {
                res++;
                count--;
            }
        }
        return res;
    }
};
