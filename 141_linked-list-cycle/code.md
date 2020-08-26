# Linked List Cycle
# 环形链表

## Description
Given a linked list, determine if it has a cycle in it.
To represent a cycle in the given linked list, we use an integer pos which represents the position (0-indexed) in the linked list where tail connects to. If pos is -1, then there is no cycle in the linked list.

## Description
给定一个链表，判断链表中是否有环。
为了表示给定链表中的环，我们使用整数 pos 来表示链表尾连接到链表中的位置（索引从 0 开始）。 如果 pos 是 -1，则在该链表中没有环。

## Example
###  Example 1:
    Input: head = [3,2,0,-4], pos = 1
    Output: true
    Explanation: There is a cycle in the linked list, where tail connects to the second node.

### Example 2:
    Input: head = [1,2], pos = 0
    Output: true
    Explanation: There is a cycle in the linked list, where tail connects to the first node.

### Example 3:
    Input: head = [1], pos = -1
    Output: false
    Explanation: There is no cycle in the linked list.
      Follow up:
    Can you solve it using O(1) (i.e. constant) memory?

## 示例
### 示例 1：
    输入：head = [3,2,0,-4], pos = 1
    输出：true
    解释：链表中有一个环，其尾部连接到第二个节点。

### 示例 2：
    输入：head = [1,2], pos = 0
    输出：true
    解释：链表中有一个环，其尾部连接到第一个节点。

### 示例 3：
    输入：head = [1], pos = -1
    输出：false
    解释：链表中没有环。
      进阶：
    你能用 O(1)（即，常量）内存解决此问题吗？


## Solution
### 哈希表+双指针
我们可以通过检查一个结点此前是否被访问过来判断链表是否为环形链表, 除此之外我们还可以通过使用具有不同速度的快,慢两个指针遍历链表.


## Code 

```java
    //T O(n)
    //S O(n)
    //哈希表
    public boolean hasCycle(ListNode head) {
        //非空判断
        if (head == null || head.next == null){
            return false;
        }

        //定义Set集
        Set<ListNode> set = new HashSet<>();

        //遍历链表
        while (head != null){
            //判断set中是否包含已有元素
            if (set.contains(head)){
                return true;
            }else {
                //如果不包含已有的元素,则添加相关元素
                set.add(head);
                head = head.next;
            }

        }

        return false;
    }

    //T O(n + k) = O(n)
    //S O(1)
    //双指针
    public boolean hasCycle(ListNode head) {
        //非空判断
        if (head == null || head.next == null) {
            return false;
        }

        //定义快慢指针
        ListNode l1 = head;
        ListNode l2 = head.next;

        //判断快慢指针指向是否相同
        while (l2 != l1) {
            //非空判断
            if (l2 == null || l2.next == null) {
                return false;
            }
            //移动指针
            l1 = l1.next;
            l2 = l2.next.next;
        }

        return true;
    }
```