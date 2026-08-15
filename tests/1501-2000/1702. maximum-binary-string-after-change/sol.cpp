class Solution {
public:
    string maximumBinaryString(string binary) {
        int n = binary.size();
        int z = 0;
        for (char c : binary) {
            if (c == '0') z++;
        }
        
        if (z < 2) return binary;
        
        int firstZero = binary.find('0');
        int p = firstZero + z - 1;
        
        return string(p, '1') + "0" + string(n - p - 1, '1');
    }
};
