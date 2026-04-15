def to_json(obj)
  seen = Set.new
  _encode(obj, seen)
end

def _encode(obj, seen)
  return "null" if obj.nil?
  return "true" if obj == true
  return "false" if obj == false

  return obj.to_s if obj.is_a?(Integer)

  if obj.is_a?(Float)
    s = obj.to_s
    if (s.include?("e") || s.include?("E")) && obj.finite?
      return format("%.17g", obj)
    end
    return s
  end

  return _quote(obj) if obj.is_a?(String)
  return _quote(obj.to_s) if obj.is_a?(Symbol)
  if obj.is_a?(Time) || obj.is_a?(Date) || obj.is_a?(DateTime)
    return _quote(obj.iso8601)
  end

  if obj.is_a?(Array) || obj.is_a?(Set)
    oid = obj.object_id
    if seen.include?(oid)
      raise ArgumentError, "Cycle detected while encoding to json"
    end
    seen.add(oid)
    begin
      return "[" + obj.map { |x| _encode(x, seen) }.join(",") + "]"
    ensure
      seen.delete(oid)
    end
  end

  if obj.is_a?(Hash)
    oid = obj.object_id
    if seen.include?(oid)
      raise ArgumentError, "Cycle detected while encoding to json"
    end
    seen.add(oid)
    begin
      items = []
      obj.each do |k, v|
        ks = k.is_a?(String) ? k : k.to_s
        items << _quote(ks) + ":" + _encode(v, seen)
      end
      return "{" + items.join(",") + "}"
    ensure
      seen.delete(oid)
    end
  end

  oid = obj.object_id
  if seen.include?(oid)
    raise ArgumentError, "Cycle detected while encoding to json"
  end
  seen.add(oid)
  begin
    if obj.respond_to?(:to_h)
      h = obj.to_h
      return _encode(h, seen) if h.is_a?(Hash)
    end

    d = {}
    obj.instance_variables.each do |ivar|
      key = ivar.to_s
      next if key.start_with?("@_")
      key = key[1..-1]
      next if key.start_with?("_")
      d[key] = obj.instance_variable_get(ivar)
    end
    return _encode(d, seen) unless d.empty?

    _quote(obj.to_s)
  ensure
    seen.delete(oid)
  end
end

def _quote(s)
  out = +"\""
  s.each_codepoint do |cp|
    case cp
    when 0x22
      out << "\\\""
    when 0x5C
      out << "\\\\"
    when 0x08
      out << "\\b"
    when 0x0C
      out << "\\f"
    when 0x0A
      out << "\\n"
    when 0x0D
      out << "\\r"
    when 0x09
      out << "\\t"
    else
      if cp < 0x20
        out << "\\u" << cp.to_s(16).rjust(4, "0")
      else
        out << cp.chr(Encoding::UTF_8)
      end
    end
  end
  out << "\""
  out
end
