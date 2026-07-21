# @param {Character[][]} seats
# @return {Integer}
def max_students(seats)
    m = seats.length
    n = seats[0].length
    available = []
    seats.each do |row|
        mask = 0
        row.each_with_index do |seat, col|
            if seat == "."
                mask |= 1 << col
            end
        end
        available << mask
    end

    valid_masks = (0...(1 << n)).select { |mask| (mask & (mask << 1)) == 0 }
    dp = {0 => 0}
    m.times do |row|
        next_dp = {}
        valid_masks.each do |current|
            next if current & ~available[row] != 0
            count = current.to_s(2).count("1")
            dp.each do |previous, total|
                next if current & ((previous << 1) | (previous >> 1)) != 0
                next_dp[current] = [next_dp.fetch(current, 0), total + count].max
            end
        end
        dp = next_dp
    end

    dp.values.max || 0
end
