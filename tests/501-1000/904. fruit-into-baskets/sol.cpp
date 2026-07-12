class Solution {
public:
    int totalFruit(vector<int>& fruits) {
        int start = 0;
        int maxLen = 0;
        unordered_map<int, int> fruitCount;
        
        for (int end = 0; end < fruits.size(); end++) {
            fruitCount[fruits[end]]++;
            
            while (fruitCount.size() > 2) {
                int leftFruit = fruits[start];
                fruitCount[leftFruit]--;
                if (fruitCount[leftFruit] == 0) {
                    fruitCount.erase(leftFruit);
                }
                start++;
            }
            
            maxLen = max(maxLen, end - start + 1);
        }
        
        return maxLen;
    }
};
