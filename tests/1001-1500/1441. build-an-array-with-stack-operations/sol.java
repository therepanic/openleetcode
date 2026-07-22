class Solution {
    public List<String> buildArray(int[] target, int n) {
        List<String> res = new ArrayList<>();
        int a = 0;
        List<Integer> s = new ArrayList<>();
        for (int i = 1; i <= n; i++) {
            if (s.size() == target.length && a == target.length) return res;
            s.add(i);
            res.add("Push");
            if (s.get(a) != target[a]) {
                s.remove(s.size() - 1);
                res.add("Pop");
            } else {
                a++;
            }
        }
        return res;
    }
}
