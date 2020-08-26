# Strobogrammatic Number II
# 中心对称数

## Description
A strobogrammatic number is a number that looks the same when rotated 180 degrees (looked at upside down).
Find all strobogrammatic numbers that are of length = n.

## Description
中心对称数是指一个数字在旋转了 180 度之后看起来依旧相同的数字（或者上下颠倒地看）。
找到所有长度为 n 的中心对称数。

## Example
### Example:
    Input:  n = 2
    Output: ["11","69","88","96"]

## 示例
### 示例 :
    输入:  n = 2
    输出: ["11","69","88","96"]

## Other

## 其它


## Solution
### 递归+记忆化
在我们找到中心对称数的生成规律后, 我们可以通过递归的方式来依次生成相关的内容.


## Code 

```java
 //保存当前为n的情况下, 存在的中心对称数
    private HashMap<Integer, List<String>> map = new HashMap<>();

    //T O(n * n!)
    //S O(n)
    public List<String> findStrobogrammatic(int n) {

        //处理n = 1的情况
        if (n == 1) {
            return Arrays.asList("0", "1", "8");
        }
        List<String> result = find(n);// 这个是递归的处理方法
        //通过迭代器去除以0开头的字符串
        result.removeIf(s -> s.startsWith("0"));
        return result;
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