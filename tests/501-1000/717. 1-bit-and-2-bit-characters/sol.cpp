class Solution {
public:
    bool isOneBitCharacter(vector<int>& bits) {
        int n = bits.size(), i = 0;
        while (i < n - 1) {
            i += 1 + (bits[i] == 1 ? 1 : 0);
        }
        return i == n - 1;
    }
};
