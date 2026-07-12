class Solution {
public:
    bool hasGroupsSizeX(vector<int>& deck) {
        unordered_map<int, int> counts;
        for (int card : deck) {
            counts[card]++;
        }
        
        auto getGcd = [](int a, int b) {
            while (b > 0) {
                int temp = b;
                b = a % b;
                a = temp;
            }
            return a;
        };
        
        int currentGcd = -1;
        for (auto& [card, count] : counts) {
            if (currentGcd == -1) {
                currentGcd = count;
            } else {
                currentGcd = getGcd(currentGcd, count);
                if (currentGcd == 1) {
                    return false;
                }
            }
        }
        
        return currentGcd >= 2;
    }
};
