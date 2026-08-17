class Solution {
    public int numberOfUniqueGoodSubsequences(String binary) {
        long a = 0, b = 0;
        int z = 0;
        for (char c : binary.toCharArray()) {
            if (c == '1') {
                b = (a + b + 1) % 1000000007L;
            } else {
                a = (a + b) % 1000000007L;
                z = 1;
            }
        }
        return (int)((a + b + z) % 1000000007L);
    }
}
