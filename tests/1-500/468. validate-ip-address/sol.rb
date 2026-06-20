# @param {String} query_ip
# @return {String}
def valid_ip_address(query_ip)
    if query_ip.count('.') == 3
        parts = query_ip.split('.')
        valid = parts.all? do |p|
            p.match?(/\A\d+\z/) && p.to_i.to_s == p && p.to_i >= 0 && p.to_i <= 255
        end
        return "IPv4" if valid
    elsif query_ip.count(':') == 7
        parts = query_ip.split(':')
        valid = parts.all? do |p|
            p.length >= 1 && p.length <= 4 && p.chars.all? { |c| c.match?(/[0-9a-fA-F]/) }
        end
        return "IPv6" if valid
    end
    "Neither"
end
