# Reverse Linked List
# 反转链表

## Description
Reverse a singly linked list.

## Description
反转一个单链表。

## Example
### Example:
    Input: 1->2->3->4->5->NULL
    Output: 5->4->3->2->1->NULL

## 示例
### 示例:
    输入: 1->2->3->4->5->NULL
    输出: 5->4->3->2->1->NULL

## Other
### Follow up:
* A linked list can be reversed either iteratively or recursively. Could you implement both?

## 其它
### 进阶:
* 你可以迭代或递归地反转链表。你能否用两种方法解决这道题？


## Solution
### 迭代+递归
十分简单的题目, 通过迭代和递归的方法都可以解决此题


## Code 

```java
    //迭代
    //T O(n)
    //S O(1)
    public ListNode reverseList(ListNode head) {
        //定义返回结果(新的头结点)
        ListNode result = null;
        //定义操作结点
        ListNode cur = head;

        while (cur != null) {
            //保存当前节点的下一个位置
            ListNode nextNode = cur.next;
            //将当前节点的下一个节点的位置指向头结点
            cur.next = result;
            //将当前节点设为头结点
            result = cur;
            //移动到之前保存的原有的下一个节点继续操作
            cur = nextNode;
        }
        return result;
    }

    //T O(n)
    //S O(n)
    //递归
    public ListNode reverseList(ListNode head) {
        if (head == null || head.next == null) {
            return head;
        }
        ListNode result = reverseList(head.next);
        head.next.next = head;
        head.next = null;
        return result;
    }
```