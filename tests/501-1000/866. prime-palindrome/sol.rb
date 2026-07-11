# @param {Integer} n
# @return {Integer}
def prime_palindrome(n)
    def is_prime(num)
        return false if num < 2
        return num == 2 if num % 2 == 0
        i = 3
        while i * i <= num
            return false if num % i == 0
            i += 2
        end
        true
    end

    return 11 if n >= 8 && n <= 11

    while true
        s = n.to_s
        if s.length % 2 == 0 && n > 11
            n = 10 ** s.length + 1
            next
        end
        if s == s.reverse && is_prime(n)
            return n
        end
        n += 1
        n += 1 if n > 2 && n % 2 == 0
    end
end
