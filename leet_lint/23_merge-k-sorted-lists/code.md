# Merge k Sorted Lists
# 合并K个升序链表

## Description
Given an array of linked-lists lists, each linked list is sorted in ascending order.
Merge all the linked-lists into one sort linked-list and return it.

## Description
给你一个链表数组，每个链表都已经按升序排列。
请你将所有链表合并到一个升序链表中，返回合并后的链表。

## Example
### Example 1:
    Input: lists = [[1,4,5],[1,3,4],[2,6]]
    Output: [1,1,2,3,4,4,5,6]
    Explanation: The linked-lists are:
    [
      1->4->5,
      1->3->4,
      2->6
    ]
    merging them into one sorted list:
    1->1->2->3->4->4->5->6

### Example 2:
    Input: lists = []
    Output: []

### Example 3:
    Input: lists = [[]]
    Output: []

## 示例
### 示例 1：
    输入：lists = [[1,4,5],[1,3,4],[2,6]]
    输出：[1,1,2,3,4,4,5,6]
    解释：链表数组如下：
    [
      1->4->5,
      1->3->4,
      2->6
    ]
    将它们合并到一个有序链表中得到。
    1->1->2->3->4->4->5->6

### 示例 2：
    输入：lists = []
    输出：[]

### 示例 3：
    输入：lists = [[]]
    输出：[]

## Other
### Constraints:
* k == lists.length
* 0 <= k <= 10^4
* 0 <= lists[i].length <= 500
* -10^4 <= lists[i][j] <= 10^4
* lists[i] is sorted in ascending order.
* The sum of lists[i].length won't exceed 10^4.

## 其它
### 提示：
* k == lists.length
* 0 <= k <= 10^4
* 0 <= lists[i].length <= 500
* -10^4 <= lists[i][j] <= 10^4
* lists[i] 按 升序 排列
* lists[i].length 的总和不超过 10^4


## Solution
### 分治+堆
这是一道解答方式比较多的题目, 除了最简单的两两合并的方式, 还可以使用分治的方法来解决, 这里我们还可以使用最小堆来辅助我们解答.


## Code 
```java
    //分治
    //S O(nk * log(k))
    //S O(log(k))
    public ListNode mergeKLists(ListNode[] lists) {
        //特殊值处理
        if (lists == null || lists.length == 0) {
            return null;
        }
        return merge(lists, 0, lists.length - 1);
    }

    //合并多个链表
    private ListNode merge(ListNode[] lists, int left, int right) {
        //如果当前区间内链表唯一则直接返回改链接,  结束递归
        if (left == right) {
            return lists[left];
        }
        //获取当前中心范围位置
        int mid = left + (right - left) / 2;
        //获取左右区间内合并的结果
        ListNode l1 = merge(lists, left, mid);
        ListNode l2 = merge(lists, mid + 1, right);
        //将其左右区间合并
        return mergeTwoLists(l1, l2);
    }

    //合并两个有序链表
    private ListNode mergeTwoLists(ListNode l1, ListNode l2) {
        if (l1 == null) return l2;
        if (l2 == null) return l1;
        if (l1.val < l2.val) {
            l1.next = mergeTwoLists(l1.next, l2);
            return l1;
        } else {
            l2.next = mergeTwoLists(l1, l2.next);
            return l2;
        }
    }

    //最小堆
    //T O(nk * log(k))
    //S O(k)
    public ListNode mergeKLists(ListNode[] lists) {
        //特殊值处理

        if (lists == null || lists.length == 0) {
            return null;
        }

        //创建一个小根堆, 并根据值大小排序
        PriorityQueue<ListNode> queue = new PriorityQueue(new Comparator<ListNode>() {
            public int compare(ListNode o1, ListNode o2) {
                return (o1.val - o2.val);
            }
        });

        //定义初始结点
        ListNode result = new ListNode(-1);

        //定义当前操作结点
        ListNode current = result;

        //依次把每个链表中首尾结点放入堆中
        for (ListNode head : lists) {
            if (head != null) {
                queue.add(head);
            }
        }

        //依次去取堆内元素, 直到堆为空
        while (queue.size() > 0) {
            //去除当前堆顶节点将其放入链表的结束位置
            ListNode node = queue.poll();
            current.next = node;
            current = current.next;
            //如果当前取出的节点指向的节点不为空, 则将其下一位节点放入堆中
            if (node.next != null) {
                queue.add(node.next);
            }
        }
        return result.next;
    }

```