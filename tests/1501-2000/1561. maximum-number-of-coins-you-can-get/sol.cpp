class Solution {
public:
    int maxCoins(vector<int>& piles) {
        sort(piles.begin(), piles.end());
        int l = 0;
        int r = piles.size();
        int count = 0;
        for (int i = 0; i < piles.size()/3; i++) {
            count += piles[r-2];
            l += 1;
            r -= 2;
        }
        return count;
    }
};
