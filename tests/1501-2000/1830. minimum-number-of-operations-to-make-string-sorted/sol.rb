# @param {String} s
# @return {Integer}
def make_string_sorted(s)
    mod = 10**9 + 7
    n = s.length
    fac = Array.new(n + 1, 1)
    inv_fac = Array.new(n + 1, 1)
    
    (1..n).each do |i|
        fac[i] = (fac[i-1] * i) % mod
    end
    inv_fac[n] = mod_pow(fac[n], mod - 2, mod)
    (n).downto(1) do |i|
        inv_fac[i-1] = (inv_fac[i] * i) % mod
    end
    
    freq = Array.new(26, 0)
    s.each_char do |ch|
        freq[ch.ord - 'a'.ord] += 1
    end
    
    ans = 0
    (0...n).each do |i|
        small_right = 0
        (0...(s[i].ord - 'a'.ord)).each do |j|
            small_right += freq[j] % mod
        end
        
        rem = n - i - 1
        temp = 1
        temp = (temp * fac[rem]) % mod
        temp = (temp * small_right) % mod
        
        freq.each do |x|
            if x > 1
                temp = (temp * inv_fac[x]) % mod
            end
        end
        
        freq[s[i].ord - 'a'.ord] -= 1
        ans = (ans + temp) % mod
    end
    
    ans % mod
end

def mod_pow(x, n, mod)
    if x == 1 || n == 0
        return 1
    end
    if n == 1
        return x % mod
    end
    
    if n % 2 == 1
        return (x * mod_pow((x * x) % mod, n / 2, mod)) % mod
    end
    mod_pow((x * x) % mod, n / 2, mod) % mod
end
