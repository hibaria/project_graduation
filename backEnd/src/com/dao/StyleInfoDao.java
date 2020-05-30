package com.dao;

import com.javabean.Shielding;
import com.javabean.StyleInfo;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.sql.Types;
import java.util.ArrayList;

public class StyleInfoDao {
    private JdbcTemplate jdbcTemplate;
    private ArrayList<StyleInfo> styleList = new ArrayList<StyleInfo>();

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void rs2Obj(SqlRowSet rs) {
        while (rs.next()) {
            StyleInfo styleInfo = new StyleInfo();
            styleInfo.setType(rs.getString(1));
            styleInfo.setSize(rs.getFloat(2));
            styleInfo.setArea(rs.getFloat(3));
            styleInfo.setBackground(rs.getString(4));
            styleInfo.setOpacity(rs.getFloat(5));
            styleInfo.setDuration(rs.getInt(6));
            styleInfo.setUnitPrice(rs.getFloat(7));
            styleInfo.setPosition(rs.getString(8));
            styleList.add(styleInfo);
        }
    }

    /**
     * 添加style
     */
//    public void add(StyleInfo styleInfo) {
//        String sql = "insert into tb_style(type,size,area,background,opacity,duration,unitPrice,position) values(?,?,?,?,?,?,?,?)";
//        Object[] params = new Object[]{
//                styleInfo.getType(),
//                styleInfo.getSize(),
//                styleInfo.getArea(),
//                styleInfo.getBackground(),
//                styleInfo.getOpacity(),
//                styleInfo.getDuration(),
//                styleInfo.getUnitPrice(),
//                styleInfo.getPosition()
//        };
//        int types[] = new int[]{
//                Types.VARCHAR,
//                Types.FLOAT,
//                Types.FLOAT,
//                Types.VARCHAR,
//                Types.FLOAT,
//                Types.INTEGER,
//                Types.FLOAT,
//                Types.VARCHAR
//        };
//        jdbcTemplate.update(sql, params, types);
//    }

    //    删除该条style
//    public void delete(String type) {
//        String sql = "DELETE FROM tb_style WHERE type=?";
//        jdbcTemplate.update(sql, type);
//    }

    //获取所有词汇
    public ArrayList<StyleInfo> getAll() {
        String sql = "SELECT * FROM tb_style";
        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql);
        this.rs2Obj(rs);
        return styleList;
    }

    //    更改style对应
    public void replaceInto(StyleInfo styleInfo) {
        String sql = "replace into tb_style(type,size,area,background,opacity,duration,unitPrice,position) values(?,?,?,?,?,?,?,?)";
        Object[] params = new Object[]{
                styleInfo.getType(),
                styleInfo.getSize(),
                styleInfo.getArea(),
                styleInfo.getBackground(),
                styleInfo.getOpacity(),
                styleInfo.getDuration(),
                styleInfo.getUnitPrice(),
                styleInfo.getPosition()
        };
        int types[] = new int[]{
                Types.VARCHAR,
                Types.FLOAT,
                Types.FLOAT,
                Types.VARCHAR,
                Types.FLOAT,
                Types.INTEGER,
                Types.FLOAT,
                Types.VARCHAR
        };
        jdbcTemplate.update(sql, params, types);
    }


}
