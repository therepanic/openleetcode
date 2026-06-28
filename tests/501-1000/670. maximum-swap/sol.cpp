class Solution {
public:
    int maximumSwap(int num) {
        string numStr = to_string(num);
        vector<char> numList(numStr.begin(), numStr.end());
        unordered_map<int, int> lastIndex;
        for (int i = 0; i < numList.size(); i++) {
            lastIndex[numList[i] - '0'] = i;
        }
        for (int i = 0; i < numList.size(); i++) {
            int d = numList[i] - '0';
            for (int x = 9; x > d; x--) {
                if (lastIndex.count(x) && lastIndex[x] > i) {
                    swap(numList[i], numList[lastIndex[x]]);
                    return stoi(string(numList.begin(), numList.end()));
                }
            }
        }
        return num;
    }
};
