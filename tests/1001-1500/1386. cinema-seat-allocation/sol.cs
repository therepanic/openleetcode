public class Solution {
    public int MaxNumberOfFamilies(int n, int[][] reservedSeats) {
        Dictionary<int, HashSet<int>> rowSeats = new Dictionary<int, HashSet<int>>();
        
        foreach (var reservation in reservedSeats) {
            int row = reservation[0];
            int seat = reservation[1];
            if (!rowSeats.ContainsKey(row)) {
                rowSeats[row] = new HashSet<int>();
            }
            rowSeats[row].Add(seat);
        }
        
        int ans = (n - rowSeats.Count) * 2;
        
        HashSet<int> option1 = new HashSet<int> { 2, 3, 4, 5 };
        HashSet<int> option2 = new HashSet<int> { 6, 7, 8, 9 };
        HashSet<int> option3 = new HashSet<int> { 4, 5, 6, 7 };
        
        foreach (var seats in rowSeats.Values) {
            int available = 0;
            if (!seats.Overlaps(option1)) {
                available += 1;
            }
            if (!seats.Overlaps(option2)) {
                available += 1;
            }
            if (!seats.Overlaps(option3)) {
                available = Math.Max(available, 1);
            }
            ans += available;
        }
        
        return ans;
    }
}
