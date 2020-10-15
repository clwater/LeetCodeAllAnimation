# Majority Element
# 多数元素

## Description
Given an array of size n, find the majority element. The majority element is the element that appears more than ⌊ n/2 ⌋ times.

You may assume that the array is non-empty and the majority element always exist in the array.


## Description
给定一个大小为 n 的数组，找到其中的多数元素。多数元素是指在数组中出现次数大于 ⌊ n/2 ⌋ 的元素。

你可以假设数组是非空的，并且给定的数组总是存在多数元素。




## Example
###Example 1:
    Input: [3,2,3]
    Output: 3

### Example 2:
    Input: [2,2,1,1,1,2,2]
    Output: 2

## 样例
### 示例 1:
    输入: [3,2,3]
    输出: 3

### 示例 2:
    输入: [2,2,1,1,1,2,2]
    输出: 2  



## Solution
### 哈希+排序+随机+投票
这是一道比较见到的题目, 这里我们尝试使用多种方式来解答


### Code

```java
       //哈希表
    //T O(n)
    //S O(n)
    public int majorityElement(int[] nums) {
        HashMap<Integer, Integer> maps = new HashMap<>();
        for (int num: nums){
            if (maps.containsKey(num)){
                maps.put(num, maps.get(num) + 1);
            }else {
                maps.put(num, 1);
            }
        }

        int result = nums[0];

        for (Map.Entry<Integer, Integer> map: maps.entrySet()){
            if (map.getValue() > maps.get(result)){
                result = map.getKey();
            }
        }

        return result;
    }

    //排序法
    //T O(n log(n))
    //S O(n log(n))
    public int majorityElement(int[] nums) {
        Arrays.sort(nums);
        return nums[ nums.length / 2];
    }


    //获取当前数组内每个数字出现的次数
    private int countOccurences(int[] nums, int num) {
        int count = 0;
        for (int i = 0; i < nums.length; i++) {
            if (nums[i] == num) {
                count++;
            }
        }
        return count;
    }

    //随机法
    //T O(n)
    //S O(1)
    public int majorityElement(int[] nums) {
        Random rand = new Random();
        while (true){
            int result = nums[rand.nextInt(nums.length)];
            if (countOccurences(nums, result) > nums.length / 2){
                return result;
            }
        }
    }

    //Boyer-Moore投票算法
    //T O(n)
    //S O(1)
    public int majorityElement(int[] nums) {
        int statu = 0;
        Integer result = null;
        for (int num: nums){
            if (statu == 0){
                result = num;
            }

            statu += (num == result) ? +1: -1;
        }

        return result;
    }
```