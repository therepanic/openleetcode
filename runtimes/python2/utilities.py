import json
import datetime as _dt


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


def to_list_node(arr):
    if not arr:
        return None
    head = ListNode(arr[0])
    cur = head
    for v in arr[1:]:
        cur.next = ListNode(v)
        cur = cur.next
    return head


def list_node_to_array(head):
    res = []
    while head:
        res.append(head.val)
        head = head.next
    return res


def to_json(obj):
    return json.dumps(_to_builtin(obj), ensure_ascii=False, separators=(",", ":"))


def _to_builtin(obj):
    if obj is None or isinstance(obj, (bool, int, float, str, unicode)):
        return obj
    if (
        isinstance(obj, _dt.datetime)
        or isinstance(obj, _dt.date)
        or isinstance(obj, _dt.time)
    ):
        return obj.isoformat()
    if isinstance(obj, dict):
        out = {}
        for k, v in obj.items():
            out[str(k)] = _to_builtin(v)
        return out
    if isinstance(obj, (list, tuple, set, frozenset)):
        return [_to_builtin(x) for x in obj]
    if hasattr(obj, "__dict__"):
        d = {}
        for k, v in obj.__dict__.items():
            if not k.startswith("_"):
                d[k] = _to_builtin(v)
        return d
    slots = getattr(obj, "__slots__", None)
    if slots:
        d = {}
        if isinstance(slots, str):
            slots = [slots]
        for k in slots:
            if not k.startswith("_") and hasattr(obj, k):
                d[k] = _to_builtin(getattr(obj, k))
        return d
    return str(obj)
