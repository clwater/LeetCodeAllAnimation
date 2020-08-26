# Add Two Numbers II
# 两数相加

## Description
You are given two non-empty linked lists representing two non-negative integers. The most significant digit comes first and each of their nodes contain a single digit. Add the two numbers and return it as a linked list.
You may assume the two numbers do not contain any leading zero, except the number 0 itself.


## Description
给你两个 非空 链表来代表两个非负整数。数字最高位位于链表开始位置。它们的每个节点只存储一位数字。将这两数相加会返回一个新的链表。
你可以假设除了数字 0 之外，这两个数字都不会以零开头。
  

## Example
### Example:
    Input: (7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
    Output: 7 -> 8 -> 0 -> 7

## 示例
###  示例：
    输入：(7 -> 2 -> 4 -> 3) + (5 -> 6 -> 4)
    输出：7 -> 8 -> 0 -> 7

## Other
### Follow up:
What if you cannot modify the input lists? In other words, reversing the lists is not allowed.

## 其它
### 进阶：
如果输入链表不能修改该如何处理？换句话说，你不能对列表中的节点进行翻转。

## Solution
### 栈
本题的主要难点在于链表中数位的顺序与我们做加法的顺序是相反的,为了逆序处理所有数位,我们可以使用栈.


## Code 

```java
    //T O(max(m,n))
    //S O(m + n)
    public ListNode addTwoNumbers(ListNode l1, ListNode l2) {
        //定义相关栈
        Stack<Integer> stack1 = new Stack<>();
        Stack<Integer> stack2 = new Stack<>();

        //元素入栈
        while (l1 != null){
            stack1.push(l1.val);
            l1 = l1.next;
        }

        while (l2 != null){
            stack2.push(l2.val);
            l2 = l2.next;
        }

        //返回节点
        ListNode result = null;

        //进位标识
        int carry = 0;

        //两个栈均为空, 切没有进位则终止
        while (!stack1.isEmpty() || !stack2.isEmpty() || carry!= 0){
            //获取栈中元素, 如果栈为空则取0
            int s1 = stack1.isEmpty() ? 0 : stack1.pop();
            int s2 = stack2.isEmpty() ? 0 : stack2.pop();

            //计算当前元素和, 带有进位
            int sum = s1 + s2 + carry;
            //获取下一级进位情况
            carry = sum / 10;
            //获取当前位内容
            sum  = sum % 10;

            //构建节点
            ListNode node = new ListNode(sum);

            //移动节点
            node.next = result;
            result = node;

        }
        return result;
    }
```