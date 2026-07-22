class Solution {
  int maxNumberOfFamilies(int n, List<List<int>> reservedSeats) {
    Map<int, Set<int>> rowSeats = {};
    
    for (var reservation in reservedSeats) {
      int row = reservation[0];
      int seat = reservation[1];
      rowSeats.putIfAbsent(row, () => <int>{}).add(seat);
    }
    
    int ans = (n - rowSeats.length) * 2;
    
    Set<int> option1 = {2, 3, 4, 5};
    Set<int> option2 = {6, 7, 8, 9};
    Set<int> option3 = {4, 5, 6, 7};
    
    for (var seats in rowSeats.values) {
      int available = 0;
      if (seats.intersection(option1).isEmpty) {
        available += 1;
      }
      if (seats.intersection(option2).isEmpty) {
        available += 1;
      }
      if (seats.intersection(option3).isEmpty) {
        available = available > 1 ? available : 1;
      }
      ans += available;
    }
    
    return ans;
  }
}
