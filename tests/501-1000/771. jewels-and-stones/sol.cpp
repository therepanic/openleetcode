class Solution {
public:
    int numJewelsInStones(string jewels, string stones) {
        int count = 0;
        for (char i : jewels) {
            if (stones.find(i) != string::npos) {
                for (char s : stones) {
                    if (s == i) count++;
                }
            }
        }
        return count;
    }
};
