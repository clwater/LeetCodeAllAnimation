# Generate Parentheses
# 括号生成


## Description
Given n pairs of parentheses, write a function to generate all combinations of **well-formed** parentheses.

## Description
数字 n 代表生成括号的对数，请你设计一个函数，用于能够生成所有可能的并且**有效的**括号组合。


## Example
    For example, given n = 3, a solution set is:
        [
        "((()))",
        "(()())",
        "(())()",
        "()(())",
        "()()()"
        ]


## 样例
    输入：n = 3
    输出：[
        "((()))",
        "(()())",
        "(())()",
        "()(())",
        "()()()"
        ]


## Solution

### 回溯(dfs)
当我们理解题目后,在尝试寻找最后的结果的过程中, 我们尝试寻找到所有的情况并查看是否符合我们的提议, 这个时候我们就可以采用回溯的方法来解决, 实际上是需要我们通过dfs的方法遍历这棵树.

### Code

```java
       //结果集
    private List<String> result = new ArrayList<>();

    //T O(4^n / √n)
    //S O(n)
    public List<String> generateParenthesis(int n) {
        //回溯遍历(DFS)
        dfs("", n, n);
        return result;
    }

    //s: 当前字段
    //left: 剩余括号开始的数量
    //left: 剩余括号结束的数量
    private void dfs(String s, int left, int right) {
        //递归终止情况
        if (left == 0 && right == 0) {
            result.add(s);
            return;
        }
        //添加开始的括号
        if (left > 0) {
            dfs(s + "(", left - 1, right);
        }

        //添加结束的括号
        //这里要注意结束的括号数量要小于开始的括号数量
        if (right > 0 && right > left) {
            dfs(s + ")", left, right - 1);
        }

    }

```