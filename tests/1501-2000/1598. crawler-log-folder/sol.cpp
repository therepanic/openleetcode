class Solution {
public:
    int minOperations(vector<string>& logs) {
        int output = 0;
        for (string& log : logs) {
            if (log == "../") {
                output--;
                if (output < 0) output = 0;
            } else if (log == "./") {
                continue;
            } else {
                output++;
            }
        }
        return output < 0 ? 0 : output;
    }
};
