class Solution {
    public java.util.List<java.util.List<String>> partition(String s) {
        java.util.List<java.util.List<String>> result = new java.util.ArrayList<>();
        backtrack(s, 0, new java.util.ArrayList<>(), result);
        return result;
    }
    private void backtrack(String s, int index, java.util.List<String> path, java.util.List<java.util.List<String>> result) {
        if (index == s.length()) { result.add(new java.util.ArrayList<>(path)); return; }
        for (int end = index; end < s.length(); end++) {
            if (isPalindrome(s, index, end)) {
                path.add(s.substring(index, end + 1));
                backtrack(s, end + 1, path, result);
                path.remove(path.size() - 1);
            }
        }
    }
    private boolean isPalindrome(String s, int left, int right) {
        while (left < right) if (s.charAt(left++) != s.charAt(right--)) return false;
        return true;
    }
}
