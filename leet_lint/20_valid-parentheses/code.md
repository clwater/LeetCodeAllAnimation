# Valid Parentheses
# 有效的括号

## Description
Given a string containing just the characters '(', ')', '{', '}', '[' and ']', determine if the input string is valid.
An input string is valid if:
Open brackets must be closed by the same type of brackets.
Open brackets must be closed in the correct order.
Note that an empty string is also considered valid.

## Description
给定一个只包括 '('，')'，'{'，'}'，'['，']' 的字符串，判断字符串是否有效。
有效字符串需满足：
左括号必须用相同类型的右括号闭合。
左括号必须以正确的顺序闭合。


## Example
### Example 1:
    Input: "()"
    Output: true

### Example 2:
    Input: "()[]{}"
    Output: true

### Example 3:
    Input: "(]"
    Output: false

### Example 4:
    Input: "([)]"
    Output: false

### Example 5:
    Input: "{[]}"
    Output: true

## 示例
### 示例 1:
    输入: "()"
    输出: true

### 示例 2:
    输入: "()[]{}"
    输出: true

### 示例 3:
    输入: "(]"
    输出: false

### 示例 4:
    输入: "([)]"
    输出: false

### 示例 5:
    输入: "{[]}"
    输出: true



## Solution
### 栈
判断括号的有效性可以使用「栈」这一数据结构来解决


## Code 

```java
//T O(n)
    //S O(n)
    public boolean isValid(String s) {
        //定义栈
        Stack<Character> stack = new Stack<>();

        //遍历字符串
        for (int i = 0; i < s.length(); i++) {
            switch (s.charAt(i)){
                //当前位左括号时则入栈
                case '{':
                    stack.push('{');
                    break;
                case '[':
                    stack.push('[');
                    break;
                case '(':
                    stack.push('(');
                    break;
                //当前位右括号时则出栈校验
                case '}':
                    if (stack.isEmpty() || !stack.pop().equals('{')){
                        return false;
                    }
                    break;
                case ']':
                    if (stack.isEmpty() || !stack.pop().equals('[')){
                        return false;
                    }
                    break;
                case ')':
                    if (stack.isEmpty() || !stack.pop().equals('(')){
                        return false;
                    }
                    break;
            }
        }
        //判断当前栈是否为空
        return stack.isEmpty();
    }
```