class Solution {
public:
    int minFlips(string target) {
        int minCount = 0;
        int flag = 0;
        int n = target.length();
        
        for (int i = 0; i < n; i++) {
            char expected = '0' + (flag % 2);
            if (target[i] != expected) {
                minCount++;
                flag++;
            }
        }
        
        return minCount;
    }
};
