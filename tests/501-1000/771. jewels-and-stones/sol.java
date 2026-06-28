class Solution {
    public int numJewelsInStones(String jewels, String stones) {
        int count = 0;
        for (char i : jewels.toCharArray()) {
            if (stones.indexOf(i) != -1) {
                for (char s : stones.toCharArray()) {
                    if (s == i) count++;
                }
            }
        }
        return count;
    }
}
