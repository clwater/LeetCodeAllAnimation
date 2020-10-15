# Add Two Numbers
# 两数相加

## Description
You are given two non-empty linked lists representing two non-negative integers. The digits are stored in reverse order and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
You may assume the two numbers do not contain any leading zero, except the number 0 itself.

## Description
给出两个 非空 的链表用来表示两个非负的整数。其中，它们各自的位数是按照 逆序 的方式存储的，并且它们的每个节点只能存储 一位 数字。
如果，我们将这两个数相加起来，则会返回一个新的链表来表示它们的和。
您可以假设除了数字 0 之外，这两个数都不会以 0 开头。

## Example
### Example:
    Input: (2 -> 4 -> 3) + (5 -> 6 -> 4)
    Output: 7 -> 0 -> 8
    Explanation: 342 + 465 = 807.

## 示例
### 示例：
    输入：(2 -> 4 -> 3) + (5 -> 6 -> 4)
    输出：7 -> 0 -> 8
    原因：342 + 465 = 807


## Solution
### 迭代
这道题目比较简单, 需要额外注意的是在计算的时候需要考虑到进位的情况.


## Code 

```java
    //T O(max(m,n))
    //S O(max(m,n))
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        //定义返回结果集
        ListNode result = new ListNode(-1);
        ListNode cur = result;

        //定义进位标识
        int carry = 0;

        //两个列表均为空且没有进位标识则停止
        while (l1 != null || l2 != null || carry != 0){
            //分别在链表中取值, 如果为空则值0
            int s1 = l1 != null ? l1.val : 0;
            int s2 = l2 != null ? l2.val : 0;

            //计算与标进位标识的和
            int sum = s1 + s2 + carry;

            //更新下一位的标识
            carry = sum / 10;

            //更新当前位的内容
            sum = sum % 10;

            //构建结果节点
            ListNode node = new ListNode(sum);

            //移动链表
            cur.next = node;
            cur = cur.next;

            if (l1 != null){
                l1 = l1.next;
            }
            if (l2 != null){
                l2 = l2.next;
            }
        }

        return result.next;

    }
```