# @param {Integer[]} prev_room

# @return {Integer}

def ways_to_build_rooms(prev_room)

    mod = 1_000_000_007

    tree = Hash.new { |h, k| h[k] = [] }

    prev_room.each_with_index do |p, i|

        tree[p] << i if p >= 0

    end

    fact = [1] * (prev_room.length + 1)

    (1..prev_room.length).each { |i| fact[i] = fact[i-1] * i % mod }

    inv_fact = [1] * (prev_room.length + 1)

    inv_fact[prev_room.length] = pow_mod(fact[prev_room.length], mod-2, mod)

    (prev_room.length-1).downto(0) { |i| inv_fact[i] = inv_fact[i+1] * (i+1) % mod }

    dfs = lambda do |node|

        size = 1

        ways = 1

        tree[node].each do |child|

            child_size, child_ways = dfs.call(child)

            total = size + child_size - 1

            ways = ways * comb(total, child_size, fact, inv_fact, mod) % mod

            ways = ways * child_ways % mod

            size += child_size

        end

        [size, ways]

    end

    dfs.call(0)[1]

end

def pow_mod(a, b, mod)

    res = 1

    while b > 0

        res = res * a % mod if b.odd?

        a = a * a % mod

        b >>= 1

    end

    res

end

def comb(n, k, fact, inv_fact, mod)

    return 0 if k < 0 || k > n

    fact[n] * inv_fact[k] % mod * inv_fact[n-k] % mod

end
