# @param {String[]} cpdomains
# @return {String[]}
def subdomain_visits(cpdomains)
    freq = Hash.new(0)
    cpdomains.each do |entry|
        cnt, dom = entry.split(' ')
        cnt = cnt.to_i
        parts = dom.split('.')
        (0...parts.length).each do |i|
            sub = parts[i..-1].join('.')
            freq[sub] += cnt
        end
    end
    freq.map { |d, c| "#{c} #{d}" }
end
