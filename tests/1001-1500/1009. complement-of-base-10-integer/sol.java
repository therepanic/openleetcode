class Solution {
    public int bitwiseComplement(int n) {
        if (n == 0) {
            return 1;
        }
        int bit_length = Integer.toBinaryString(n).length();
        int mask = (1 << bit_length) - 1;
        return n ^ mask;
    }
}
