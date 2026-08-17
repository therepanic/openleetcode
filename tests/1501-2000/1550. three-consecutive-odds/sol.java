class Solution {
    public boolean threeConsecutiveOdds(int[] arr) {
        StringBuilder sb = new StringBuilder();
        for (int x : arr) sb.append(x & 1);
        return sb.toString().contains("111");
    }
}
