public class Solution {
    public int FinalValueAfterOperations(string[] operations) {
        int result = 0;
        foreach (string op in operations) {
            result += (op[1] == '+') ? 1 : -1;
        }
        return result;
    }
}
