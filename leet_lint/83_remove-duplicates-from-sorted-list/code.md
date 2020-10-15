# Remove Duplicates from Sorted List
# 删除排序链表中的重复元素

## Description
Given a sorted linked list, delete all duplicates such that each element appear only once.

## Description
给定一个排序链表，删除所有重复的元素，使得每个元素只出现一次。


## Example
### Example 1:
    Input: 1->1->2
    Output: 1->2

### Example 2:
    Input: 1->1->2->3->3
    Output: 1->2->3


## 示例
### 示例 1:
    输入: 1->1->2
    输出: 1->2

### 示例 2:
    输入: 1->1->2->3->3
    输出: 1->2->3 



## Solution

### 迭代
这也是一道比较简单的题目, 通个对链表的迭代操作, 这里考察的是我们对链表的操作.

### Code

```java
    //T O(n)
    //S O(1)
    public ListNode deleteDuplicates(ListNode head) {
        //当以当前操作的节点信息
        ListNode current = head;
        //循环节点的信息
        while (current != null && current.next != null) {
            //判断当前及下一个节点信息是否相同
            //如果相同则更新当前节点的指向信息
            if (current.val == current.next.val) {
                current.next = current.next.next;
            //不相同则移动节点到下一个
            } else {
                current = current.next;
            }
        }
        return head;
    }
```