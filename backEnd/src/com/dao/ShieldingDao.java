package com.dao;

import com.javabean.Shielding;
import com.javabean.Video;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.sql.Types;
import java.util.ArrayList;

public class ShieldingDao {
    private JdbcTemplate jdbcTemplate;
    private ArrayList<Shielding> shieldingList = new ArrayList<Shielding>();

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void rs2Obj(SqlRowSet rs) {
        while (rs.next()) {
            Shielding shielding = new Shielding();
            shielding.setId(rs.getInt(1));
            shielding.setVocabulary(rs.getString(2));
            shieldingList.add(shielding);
        }
    }

    /**
     * 添加屏蔽词汇
     */
    public void addVocabulary(Shielding shielding) {
        String sql = "";
        sql = "insert into shielding(id,vocabulary) values(?,?)";
        Object[] params = new Object[]{
                shielding.getId(),
                shielding.getVocabulary()
        };
        int types[] = new int[]{
                Types.INTEGER,
                Types.VARCHAR
        };
        jdbcTemplate.update(sql, params, types);
    }

    //    删除该词汇
    public void delete(int id) {
        String sql = "DELETE FROM shielding WHERE id=?";
        jdbcTemplate.update(sql, id);
    }

    //获取所有词汇
    public ArrayList<Shielding> getAll() {
        String sql = "SELECT * FROM shielding";
        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql);
        this.rs2Obj(rs);
        return shieldingList;
    }

    public int getMaxId() {
        int k = 0;
        try {
            String sql = "SELECT * FROM shielding";
            SqlRowSet rs = jdbcTemplate.queryForRowSet(sql);
            this.rs2Obj(rs);
            for (Shielding shielding : shieldingList) {
                int temp = shielding.getId();
                if (k < temp) {
                    k = temp;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return k;
    }


}
