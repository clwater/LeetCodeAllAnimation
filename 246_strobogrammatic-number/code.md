# Strobogrammatic Number
# 中心对称数

## Description
A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).
Write a function to determine if a number is strobogrammatic. The number is represented as a string.

## Description
中心对称数是指一个数字在旋转了 180 度之后看起来依旧相同的数字（或者上下颠倒地看）。
请写一个函数来判断该数字是否是中心对称数，其输入将会以一个字符串的形式来表达数字。

## Example
###   Example 1:
    Input: num = "69"
    Output: true

### Example 2:
    Input: num = "88"
    Output: true

### Example 3:
    Input: num = "962"
    Output: false

### Example 4:
    Input: num = "1"
    Output: true

## 示例
###   示例 1:
    输入: num = "69"
    输出: true

### 示例 2:
    输入: num = "88"
    输出: true

### 示例 3:
    输入: num = "962"
    输出: false

### 示例 4：
    输入：num = "1"
    输出：true


## Solution
### 双指针
首尾双指针直接判断是否为0,1,8或者对应6, 9

## Code 

```java
    //T O(n)
    //S O(1)
    public boolean isStrobogrammatic(String num) {
        //记录满足要求的要求的数字对
        Map<Character, Character> checks = new HashMap<>();
        checks.put('0', '0');
        checks.put('1', '1');
        checks.put('6', '9');
        checks.put('8', '8');
        checks.put('9', '6');

        //定义双指针
        int left = 0;
        int right = num.length() - 1;
        while(left <= right){
            //检查是否为存在于满足的数字对
            if(!checks.containsKey(num.charAt(left))
                    || !checks.containsKey(num.charAt(right))) {
                return false;
            }
            //查看左侧和右侧对应的数据是否匹配
            if(checks.get(num.charAt(left)) != num.charAt(right)) {
                return false;
            }
            //移动指针
            left++;
            right--;
        }
        return true;
    }
```