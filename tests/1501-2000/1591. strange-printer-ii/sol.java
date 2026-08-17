import java.util.*;

class Solution {
    public boolean isPrintable(int[][] targetGrid) {
        int m = targetGrid.length, n = targetGrid[0].length;
        Map<Integer, List<int[]>> colors = new HashMap<>();
        for (int i = 0; i < m; i++) {
            for (int j = 0; j < n; j++) {
                colors.computeIfAbsent(targetGrid[i][j], k -> new ArrayList<>()).add(new int[]{i, j});
            }
        }
        
        Set<Integer> colorSet = new HashSet<>(colors.keySet());
        while (!colorSet.isEmpty()) {
            Set<Integer> removable = new HashSet<>();
            for (int color : colorSet) {
                if (canRemove(targetGrid, colors.get(color))) {
                    removable.add(color);
                }
            }
            if (removable.isEmpty()) return false;
            colorSet.removeAll(removable);
        }
        return true;
    }
    
    private boolean canRemove(int[][] grid, List<int[]> positions) {
        int mnR = Integer.MAX_VALUE, mxR = Integer.MIN_VALUE;
        int mnC = Integer.MAX_VALUE, mxC = Integer.MIN_VALUE;
        for (int[] p : positions) {
            mnR = Math.min(mnR, p[0]);
            mxR = Math.max(mxR, p[0]);
            mnC = Math.min(mnC, p[1]);
            mxC = Math.max(mxC, p[1]);
        }
        int color = grid[positions.get(0)[0]][positions.get(0)[1]];
        for (int i = mnR; i <= mxR; i++) {
            for (int j = mnC; j <= mxC; j++) {
                if (grid[i][j] != color && grid[i][j] > 0) return false;
            }
        }
        for (int i = mnR; i <= mxR; i++) {
            for (int j = mnC; j <= mxC; j++) {
                grid[i][j] = 0;
            }
        }
        return true;
    }
}
