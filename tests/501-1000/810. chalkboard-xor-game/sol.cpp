class Solution {
public:
    bool xorGame(vector<int>& nums) {
        int totalXor = 0;
        for (int value : nums) {
            totalXor ^= value;
        }
        
        bool isXorZero = (totalXor == 0);
        bool hasEvenLength = (nums.size() % 2 == 0);
        
        return isXorZero || hasEvenLength;
    }
};
