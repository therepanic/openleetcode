class Solution {
    public List<Integer> splitIntoFibonacci(String num) {
        int n = num.length();
        for (int j = 1; j < n - 1; j++) {
            for (int i = 0; i < j; i++) {
                String a0 = num.substring(0, i + 1);
                String a1 = num.substring(i + 1, j + 1);
                if (invalid(a0) || invalid(a1)) continue;
                List<Integer> ret = check(a0, a1, num.substring(j + 1));
                if (!ret.isEmpty()) return ret;
            }
        }
        return new ArrayList<>();
    }
    
    private boolean invalid(String x) {
        if (x.charAt(0) == '0' && x.length() > 1) {
            return true;
        }
        if (x.length() > 10) {
            return true;
        }
        return Long.parseLong(x) >= (1L << 31);
    }
    
    private List<Integer> check(String a0, String a1, String num) {
        List<Integer> ret = new ArrayList<>();
        ret.add(Integer.parseInt(a0));
        ret.add(Integer.parseInt(a1));
        int i = 0;
        while (i < num.length()) {
            long a0Val = Long.parseLong(a0);
            long a1Val = Long.parseLong(a1);
            String res = String.valueOf(a0Val + a1Val);
            int j = 0;
            while (i < num.length() && j < res.length() && res.charAt(j) == num.charAt(i)) {
                j++;
                i++;
            }
            if (j < res.length() || invalid(res)) return new ArrayList<>();
            a0 = a1;
            a1 = res;
            ret.add(Integer.parseInt(res));
        }
        return ret;
    }
}
