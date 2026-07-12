# @param {Integer[]} count
# @return {Float[]}
def sample_stats(count)
    kth = ->(k) {
        acc = 0
        count.each_with_index do |c, v|
            acc += c
            return v if acc >= k
        end
    }

    tot = 0
    cnt = 0
    mini = nil
    maxi = nil
    mode = 0
    mode_cnt = 0

    count.each_with_index do |c, v|
        if c > 0
            mini = v if mini.nil?
            maxi = v
            tot += c
            cnt += v * c
            if c > mode_cnt
                mode_cnt = c
                mode = v
            end
        end
    end

    m = if tot % 2 == 1
        kth.call(tot / 2 + 1)
    else
        (kth.call(tot / 2) + kth.call(tot / 2 + 1)) / 2.0
    end

    [mini.to_f, maxi.to_f, cnt.to_f / tot, m.to_f, mode.to_f]
end
