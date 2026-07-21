class Solution {
    private int ans;

    public int maxLength(String[] arr) {
        ans = 0;
        dfs(0, "", arr);
        return ans;
    }

    private void dfs(int i, String path, String[] arr) {
        ans = Math.max(ans, path.length());
        for (int j = i; j < arr.length; j++) {
            String s = arr[j];
            if (!isUnique(s) || hasCommon(path, s)) continue;
            dfs(j + 1, path + s, arr);
        }
    }

    private boolean isUnique(String s) {
        int mask = 0;
        for (char c : s.toCharArray()) {
            int bit = 1 << (c - 'a');
            if ((mask & bit) != 0) return false;
            mask |= bit;
        }
        return true;
    }

    private boolean hasCommon(String a, String b) {
        for (char c : b.toCharArray()) {
            if (a.indexOf(c) != -1) return true;
        }
        return false;
    }
}
