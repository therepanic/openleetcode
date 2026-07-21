import java.util.*;

class Solution {
    public int maxNumberOfFamilies(int n, int[][] reservedSeats) {
        Map<Integer, Set<Integer>> rowSeats = new HashMap<>();
        
        for (int[] reservation : reservedSeats) {
            int row = reservation[0];
            int seat = reservation[1];
            rowSeats.computeIfAbsent(row, k -> new HashSet<>()).add(seat);
        }
        
        int ans = (n - rowSeats.size()) * 2;
        
        Set<Integer> option1 = new HashSet<>(Arrays.asList(2, 3, 4, 5));
        Set<Integer> option2 = new HashSet<>(Arrays.asList(6, 7, 8, 9));
        Set<Integer> option3 = new HashSet<>(Arrays.asList(4, 5, 6, 7));
        
        for (Set<Integer> seats : rowSeats.values()) {
            int available = 0;
            if (Collections.disjoint(option1, seats)) {
                available += 1;
            }
            if (Collections.disjoint(option2, seats)) {
                available += 1;
            }
            if (Collections.disjoint(option3, seats)) {
                available = Math.max(available, 1);
            }
            ans += available;
        }
        
        return ans;
    }
}
