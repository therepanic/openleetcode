class Solution {
    public boolean validSquare(int[] p1, int[] p2, int[] p3, int[] p4) {
        int[][] points = {p1, p2, p3, p4};
        Set<Integer> distances = new HashSet<>();
        
        for (int i = 0; i < 4; i++) {
            for (int j = i + 1; j < 4; j++) {
                distances.add(getDistSq(points[i], points[j]));
            }
        }
        
        return distances.size() == 2 && !distances.contains(0);
    }
    
    private int getDistSq(int[] pt1, int[] pt2) {
        return (pt1[0] - pt2[0]) * (pt1[0] - pt2[0]) + 
               (pt1[1] - pt2[1]) * (pt1[1] - pt2[1]);
    }
}
