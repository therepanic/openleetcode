class Solution {
    public boolean canFormArray(int[] arr, int[][] pieces) {
        List<Integer> a = new ArrayList<>();
        List<List<Integer>> p = new ArrayList<>();
        for (int[] piece : pieces) {
            List<Integer> list = new ArrayList<>();
            for (int num : piece) list.add(num);
            p.add(list);
        }
        for (int i : arr) {
            for (int j = 0; j < p.size(); j++) {
                List<Integer> piece = p.get(j);
                if (piece.contains(i)) {
                    a.addAll(piece);
                    p.remove(j);
                    break;
                }
            }
        }
        if (a.size() != arr.length) return false;
        for (int i = 0; i < arr.length; i++) {
            if (a.get(i) != arr[i]) return false;
        }
        return true;
    }
}
