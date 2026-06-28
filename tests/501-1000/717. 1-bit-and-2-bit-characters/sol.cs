public class Solution {
    public bool IsOneBitCharacter(int[] bits) {
        int n = bits.Length, i = 0;
        while (i < n - 1) {
            i += 1 + (bits[i] == 1 ? 1 : 0);
        }
        return i == n - 1;
    }
}
