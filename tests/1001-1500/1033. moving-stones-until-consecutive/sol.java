class Solution {
    public int[] numMovesStones(int a, int b, int c) {
        int[] stones = new int[]{a, b, c};
        java.util.Arrays.sort(stones);
        int x = stones[0], y = stones[1], z = stones[2];
        int minMove;
        if (z - x == 2) {
            minMove = 0;
        } else if (y - x <= 2 || z - y <= 2) {
            minMove = 1;
        } else {
            minMove = 2;
        }
        int maxMove = z - x - 2;
        return new int[]{minMove, maxMove};
    }
}
