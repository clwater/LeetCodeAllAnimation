# Strobogrammatic Number III
# 中心对称数

## Description
A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).
Write a function to count the total strobogrammatic numbers that exist in the range of low <= num <= high.

## Description
中心对称数是指一个数字在旋转了 180 度之后看起来依旧相同的数字（或者上下颠倒地看）。
写一个函数来计算范围在 [low, high] 之间中心对称数的个数。

## Example
### Example:
    Input: low = "50", high = "100"
    Output: 3 
    Explanation: 69, 88, and 96 are three strobogrammatic numbers.

## 示例
### 示例:
    输入: low = "50", high = "100"
    输出: 3 
    解释: 69，88 和 96 是三个在该范围内的中心对称数
    

## Other
### Note:
* Because the range might be a large number, the low and high numbers are represented as string.

## 其它
### 注意:
* 由于范围可能很大，所以 low 和 high 都用字符串表示。

## Solution
### 迭代+记忆化
类似的,在我们找到中心对称数的生成规律后, 我们可以通过迭代的方式来依次生成相关的内容.


## Code 

```java
    //保存当前为n的情况下, 存在的中心对称数
    private HashMap<Integer, List<String>> map = new HashMap<>();


    //T O(n * n!)
    //S O(n)
    public int strobogrammaticInRange(String low, String high) {

        //定义返回的结果集
        List<String> result = new ArrayList<>();

        //获取相应层级的情况
        for (int i = low.length(); i <= high.length(); i++) {
            result.addAll(find(i));
        }

        //通过迭代器去除以0开头的字符串
        result.removeIf(s -> s.startsWith("0"));
        //处理特殊的需要长度为1的情况
        if (low.length() == 1){
            result.add("0");
        }

        //移除不符合的情况
        //可优化比较方法
        result.removeIf(s -> Long.parseLong(s) < Long.parseLong(low) );
        result.removeIf(s -> Long.parseLong(s) > Long.parseLong(high) );

        return result.size();

    }


    public List<String> find(int n) {
        //如果层级已经存在,则直接返回
        if (map.containsKey(n)) {
            return map.get(n);
        }

        //保存n为1的情况
        if (n == 1) {
            List<String> list = new ArrayList<>();
            list.add("0");
            list.add("1");
            list.add("8");
            map.put(1, list);
            return list;
        }
        //保存n为2的情况
        if (n == 2) {
            List<String> list = new ArrayList<>();
            list.add("00");
            list.add("11");
            list.add("69");
            list.add("88");
            list.add("96");
            map.put(2, list);
            return list;
        }


        //获取n为2时的中心对称数
        List<String> list2s = find(2);
        //获取n为n - 2时的中心对称数
        List<String> listLess2s = find(n - 2);

        //定义当前层级的结果
        List<String> listResult = new ArrayList<>();
        for (String list2 : list2s) {
            for (String listLess2 : listLess2s) {
                //记录当前所在结果
                listResult.add(list2.charAt(0) + listLess2 + list2.charAt(1));
            }
        }
        return listResult;
    }
```