class Solution {
    public List<Integer> addToArrayForm(int[] num, int k) {
        LinkedList<Integer> result = new LinkedList<>();
        int i = num.length - 1;
        while (i >= 0 || k > 0) {
            if (i >= 0) {
                k += num[i--];
            }
            result.addFirst(k % 10);
            k /= 10;
        }
        if (result.isEmpty()) {
            result.add(0);
        }
        return result;
    }
}
