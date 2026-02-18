def to_json(obj):
    seen = set()
    return _encode(obj, seen)

def _encode(obj, seen):
    if obj is None:
        return "null"
    if obj is True:
        return "true"
    if obj is False:
        return "false"
    if isinstance(obj, (int, long)):
        return str(obj)
    if isinstance(obj, float):
        return repr(obj)
    if isinstance(obj, unicode):
        return _quote(obj)
    if isinstance(obj, str):
        return _quote(_bytes_hex(obj))

    if isinstance(obj, (bytearray, buffer)):
        return _quote(_bytes_hex(str(obj)))

    if isinstance(obj, (_dt.datetime, _dt.date, _dt.time)):
        return _quote(obj.isoformat())

    try:
        import enum
        if isinstance(obj, enum.Enum):
            return _quote(obj.name)
    except Exception:
        pass

    oid = id(obj)
    if oid in seen:
        raise ValueError("Cycle detected while encoding to json")
    seen.add(oid)
    try:
        if isinstance(obj, dict):
            items = []
            for k, v in obj.iteritems():
                if not isinstance(k, basestring):
                    k = str(k)
                items.append(_quote(unicode(k)) + ":" + _encode(v, seen))
            return "{" + ",".join(items) + "}"

        if isinstance(obj, (list, tuple, set, frozenset)):
            return "[" + ",".join(_encode(x, seen) for x in obj) + "]"

        if hasattr(obj, "__dict__"):
            d = {}
            for k, v in obj.__dict__.iteritems():
                if k.startswith("_"):
                    continue
                d[k] = v
            return _encode(d, seen)

        slots = getattr(obj, "__slots__", None)
        if slots:
            d = {}
            if isinstance(slots, basestring):
                slots = [slots]
            for k in slots:
                if k.startswith("_"):
                    continue
                if hasattr(obj, k):
                    d[k] = getattr(obj, k)
            return _encode(d, seen)

        return _quote(unicode(obj))
    finally:
        seen.remove(oid)

def _quote(s):
    if isinstance(s, str):
        s = s.decode("utf-8", "strict")
    out = ['"']
    for ch in s:
        o = ord(ch)
        if ch == u'"':
            out.append(u'\\"')
        elif ch == u"\\":
            out.append(u"\\\\")
        elif ch == u"\b":
            out.append(u"\\b")
        elif ch == u"\f":
            out.append(u"\\f")
        elif ch == u"\n":
            out.append(u"\\n")
        elif ch == u"\r":
            out.append(u"\\r")
        elif ch == u"\t":
            out.append(u"\\t")
        elif o < 0x20:
            out.append(u"\\u%04x" % o)
        else:
            out.append(ch)
    out.append(u'"')
    return u"".join(out).encode("utf-8")

def _bytes_hex(b):
    return "".join("%02x" % ord(c) for c in b)
