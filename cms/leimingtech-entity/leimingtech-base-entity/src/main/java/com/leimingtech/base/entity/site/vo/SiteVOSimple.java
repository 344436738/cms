package  com.leimingtech.base.entity.site.vo;

import org.springframework.jdbc.core.RowMapper;

import java.io.Serializable;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 * 简单的站点实体
 * Created by liuzhen on 2017/4/19.
 */
public class SiteVOSimple implements RowMapper<SiteVOSimple>, Serializable {

    private String id;
    /**网站名称*/
    private java.lang.String siteName;
    /**简短名称*/
    private java.lang.String shortName;

    @Override
    public SiteVOSimple mapRow(ResultSet rs, int rowNum) throws SQLException {
        SiteVOSimple site=new SiteVOSimple();
        site.setId(rs.getString("id"));
        site.setSiteName(rs.getString("site_name"));
        site.setShortName(rs.getString("short_name"));
        return site;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getSiteName() {
        return siteName;
    }

    public void setSiteName(String siteName) {
        this.siteName = siteName;
    }

    public String getShortName() {
        return shortName;
    }

    public void setShortName(String shortName) {
        this.shortName = shortName;
    }
}
