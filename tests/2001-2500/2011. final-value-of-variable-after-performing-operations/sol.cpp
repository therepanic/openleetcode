class Solution {
public:
    int finalValueAfterOperations(vector<string>& operations) {
        int result = 0;
        for (const string& op : operations) {
            result += (op[1] == '+') ? 1 : -1;
        }
        return result;
    }
};
