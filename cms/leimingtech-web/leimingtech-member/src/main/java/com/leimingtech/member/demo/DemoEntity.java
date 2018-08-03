package com.leimingtech.member.demo;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;
import org.hibernate.validator.constraints.Length;
import org.hibernate.validator.constraints.NotBlank;

/**
 * Created by liuzhen on 2017/4/25.
 */
@ApiModel(value = "示例实体", description = "demo")
public class DemoEntity {
    /**
     * 主键ID
     */
    @ApiModelProperty(value = "主键ID")
    private String id;


    /**
     * appid
     */
    @JsonIgnore
    @Length(max = 50, message = "appid长度必须介于 0 和 50 之间")
    @ApiModelProperty(value = "appid")
    private String appid;


    /**
     * 分组名称
     */
    @NotBlank(message = "分组名称不能为空")
    @Length(max = 30, message = "分组名称长度必须介于 0 和 30 之间")
    @ApiModelProperty(value = "分组名称", required = true)
    private String name;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getAppid() {
        return appid;
    }

    public void setAppid(String appid) {
        this.appid = appid;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }
}
