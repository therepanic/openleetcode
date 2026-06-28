class Solution {
public:
    int repeatedStringMatch(string a, string b) {
        string repeatA = a;
        int count = 1;

        while (repeatA.length() < b.length()) {
            repeatA += a;
            count++;
            if (repeatA.find(b) != string::npos) {
                return count;
            }
        }

        repeatA += a;
        count++;
        if (repeatA.find(b) != string::npos) {
            return count;
        }

        return -1;
    }
};
