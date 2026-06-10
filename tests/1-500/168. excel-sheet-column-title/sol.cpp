class Solution {
public:
    string convertToTitle(int columnNumber) {
        string result;
        while (columnNumber > 0) {
            --columnNumber;
            result.push_back(char('A' + (columnNumber % 26)));
            columnNumber /= 26;
        }
        reverse(result.begin(), result.end());
        return result;
    }
};
