public class Solution {
    public int PrimePalindrome(int n) {
        bool IsPrime(int num) {
            if (num < 2) return false;
            if (num % 2 == 0) return num == 2;
            for (int i = 3; i * i <= num; i += 2) {
                if (num % i == 0) return false;
            }
            return true;
        }

        if (n >= 8 && n <= 11) return 11;

        while (true) {
            string s = n.ToString();
            if (s.Length % 2 == 0 && n > 11) {
                n = (int)Math.Pow(10, s.Length) + 1;
                continue;
            }
            char[] arr = s.ToCharArray();
            Array.Reverse(arr);
            string rev = new string(arr);
            if (s == rev && IsPrime(n)) return n;
            n++;
            if (n > 2 && n % 2 == 0) n++;
        }
    }
}
