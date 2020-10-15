# Restore IP Addresses
# 复原IP地址

## Description
Given a string s containing only digits. Return all possible valid IP addresses that can be obtained from s. You can return them in any order.
A valid IP address consists of exactly four integers, each integer is between 0 and 255, separated by single points and cannot have leading zeros. For example, "0.1.2.201" and "192.168.1.1" are valid IP addresses and "0.011.255.245", "192.168.1.312" and "192.168@1.1" are invalid IP addresses. 

## Description
给定一个只包含数字的字符串，复原它并返回所有可能的 IP 地址格式。
有效的 IP 地址 正好由四个整数（每个整数位于 0 到 255 之间组成，且不能含有前导 0），整数之间用 '.' 分隔。
例如："0.1.2.201" 和 "192.168.1.1" 是 有效的 IP 地址，但是 "0.011.255.245"、"192.168.1.312" 和 "192.168@1.1" 是 无效的 IP 地址。

## Example
### Example 1:
    Input: s = "25525511135"
    Output: ["255.255.11.135","255.255.111.35"]

### Example 2:
    Input: s = "0000"
    Output: ["0.0.0.0"]

### Example 3:
    Input: s = "1111"
    Output: ["1.1.1.1"]

### Example 4:
    Input: s = "010010"
    Output: ["0.10.0.10","0.100.1.0"]

### Example 5:
    Input: s = "101023"
    Output: ["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"]

## 示例
### 示例 1：
    输入：s = "25525511135"
    输出：["255.255.11.135","255.255.111.35"]

### 示例 2：
    输入：s = "0000"
    输出：["0.0.0.0"]

### 示例 3：
    输入：s = "1111"
    输出：["1.1.1.1"]

### 示例 4：
    输入：s = "010010"
    输出：["0.10.0.10","0.100.1.0"]

### 示例 5：
    输入：s = "101023"
    输出：["1.0.10.23","1.0.102.3","10.1.0.23","10.10.2.3","101.0.2.3"]


## Constraints:
* 0 <= s.length <= 3000
* s consists of digits only.

## 提示
* 0 <= s.length <= 3000
* s 仅由数字组成


## Solution
### 回溯+剪枝
这里首先需要把问题转换为树形问题,在画树形图的过程中,会发现有些枝叶是没有必要的, 处理这些没必要处理的枝叶的过程就需要进行剪枝


## Code 

```java
//T O(1)
    //S O(1)
    public List<String> restoreIpAddresses(String s) {
        //结果集
        List<String> result = new ArrayList<>();

        //通过StringBuilder帮助减枝回溯
        StringBuilder cur = new StringBuilder();
        backTrace(s, 0, cur, 0, result);

        return result;
    }

    // s 为需要处理的字段
    // index 为进行处理的位置
    // cur 为剪枝回溯的字段
    // count 为当前已确定ip自动量
    // result 结果集
    public void backTrace(String s, int index, StringBuilder cur, int count, List<String> result) {
        int len = cur.length();

        //判读剩余字段的是否存在刚好填充剩余ip端的情况
        if (index + (4 - count) * 1 > s.length()
                || index + (4 - count) * 3 < s.length()  ){
            return;
        }

        if(count == 4) {
            // 如果字符串都取完了，可以加入结果集
            if(index == s.length()) {
                // 移除掉最后的"."
                cur.deleteCharAt(cur.length() - 1);
                result.add(cur.toString());
            }
            return;
        }
        // 每组ip地址的长度为 1 - 3
        for(int i = 1; i <= 3; i++) {

            if(index + i > s.length())
                break;

            int num = Integer.parseInt(s.substring(index, index + i));

            // 注意ip数字的合法性，不能大于255
            if(num > 255)
                break;

            // 不能存在01.001.01.01
            if(String.valueOf(num).length() != i)
                break;


            cur.append(num);
            cur.append(".");

            backTrace(s, index + i, cur, count + 1, result);

            cur.setLength(len);
        }
    }

```