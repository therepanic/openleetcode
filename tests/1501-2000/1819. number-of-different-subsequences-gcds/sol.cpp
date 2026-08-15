class Solution {
public:
    int countDifferentSubsequenceGCDs(vector<int>& nums) {
        unordered_set<int> seen(nums.begin(), nums.end());
        int maxi = *max_element(nums.begin(), nums.end());
        int cnt = 0;
        for (int i = 1; i <= maxi; i++) {
            int gd = 0;
            for (int j = i; j <= maxi; j += i) {
                if (seen.count(j)) {
                    gd = gcd(gd, j);
                }
            }
            if (gd == i) cnt++;
        }
        return cnt;
    }
    
private:
    int gcd(int a, int b) {
        while (b != 0) {
            int temp = a % b;
            a = b;
            b = temp;
        }
        return a;
    }
};
