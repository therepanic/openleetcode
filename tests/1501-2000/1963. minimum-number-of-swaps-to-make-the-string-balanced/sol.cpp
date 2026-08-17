class Solution {
public:
    int minSwaps(string s) {
        int swap = 0;
        for (char c : s) {
            if (c == '[') {
                swap++;
            } else {
                if (swap > 0) {
                    swap--;
                }
            }
        }
        return (swap + 1) / 2;
    }
};
