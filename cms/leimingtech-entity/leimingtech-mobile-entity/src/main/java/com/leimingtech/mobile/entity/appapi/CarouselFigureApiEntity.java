package com.leimingtech.mobile.entity.appapi;

import com.wordnik.swagger.annotations.ApiModel;
import com.wordnik.swagger.annotations.ApiModelProperty;

import javax.xml.bind.annotation.XmlRootElement;

/**
 * Created by hejiping on 2017/5/21.
 */
@ApiModel(value="轮播图",description = "carouselFigureApiEntity")
@XmlRootElement(name="root")
public class CarouselFigureApiEntity extends BaseApiEntity {

    @ApiModelProperty(value="轮播图")
    private CarouselFigureList ret;

    @Override
    public CarouselFigureList getRet() {
        return ret;
    }

    public void setRet(CarouselFigureList ret) {
        this.ret = ret;
    }
}
