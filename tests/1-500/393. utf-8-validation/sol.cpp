class Solution {
public:
    bool validUtf8(vector<int>& data) {
        int i = 0;
        while (i < data.size()) {
            int b = data[i];
            if (b >> 7 == 0) {
                i++;
            } else if (b >> 5 == 0b110) {
                if (i + 1 >= data.size()) return false;
                if (data[i+1] >> 6 != 0b10) return false;
                i += 2;
            } else if (b >> 4 == 0b1110) {
                if (i + 2 >= data.size()) return false;
                if (data[i+1] >> 6 != 0b10 || data[i+2] >> 6 != 0b10) return false;
                i += 3;
            } else if (b >> 3 == 0b11110) {
                if (i + 3 >= data.size()) return false;
                if (data[i+1] >> 6 != 0b10 || data[i+2] >> 6 != 0b10 || data[i+3] >> 6 != 0b10) return false;
                i += 4;
            } else {
                return false;
            }
        }
        return true;
    }
};
