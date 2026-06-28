class Solution {
    public String nearestPalindromic(String n) {
        long num = Long.parseLong(n);
        long v1 = prevPal(num);
        long v2 = nextPal(num);
        if (Math.abs(v1 - num) > Math.abs(v2 - num)) {
            return String.valueOf(v2);
        } else {
            return String.valueOf(v1);
        }
    }
    
    private long convert(long num) {
        char[] s = String.valueOf(num).toCharArray();
        int l = 0, r = s.length - 1;
        while (l <= r) {
            s[r] = s[l];
            r--;
            l++;
        }
        return Long.parseLong(new String(s));
    }
    
    private long prevPal(long num) {
        long low = 0;
        long high = (long)1e19;
        long ans = -1;
        while (low <= high) {
            long mid = (low + high) >>> 1;
            long val = convert(mid);
            if (val >= num) {
                high = mid - 1;
            } else {
                low = mid + 1;
                ans = val;
            }
        }
        return ans;
    }
    
    private long nextPal(long num) {
        long low = 0;
        long high = (long)1e19;
        long ans = -1;
        while (low <= high) {
            long mid = (low + high) >>> 1;
            long val = convert(mid);
            if (val <= num) {
                low = mid + 1;
            } else {
                ans = val;
                high = mid - 1;
            }
        }
        return ans;
    }
}
