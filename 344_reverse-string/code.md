# Reverse String
# 反转字符串


## Description
Write a function that reverses a string. The input string is given as an array of characters char[].

Do not allocate extra space for another array, you must do this by modifying the input array in-place with O(1) extra memory.

You may assume all the characters consist of printable ascii characters.


## Description
编写一个函数，其作用是将输入的字符串反转过来。输入字符串以字符数组 char[] 的形式给出。

不要给另外的数组分配额外的空间，你必须原地修改输入数组、使用 O(1) 的额外空间解决这一问题。

你可以假设数组中的所有字符都是 ASCII 码表中的可打印字符。



## Example
### Example 1:
    Input: ["h","e","l","l","o"]
    Output: ["o","l","l","e","h"]
### Example 2:
    Input: ["H","a","n","n","a","h"]
    Output: ["h","a","n","n","a","H"]

## 示例
### 示例 1：
    输入：["h","e","l","l","o"]
    输出：["o","l","l","e","h"]

### 示例 2：
    输入：["H","a","n","n","a","h"]
    输出：["h","a","n","n","a","H"]


## Solution
### 递归+双指针
这里的中心想法的话是通过中心对称的内容需要对换位置, 所以我们可以采用递归或者双指针的方法来解决

### Code
```java
    //递归调用
    private void reverseString(char[] s, int start, int end) {
        //递归结束条件
        if (start >= end) {
            return;
        }

        //交换首尾位置内容
        char tmp = s[start];
        s[start] = s[end];
        s[end] = tmp;

        //下一层调用
        reverseString(s, start + 1, end - 1);
    }

    //递归
    //T O(n)
    //S O(n)
    public void reverseString(char[] s) {
        reverseString(s, 0, s.length - 1);
    }

    //双指针
    //T O(n)
    //S O(n)
    public void reverseString(char[] s) {
        int start = 0;
        int end = s.length - 1;

        while (start < end){
            char tmp = s[start];
            s[start] = s[end];
            s[end] = tmp;

            start++;
            end--;
        }
    }

```