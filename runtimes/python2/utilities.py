class TreeNode(object):
    def __init__(self, val=0, left=None, right=None):
        self.val = val
        self.left = left
        self.right = right


def to_tree_node(arr):
    if not arr or arr[0] is None:
        return None
    root = TreeNode(arr[0])
    queue = [root]
    i = 1
    while queue and i < len(arr):
        node = queue.pop(0)
        if i < len(arr) and arr[i] is not None:
            node.left = TreeNode(arr[i])
            queue.append(node.left)
        i += 1
        if i < len(arr) and arr[i] is not None:
            node.right = TreeNode(arr[i])
            queue.append(node.right)
        i += 1
    return root


def tree_node_to_array(root):
    if not root:
        return []
    res, queue = [], [root]
    while queue:
        node = queue.pop(0)
        if node:
            res.append(node.val)
            queue.append(node.left)
            queue.append(node.right)
        else:
            res.append(None)
    while res and res[-1] is None:
        res.pop()
    return res


class ListNode(object):
    def __init__(self, val=0, next=None):
        self.val = val
        self.next = next


def toListNode(arr):
    if not arr:
        return None
    head = ListNode(arr[0])
    cur = head
    for v in arr[1:]:
        cur.next = ListNode(v)
        cur = cur.next
    return head


def listNodeToArray(head):
    res = []
    while head:
        res.append(head.val)
        head = head.next
    return res


def to_json(obj):
    seen = set()
    return "\n" + _encode(obj, seen)


def _encode(obj, seen):
    if obj is None:
        return "null"
    if obj is True:
        return "true"
    if obj is False:
        return "false"
    if isinstance(obj, int):
        return str(obj)
    if isinstance(obj, float):
        return repr(obj)
    if isinstance(obj, bytes):
        return _quote(obj.encode("hex") if hasattr(obj, "encode") else obj.hex())
    if (
        isinstance(obj, _dt.datetime)
        or isinstance(obj, _dt.date)
        or isinstance(obj, _dt.time)
    ):
        return _quote(obj.isoformat())
    if isinstance(obj, unicode):
        return _quote(obj.encode("utf-8"))
    if isinstance(obj, str):
        return _quote(obj)

    oid = id(obj)
    if oid in seen:
        raise ValueError("Cycle detected while encoding to json")
    seen.add(oid)
    try:
        if isinstance(obj, dict):
            items = []
            for k, v in obj.items():
                if not isinstance(k, str) and not isinstance(k, unicode):
                    k = str(k)
                elif isinstance(k, unicode):
                    k = k.encode("utf-8")
                items.append(_quote(k) + ":" + _encode(v, seen))
            return "{" + ",".join(items) + "}"

        if isinstance(obj, (list, tuple, set, frozenset)):
            return "[" + ",".join(_encode(x, seen) for x in obj) + "]"

        if hasattr(obj, "__dict__"):
            d = {}
            for k, v in obj.__dict__.items():
                if k.startswith("_"):
                    continue
                d[k] = v
            return _encode(d, seen)

        slots = getattr(obj, "__slots__", None)
        if slots:
            d = {}
            if isinstance(slots, str):
                slots = [slots]
            for k in slots:
                if k.startswith("_"):
                    continue
                if hasattr(obj, k):
                    d[k] = getattr(obj, k)
            return _encode(d, seen)

        return _quote(str(obj))
    finally:
        seen.discard(oid)


def _quote(s):
    if isinstance(s, unicode):
        s = s.encode("utf-8")
    out = ['"']
    for ch in s:
        o = ord(ch)
        if ch == '"':
            out.append('\\"')
        elif ch == "\\":
            out.append("\\\\")
        elif ch == "\b":
            out.append("\\b")
        elif ch == "\f":
            out.append("\\f")
        elif ch == "\n":
            out.append("\\n")
        elif ch == "\r":
            out.append("\\r")
        elif ch == "\t":
            out.append("\\t")
        elif o < 0x20:
            out.append("\\u%04x" % o)
        else:
            out.append(ch)
    out.append('"')
    return "".join(out)
