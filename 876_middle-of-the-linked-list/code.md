# Middle of the Linked List
# 链表的中间结点

## Description
Given a non-empty, singly linked list with head node head, return a middle node of linked list.

If there are two middle nodes, return the second middle node.

## Description
给定一个带有头结点 head 的非空单链表，返回链表的中间结点。

如果有两个中间结点，则返回第二个中间结点。

## Example
### Example 1:
    Input: [1,2,3,4,5]
    Output: Node 3 from this list (Serialization: [3,4,5])
    The returned node has value 3.  (The judge's serialization of this node is [3,4,5]).
    Note that we returned a ListNode object ans, such that:
    ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, and ans.next.next.next = NULL.

### Example 2:
    Input: [1,2,3,4,5,6]
    Output: Node 4 from this list (Serialization: [4,5,6])
    Since the list has two middle nodes with values 3 and 4, we return the second one.

## 示例
### 示例 1：
    输入：[1,2,3,4,5]
    输出：此列表中的结点 3 (序列化形式：[3,4,5])
    返回的结点值为 3 。 (测评系统对该结点序列化表述是 [3,4,5])。
    注意，我们返回了一个 ListNode 类型的对象 ans，这样：
    ans.val = 3, ans.next.val = 4, ans.next.next.val = 5, 以及 ans.next.next.next = NULL.
### 示例 2：
    输入：[1,2,3,4,5,6]
    输出：此列表中的结点 4 (序列化形式：[4,5,6])
    由于该列表有两个中间结点，值分别为 3 和 4，我们返回第二个结点。


## Note:
* The number of nodes in the given list will be between 1 and 100.

## 提示：
* 给定链表的结点数介于 1 和 100 之间。


## Solution
### 双指针
在这道题目中, 最简单的方法就是遍历当前的链表, 找到其长度, 再通过其长度寻找中心的位置, 除此之外我们还可以通过快慢不同双指针来解决.

### Code

```java
    //数组
    //T O(n)
    //S O(n)
    public ListNode middleNode(ListNode head) {
        ListNode[] nodes = new ListNode[100];
        int length = 0;
        while (head != null) {
            nodes[length++] = head;
            head = head.next;
        }

        return nodes[length / 2];

    }


    //单指针
    //T O(n)
    //S O(1)
    public ListNode middleNode(ListNode head) {
        ListNode current = head;
        int length = 0;
        while (current != null) {
            current = current.next;
            length ++;
        }

        current = head;

        for (int i = 0; i < length; i++) {
            current = current.next;

        }

        return current;
    }

    //双指针
    //T O(n)
    //S O(1)
    public ListNode middleNode(ListNode head) {
        ListNode fast = head;
        ListNode slow = head;

        while (fast != null && fast.next != null) {
            fast = fast.next.next;
            slow = slow.next;
        }

        return slow;
    }
```