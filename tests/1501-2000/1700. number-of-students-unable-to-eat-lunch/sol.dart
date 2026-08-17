class Solution {
  int countStudents(List<int> students, List<int> sandwiches) {
    List<int> s = List.from(students);
    List<int> sw = List.from(sandwiches);
    int c = 0;
    while (s.isNotEmpty) {
      if (s[0] == sw[0]) {
        sw.removeAt(0);
        s.removeAt(0);
        c = 0;
      } else {
        s.add(s.removeAt(0));
        c++;
      }
      if (c == s.length) break;
    }
    return s.length;
  }
}
