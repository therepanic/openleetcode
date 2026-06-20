class Solution {
    public List<String> addOperators(String num, int target) {
        List<String> res = new ArrayList<>();
        int n = num.length();
        backtrack(num, target, 0, "", 0, 0, res);
        return res;
    }
    
    private void backtrack(String num, int target, int idx, String path, long curr, long prev, List<String> res) {
        int n = num.length();
        if (idx == n) {
            if (curr == target) {
                res.add(path);
            }
            return;
        }
        for (int i = idx; i < n; i++) {
            if (i > idx && num.charAt(idx) == '0') break;
            String s = num.substring(idx, i+1);
            long val = Long.parseLong(s);
            if (idx == 0) {
                backtrack(num, target, i+1, s, val, val, res);
            } else {
                backtrack(num, target, i+1, path+"+"+s, curr+val, val, res);
                backtrack(num, target, i+1, path+"-"+s, curr-val, -val, res);
                backtrack(num, target, i+1, path+"*"+s, (curr-prev)+(prev*val), prev*val, res);
            }
        }
    }
}
