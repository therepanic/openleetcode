public class Solution {
    public int MinSwaps(string s) {
        int swap = 0;
        foreach (char c in s) {
            if (c == '[') {
                swap++;
            } else {
                if (swap > 0) {
                    swap--;
                }
            }
        }
        return (swap + 1) / 2;
    }
}
