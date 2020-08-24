package com.chen.pojo;

import com.baomidou.mybatisplus.annotation.IdType;
import com.baomidou.mybatisplus.annotation.TableField;
import com.baomidou.mybatisplus.annotation.TableId;
import com.baomidou.mybatisplus.annotation.TableName;
import lombok.Data;

@Data
@TableName(value = "sys_dept")
public class Dept {
    @TableId(type = IdType.AUTO)
    private Long id;
    @TableField(value = "dept_name")
    private  String dname;
}
