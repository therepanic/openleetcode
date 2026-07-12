class Solution {
  List<int> corpFlightBookings(List<List<int>> bookings, int n) {
    List<int> l = List.filled(n + 1, 0);
    for (var i in bookings) {
      int x = i[0];
      int y = i[1];
      l[x - 1] += i[2];
      l[y] -= i[2];
    }
    
    List<int> s = [];
    for (int i = 0; i < n; i++) {
      if (i == 0) {
        s.add(l[i]);
      } else {
        s.add(s[i - 1] + l[i]);
      }
    }
    return s;
  }
}
