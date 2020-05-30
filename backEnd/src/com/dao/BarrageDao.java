package com.dao;

import com.javabean.Barrage;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class BarrageDao {

    private JdbcTemplate jdbcTemplate;
    private ArrayList<Barrage> barrageList = new ArrayList<Barrage>();

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void rs2Obj(SqlRowSet rs) {
        while (rs.next()) {
            Barrage barrage = new Barrage();
            barrage.setBarrageId(rs.getInt(1));
            barrage.setVideoId(rs.getInt(2));
            barrage.setUserName(rs.getString(3));
            barrage.setContent(rs.getString(4));
            barrage.setCurrentDate(rs.getString(5));
            barrage.setVideoTime(rs.getString(6));
            barrage.setVideoTimeText(rs.getString(7));
            barrage.setAvatars(rs.getString(8));
            barrage.setBarrageType(rs.getString(9));
            barrage.setBarrageTypeText(rs.getString(10));
            barrage.setTimes(rs.getInt(11));
            barrageList.add(barrage);
        }
    }

    /**
     * 添加普通弹幕
     */
    public void addBarrage(Barrage barrage, int i) {
        String sql = "";
        if (i == 0)
            sql = "insert into barrage_normal(barrageId,videoId,userName,content,currentDate,videoTime,videoTimeText,avatars,barrageType,barrageTypeText,times) values(?,?,?,?,?,?,?,?,?,?,?)";
        else if(i==1)
            sql = "insert into tocheck_barrage(barrageId,videoId,userName,content,currentDate,videoTime,videoTimeText,avatars,barrageType,barrageTypeText,times) values(?,?,?,?,?,?,?,?,?,?,?)";
        else if(i==2)
            sql = "insert into passed_barrage(barrageId,videoId,userName,content,currentDate,videoTime,videoTimeText,avatars,barrageType,barrageTypeText,times) values(?,?,?,?,?,?,?,?,?,?,?)";
        else if(i==3)
            sql = "insert into unpassed_barrage(barrageId,videoId,userName,content,currentDate,videoTime,videoTimeText,avatars,barrageType,barrageTypeText,times) values(?,?,?,?,?,?,?,?,?,?,?)";
        else
            ;
        Object[] params = new Object[]{
                barrage.getBarrageId(),
                barrage.getVideoId(),
                barrage.getUserName(),
                barrage.getContent(),
                barrage.getCurrentDate(),
                barrage.getVideoTime(),
                barrage.getVideoTimeText(),
                barrage.getAvatars(),
                barrage.getBarrageType(),
                barrage.getBarrageTypeText(),
                barrage.getTimes()
        };
        int types[] = new int[]{
                Types.INTEGER,
                Types.INTEGER,
                Types.VARCHAR,
                Types.VARCHAR,
                Types.VARCHAR,
                Types.VARCHAR,
                Types.VARCHAR,
                Types.VARCHAR,
                Types.VARCHAR,
                Types.VARCHAR,
                Types.INTEGER,
        };
        jdbcTemplate.update(sql, params, types);
    }

    public void deleteBarrage(int id,int i) {
        String sql="";
        if(i==0)
            sql = "DELETE FROM barrage_normal WHERE barrageId=?";
        else if(i==1)
            sql = "DELETE FROM tocheck_barrage WHERE barrageId=?";
        else if(i==2)
            sql = "DELETE FROM passed_barrage WHERE barrageId=?";
        else if(i==3)
            sql = "DELETE FROM unpassed_barrage WHERE barrageId=?";
        else
            ;
        jdbcTemplate.update(sql, id);
    }


    public ArrayList<Barrage> getAllBarrage(int i) {
        String sql="";
        if(i==0)
            sql = "SELECT * FROM barrage_normal";
        else if(i==1)
            sql = "SELECT * FROM tocheck_barrage";
        else if(i==2)
            sql = "SELECT * FROM passed_barrage";
        else if(i==3)
            sql = "SELECT * FROM unpassed_barrage";
        else
            ;
        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql);
        this.rs2Obj(rs);
        return barrageList;
    }

//    获取对应视频id的弹幕
    public ArrayList<Barrage> getBarrageByVideoId(int i,int videoId){
        String sql="";
        if(i==0)
            sql = "SELECT * FROM barrage_normal WHERE videoId=?";
        else if(i==1)
            sql = "SELECT * FROM tocheck_barrage WHERE videoId=?";
        else if(i==2)
            sql = "SELECT * FROM passed_barrage WHERE videoId=?";
        else if(i==3)
            sql = "SELECT * FROM unpassed_barrage WHERE videoId=?";
        else
            ;
        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql,videoId);
        this.rs2Obj(rs);
        return barrageList;
    }

    public int getMaxIdInBarrageNormal() {
        int k = 0;
        try {
            String sql = "SELECT * FROM barrage_normal";
            SqlRowSet rs = jdbcTemplate.queryForRowSet(sql);
            this.rs2Obj(rs);
            for (Barrage barrage : barrageList) {
                int temp = barrage.getBarrageId();
                if (k < temp) {
                    k = temp;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return k;
    }


    public ArrayList<Barrage> selectById(int id,int i) {
        String sql="";
        if(i==0)
            sql = "SELECT * FROM barrage_normal WHERE barrageId=?";
        else if(i==1)
            sql = "SELECT * FROM tocheck_barrage WHERE barrageId=?";
        else if(i==2)
            sql = "SELECT * FROM passed_barrage WHERE barrageId=?";
        else if(i==3)
            sql = "SELECT * FROM unpassed_barrage WHERE barrageId=?";
        else
            ;
        try {
            SqlRowSet rs = jdbcTemplate.queryForRowSet(sql,id);
            this.rs2Obj(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return barrageList;
    }
}
