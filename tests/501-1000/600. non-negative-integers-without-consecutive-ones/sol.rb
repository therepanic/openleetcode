# @param {Integer} n
# @return {Integer}
def find_integers(n)
    f = [1, 2]
    (2...30).each do |i|
        f << f[-1] + f[-2]
    end
    
    ans = 0
    last_seen = 0
    (0...30).reverse_each do |i|
        if (1 << i) & n != 0
            ans += f[i]
            if last_seen == 1
                ans -= 1
                break
            end
            last_seen = 1
        else
            last_seen = 0
        end
    end
    ans + 1
end
