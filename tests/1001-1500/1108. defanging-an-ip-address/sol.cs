public class Solution {
    public string DefangIPaddr(string address) {
        string s = "";
        foreach (char i in address) {
            if (i == '.') {
                s += "[.]";
            } else {
                s += i;
            }
        }
        return s;
    }
}
