class ListNode {
  val: number;
  next: ListNode | null;
  constructor(val?: number, next?: ListNode | null) {
    this.val = val === undefined ? 0 : val;
    this.next = next === undefined ? null : next;
  }
}

function toListNode(arr: number[]): ListNode | null {
  if (arr.length === 0) return null;
  const head = new ListNode(arr[0]);
  let cur = head;
  for (let i = 1; i < arr.length; i++) {
    cur.next = new ListNode(arr[i]);
    cur = cur.next;
  }
  return head;
}

function listNodeToArray(head: ListNode | null): number[] {
  const res: number[] = [];
  for (let cur = head; cur !== null; cur = cur.next) {
    res.push(cur.val);
  }
  return res;
}

class TreeNode {
  val: number;
  left: TreeNode | null;
  right: TreeNode | null;
  constructor(val?: number, left?: TreeNode | null, right?: TreeNode | null) {
    this.val = val === undefined ? 0 : val;
    this.left = left === undefined ? null : left;
    this.right = right === undefined ? null : right;
  }
}

function toTreeNode(arr: (number | null)[]): TreeNode | null {
  if (arr.length === 0 || arr[0] === null) return null;
  const root = new TreeNode(arr[0]);
  const queue: TreeNode[] = [root];
  let i = 1;
  while (queue.length > 0 && i < arr.length) {
    const node = queue.shift()!;
    if (i < arr.length && arr[i] !== null) {
      node.left = new TreeNode(arr[i] as number);
      queue.push(node.left);
    }
    i++;
    if (i < arr.length && arr[i] !== null) {
      node.right = new TreeNode(arr[i] as number);
      queue.push(node.right);
    }
    i++;
  }
  return root;
}

function treeNodeToArray(root: TreeNode | null): (number | null)[] {
  const res: (number | null)[] = [];
  if (root === null) return res;
  const queue: (TreeNode | null)[] = [root];
  while (queue.length > 0) {
    const node = queue.shift()!;
    if (node !== null) {
      res.push(node.val);
      queue.push(node.left, node.right);
    } else {
      res.push(null);
    }
  }
  while (res.length > 0 && res[res.length - 1] === null) {
    res.pop();
  }
  return res;
}

function toJson(value: unknown): string {
  return jsonEncode(value, new Set());
}

function jsonEncode(value: unknown, seen: Set<object>): string {
  if (value === null || value === undefined) return "null";
  if (typeof value === "boolean") return value ? "true" : "false";
  if (typeof value === "number") {
    if (!isFinite(value)) return "null";
    return Object.is(value, -0) ? "0" : String(value);
  }
  if (typeof value === "string") return jsonQuote(value);
  if (Array.isArray(value)) {
    if (seen.has(value))
      throw new Error("Cycle detected while encoding to json");
    seen.add(value);
    const inner = value.map((v) => jsonEncode(v, seen)).join(",");
    seen.delete(value);
    return "[" + inner + "]";
  }
  if (typeof value === "object") {
    if (seen.has(value as object))
      throw new Error("Cycle detected while encoding to json");
    seen.add(value as object);
    const entries = Object.entries(value as Record<string, unknown>)
      .map(([k, v]) => jsonQuote(k) + ":" + jsonEncode(v, seen))
      .join(",");
    seen.delete(value as object);
    return "{" + entries + "}";
  }
  return jsonQuote(String(value));
}

function jsonQuote(s: string): string {
  let out = '"';
  for (const ch of s) {
    const code = ch.charCodeAt(0);
    switch (ch) {
      case '"':
        out += '\\"';
        break;
      case "\\":
        out += "\\\\";
        break;
      case "\b":
        out += "\\b";
        break;
      case "\f":
        out += "\\f";
        break;
      case "\n":
        out += "\\n";
        break;
      case "\r":
        out += "\\r";
        break;
      case "\t":
        out += "\\t";
        break;
      default:
        if (code < 0x20) {
          out += "\\u" + code.toString(16).padStart(4, "0");
        } else {
          out += ch;
        }
    }
  }
  return out + '"';
}
