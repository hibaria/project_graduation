package com.dao;

import com.javabean.Video;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;

import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class VideoDao {

    private JdbcTemplate jdbcTemplate;
    private ArrayList<Video> videoList = new ArrayList<Video>();

    public void setJdbcTemplate(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    public void rs2Obj(SqlRowSet rs) {
        while (rs.next()) {
            Video video = new Video();
            video.setId(rs.getInt(1));
            video.setTitle(rs.getString(2));
            video.setIntro(rs.getString(3));
            video.setVideoUrl(rs.getString(4));
            video.setCoverUrl(rs.getString(5));
            video.setMaskVideo(rs.getString(6));
            videoList.add(video);
        }
    }

    /**
     * 添加视频
     */
    public void addVideo(Video video) {
        String sql = "";
            sql = "insert into videolist(id,title,intro,videourl,coverurl,maskvideo) values(?,?,?,?,?,?)";
        Object[] params = new Object[]{
                video.getId(),
                video.getTitle(),
                video.getIntro(),
                video.getVideoUrl(),
                video.getCoverUrl(),
                video.getMaskVideo()
        };
        int types[] = new int[]{
                Types.INTEGER,
                Types.VARCHAR,
                Types.VARCHAR,
                Types.VARCHAR,
                Types.VARCHAR,
                Types.VARCHAR
        };
        jdbcTemplate.update(sql, params, types);
    }

//    删除视频
    public void deleteVideo(int id) {
        String sql = "DELETE FROM videolist WHERE id=?";
        jdbcTemplate.update(sql, id);
    }

//获取所有视频
    public ArrayList<Video> getAllVideo() {
        String sql= "SELECT * FROM videolist";
        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql);
        this.rs2Obj(rs);
        return videoList;
    }


    public int getMaxIdInVideoList() {
        int k = 0;
        try {
            String sql = "SELECT * FROM videolist";
            SqlRowSet rs = jdbcTemplate.queryForRowSet(sql);
            this.rs2Obj(rs);
            for (Video video : videoList) {
                int temp = video.getId();
                if (k < temp) {
                    k = temp;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return k;
    }

//    通过Id查询视频列表
    public ArrayList<Video> selectById(int id) {
        String sql= "SELECT * FROM videolist WHERE id=?";
        try {
            SqlRowSet rs = jdbcTemplate.queryForRowSet(sql,id);
            this.rs2Obj(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return videoList;
    }

//    通过id获取视频名
    public String getVideoTitleById(int id){
        String sql= "SELECT * FROM videolist WHERE id=?";
        String title="";
        try {
            SqlRowSet rs = jdbcTemplate.queryForRowSet(sql,id);
            this.rs2Obj(rs);
        } catch (Exception e) {
            e.printStackTrace();
        }
        for (Video video : videoList) {
             title = video.getTitle();
            }
        return title;
    }



//    对于表videoplaying的操作
    public void addPlayingVideo(Video video) {
        String sql = "insert into videoplaying(id,title,intro,videourl,coverurl,maskvideo) values(?,?,?,?,?,?)";
        Object[] params = new Object[]{
                video.getId(),
                video.getTitle(),
                video.getIntro(),
                video.getVideoUrl(),
                video.getCoverUrl(),
                video.getMaskVideo()
        };
        int types[] = new int[]{
                Types.INTEGER,
                Types.VARCHAR,
                Types.VARCHAR,
                Types.VARCHAR,
                Types.VARCHAR,
                Types.VARCHAR
        };
        jdbcTemplate.update(sql, params, types);
    }

    //    删除视频
    public void deletePlayingVideo() {
        String sql = "delete from videoplaying";
        jdbcTemplate.update(sql);
    }

//    查找正在播放的视频
    public Video getPlayingVideo() {
        String sql= "SELECT * FROM videoplaying";
        SqlRowSet rs = jdbcTemplate.queryForRowSet(sql);
        this.rs2Obj(rs);
        return videoList.get(0);
    }

}
