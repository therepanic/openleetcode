# @param {Integer} k
# @param {Integer[]} arrival
# @param {Integer[]} load
# @return {Integer[]}
def busiest_servers(k, arrival, load)
    available = (0...k).to_a
    busy = []
    res = [0] * k
    arrival.each_with_index do |a, i|
        while !busy.empty? && busy[0][0] <= a
            _, x = busy.shift
            available << i + (x - i) % k
            available.sort!
        end
        unless available.empty?
            j = available.shift % k
            busy << [a + load[i], j]
            busy.sort_by! { |b| b[0] }
            res[j] += 1
        end
    end
    max_count = res.max
    res.each_index.select { |i| res[i] == max_count }
end
