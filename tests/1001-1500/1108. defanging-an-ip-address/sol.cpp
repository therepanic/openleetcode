class Solution {
public:
    string defangIPaddr(string address) {
        string s = "";
        for (char i : address) {
            if (i == '.') {
                s += "[.]";
            } else {
                s += i;
            }
        }
        return s;
    }
};
