class Solution {
    public int finalValueAfterOperations(String[] operations) {
        int result = 0;
        for (String op : operations) {
            result += (op.charAt(1) == '+') ? 1 : -1;
        }
        return result;
    }
}
