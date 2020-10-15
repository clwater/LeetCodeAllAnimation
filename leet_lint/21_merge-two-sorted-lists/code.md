# Merge Two Sorted Lists
# 合并两个有序链表

## Description
Merge two sorted linked lists and return it as a new sorted list. The new list should be made by splicing together the nodes of the first two lists.

## Description
将两个升序链表合并为一个新的 升序 链表并返回。新链表是通过拼接给定的两个链表的所有节点组成的。 

## Example
### Example:
    Input: 1->2->4, 1->3->4
    Output: 1->1->2->3->4->4

## 示例
### 示例：
    输入：1->2->4, 1->3->4
    输出：1->1->2->3->4->4


## Solution
### 迭代
这道题目还是一道比较简单的题目, 我们按照题目需要的依次迭代就可以了.


## Code 

```java
    //T O(n+m)
    //S O(1)
    public ListNode mergeTwoLists(ListNode l1, ListNode l2) {

        //定义结果集和操作的节点
        ListNode head = new ListNode();
        ListNode cur = head;

        //移动和操作两个字节点
        while (l1 != null && l2 != null){
            //判断两个节点内容
            if (l1.val <= l2.val){
                cur.next = l1;
                l1 = l1.next;
            }else {
                cur.next = l2;
                l2 = l2.next;
            }
            //移动节点位置
            cur = cur.next;
        }

        //判断空节点的情况
        if (l1 == null){
            cur.next = l2;
        }else {
            cur.next = l1;
        }
        return head.next;
    }
```