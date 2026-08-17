def check_palindrome_formation(a, b)
    def is_palindrome(s)
        s == s.reverse
    end

    def check(a, b)
        i, j = 0, a.length - 1
        while i < j && a[i] == b[j]
            i += 1
            j -= 1
        end
        is_palindrome(a[i..j]) || is_palindrome(b[i..j])
    end

    check(a, b) || check(b, a)
end
