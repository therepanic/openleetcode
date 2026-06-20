class Solution {
public:
    int maxProfit(vector<int>& prices) {
        int a = INT_MIN;
        int b = 0;
        int c = 0;
        for (int p : prices) {
            int newA = max(a, c - p);
            int newB = a + p;
            int newC = max(c, b);
            a = newA;
            b = newB;
            c = newC;
        }
        return max(b, c);
    }
};
