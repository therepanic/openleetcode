class Solution {
public:
    int primePalindrome(int n) {
        auto isPrime = [](int num) -> bool {
            if (num < 2) return false;
            if (num % 2 == 0) return num == 2;
            for (int i = 3; i * i <= num; i += 2) {
                if (num % i == 0) return false;
            }
            return true;
        };

        if (n >= 8 && n <= 11) return 11;

        while (true) {
            string s = to_string(n);
            if (s.length() % 2 == 0 && n > 11) {
                n = pow(10, s.length()) + 1;
                continue;
            }
            string rev(s.rbegin(), s.rend());
            if (s == rev && isPrime(n)) return n;
            n++;
            if (n > 2 && n % 2 == 0) n++;
        }
    }
};
