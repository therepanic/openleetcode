class Solution {
    public boolean escapeGhosts(int[][] ghosts, int[] target) {
        int[] a = new int[ghosts.length];
        for (int i = 0; i < ghosts.length; i++) {
            a[i] = Math.abs(ghosts[i][0] - target[0]) + Math.abs(ghosts[i][1] - target[1]);
        }
        
        int z = Math.abs(target[0] - 0) + Math.abs(target[1] - 0);
        
        boolean ans = true;
        for (int i : a) {
            if (i <= z) {
                ans = false;
            }
        }
        
        return ans;
    }
}
