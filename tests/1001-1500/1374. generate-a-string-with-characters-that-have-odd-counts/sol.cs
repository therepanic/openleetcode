public class Solution {
    public string GenerateTheString(int n) {
        if (n % 2 == 1) {
            return new string('a', n);
        } else {
            return new string('a', n - 1) + "b";
        }
    }
}
