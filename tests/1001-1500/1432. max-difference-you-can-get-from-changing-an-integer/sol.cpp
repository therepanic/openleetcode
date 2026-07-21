class Solution {
public:
    int maxDiff(int num) {
        string numStr = to_string(num);
        set<char> uniqueDigits(numStr.begin(), numStr.end());
        int maxVal = num;
        int minVal = num;
        
        for (char digit : uniqueDigits) {
            for (char newDigit = '0'; newDigit <= '9'; newDigit++) {
                if (numStr[0] == digit && newDigit == '0') {
                    continue;
                }
                string newNumStr = numStr;
                replace(newNumStr.begin(), newNumStr.end(), digit, newDigit);
                int newNum = stoi(newNumStr);
                maxVal = max(maxVal, newNum);
                minVal = min(minVal, newNum);
            }
        }
        
        return maxVal - minVal;
    }
};
