class Solution {
    public List<Integer> sequentialDigits(int low, int high) {
        List<Integer> q = new ArrayList<>();
        for (int i = 1; i <= 9; i++) {
            q.add(i);
        }
        int i = 0;
        while (i < q.size()) {
            int x = q.get(i);
            int d = x % 10;
            if (d < 9) {
                q.add(x * 10 + d + 1);
            }
            i++;
        }
        List<Integer> result = new ArrayList<>();
        for (int num : q) {
            if (low <= num && num <= high) {
                result.add(num);
            }
        }
        return result;
    }
}
