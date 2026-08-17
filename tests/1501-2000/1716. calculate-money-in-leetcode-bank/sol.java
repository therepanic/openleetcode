class Solution {
    public int totalMoney(int n) {
        int q = n / 7;
        int r = n % 7;
        return arithmeticProgression(28, 28+(q-1)*7, q) + arithmeticProgression(q+1, q+r, r);
    }
    private int arithmeticProgression(int leading, int last, int terms) {
        return (leading+last)*terms/2;
    }
}
