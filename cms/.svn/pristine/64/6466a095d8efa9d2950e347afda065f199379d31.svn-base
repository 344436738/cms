package  com.leimingtech.base.entity.vo;

import org.springframework.jdbc.core.RowMapper;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * Created by liuzhen on 2017/4/6.
 */
public class FunctionVOShow implements RowMapper<FunctionVOShow>, Serializable {
    private String id;
    private String parentId;
    private String name;//菜单名称
    private int level;//菜单等级
    private String href;//菜单地址
    private Integer showFlag;//是否在菜单中显示（1显示、0不显示）
    private int childShowCount;//子集中展示的数量
    private String permission;//权限标识
    private java.lang.String parentIds;//所有父节点id
    private String icon;//图标class样式

    @Override
    public FunctionVOShow mapRow(ResultSet rs, int rowNum) throws SQLException {
        FunctionVOShow function = new FunctionVOShow();
        function.setId(rs.getString("id"));
        function.setLevel(rs.getInt("level"));
        function.setName(rs.getString("name"));
        function.setParentId(rs.getString("parentId"));
        function.setHref(rs.getString("href"));
        function.setChildShowCount(rs.getInt("childShowCount"));
        function.setShowFlag(rs.getInt("showFlag"));
        function.setPermission(rs.getString("permission"));
        function.setParentIds(rs.getString("parentIds"));
        function.setIcon(rs.getString("icon"));
        return function;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getParentId() {
        return parentId;
    }

    public void setParentId(String parentId) {
        this.parentId = parentId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public int getLevel() {
        return level;
    }

    public void setLevel(int level) {
        this.level = level;
    }

    public String getHref() {
        return href;
    }

    public void setHref(String href) {
        this.href = href;
    }

    public Integer getShowFlag() {
        return showFlag;
    }

    public void setShowFlag(Integer showFlag) {
        this.showFlag = showFlag;
    }

    public int getChildShowCount() {
        return childShowCount;
    }

    public void setChildShowCount(int childShowCount) {
        this.childShowCount = childShowCount;
    }

    public String getPermission() {
        return permission;
    }

    public void setPermission(String permission) {
        this.permission = permission;
    }

    public String getParentIds() {
        return parentIds;
    }

    public void setParentIds(String parentIds) {
        this.parentIds = parentIds;
    }

    public String getIcon() {
        return icon;
    }

    public void setIcon(String icon) {
        this.icon = icon;
    }
}
