# @param {String} text
# @return {Integer}
def distinct_echo_substrings(text)
    def get(l, r)
        [( @h1[r] - @h1[l] * @p1[r - l] ) % @m1, ( @h2[r] - @h2[l] * @p2[r - l] ) % @m2]
    end

    n = text.length
    b1, b2 = 911382323, 972663749
    @m1, @m2 = 10**9 + 7, 10**9 + 9
    @p1 = [1] * (n + 1)
    @p2 = [1] * (n + 1)
    @h1 = [0] * (n + 1)
    @h2 = [0] * (n + 1)
    a = 'a'.ord
    text.each_char.with_index(1) do |ch, i|
        v = ch.ord - a
        @p1[i] = (@p1[i - 1] * b1) % @m1
        @p2[i] = (@p2[i - 1] * b2) % @m2
        @h1[i] = (@h1[i - 1] * b1 + v) % @m1
        @h2[i] = (@h2[i - 1] * b2 + v) % @m2
    end
    st = Set.new
    (0...n).each do |i|
        m = (n - i) / 2
        (1..m).each do |l|
            if get(i, i + l) == get(i + l, i + 2 * l)
                st.add([2 * l, get(i, i + 2 * l)])
            end
        end
    end
    st.size
end
