class Solution {
    public int countStudents(int[] students, int[] sandwiches) {
        java.util.List<Integer> s = new java.util.ArrayList<>();
        java.util.List<Integer> sw = new java.util.ArrayList<>();
        for (int x : students) s.add(x);
        for (int x : sandwiches) sw.add(x);
        int c = 0;
        while (!s.isEmpty()) {
            if (s.get(0).equals(sw.get(0))) {
                sw.remove(0);
                s.remove(0);
                c = 0;
            } else {
                s.add(s.remove(0));
                c++;
            }
            if (c == s.size()) break;
        }
        return s.size();
    }
}
