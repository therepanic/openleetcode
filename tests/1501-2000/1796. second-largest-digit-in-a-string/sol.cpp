#include <unordered_set>
#include <algorithm>

class Solution {
public:
    int secondHighest(string s) {
        unordered_set<int> digits;
        for (char c : s) {
            if (isdigit(c)) {
                digits.insert(c - '0');
            }
        }
        if (digits.size() > 1) {
            auto maxIt = max_element(digits.begin(), digits.end());
            int max = *maxIt;
            digits.erase(maxIt);
            auto secondMaxIt = max_element(digits.begin(), digits.end());
            return *secondMaxIt;
        }
        return -1;
    }
};
