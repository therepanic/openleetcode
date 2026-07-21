class Solution {
public:
    int dayOfYear(string date) {
        unordered_map<int, int> val = {
            {1, 0}, {2, 31}, {3, 59}, {4, 90}, {5, 120}, {6, 151},
            {7, 181}, {8, 212}, {9, 243}, {10, 273}, {11, 304}, {12, 334}
        };
        int d = stoi(date.substr(8));
        int m = stoi(date.substr(5, 2));
        int y = stoi(date.substr(0, 4));
        bool isLeap = (y % 400 == 0) || (y % 4 == 0 && y % 100 != 0);
        if (isLeap) {
            for (int i = 3; i <= 12; i++) {
                val[i] += 1;
            }
        }
        return d + val[m];
    }
};
