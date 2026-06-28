public class Solution {
    public bool ValidSquare(int[] p1, int[] p2, int[] p3, int[] p4) {
        int GetDistSq(int[] pt1, int[] pt2) {
            return (pt1[0] - pt2[0]) * (pt1[0] - pt2[0]) + 
                   (pt1[1] - pt2[1]) * (pt1[1] - pt2[1]);
        }
        
        int[][] points = { p1, p2, p3, p4 };
        HashSet<int> distances = new HashSet<int>();
        
        for (int i = 0; i < 4; i++) {
            for (int j = i + 1; j < 4; j++) {
                distances.Add(GetDistSq(points[i], points[j]));
            }
        }
        
        return distances.Count == 2 && !distances.Contains(0);
    }
}
