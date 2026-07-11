class Solution {
    public int primePalindrome(int n) {
        if (n >= 8 && n <= 11) {
            return 11;
        }
        while (true) {
            String s = Integer.toString(n);
            if (s.length() % 2 == 0 && n > 11) {
                n = (int)Math.pow(10, s.length()) + 1;
                continue;
            }
            if (isPalindrome(s) && isPrime(n)) {
                return n;
            }
            n++;
            if (n > 2 && n % 2 == 0) {
                n++;
            }
        }
    }

    private boolean isPrime(int num) {
        if (num < 2) return false;
        if (num % 2 == 0) return num == 2;
        for (int i = 3; i * i <= num; i += 2) {
            if (num % i == 0) return false;
        }
        return true;
    }

    private boolean isPalindrome(String s) {
        int left = 0, right = s.length() - 1;
        while (left < right) {
            if (s.charAt(left) != s.charAt(right)) return false;
            left++;
            right--;
        }
        return true;
    }
}
