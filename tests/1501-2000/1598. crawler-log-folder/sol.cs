public class Solution {
    public int MinOperations(string[] logs) {
        int output = 0;
        foreach (string log in logs) {
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
}
