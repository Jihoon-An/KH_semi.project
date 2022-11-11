package dto;

import java.sql.ResultSet;

public class FavoritesDTO {
    private int fav_seq;
    private int user_seq;
    private int gym_seq;
    private int count;

    public int getFav_seq() {
        return fav_seq;
    }

    public void setFav_seq(int fav_seq) {
        this.fav_seq = fav_seq;
    }

    public int getUser_seq() {
        return user_seq;
    }

    public void setUser_seq(int user_seq) {
        this.user_seq = user_seq;
    }

    public int getGym_seq() {
        return gym_seq;
    }

    public void setGym_seq(int gym_seq) {
        this.gym_seq = gym_seq;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public FavoritesDTO(int fav_seq, int user_seq, int gym_seq) {
        this.fav_seq = fav_seq;
        this.user_seq = user_seq;
        this.gym_seq = gym_seq;
    }

	public FavoritesDTO() {
	}

	public FavoritesDTO(ResultSet resultSet) throws Exception{
		this.fav_seq = resultSet.getInt("fav_seq");
		this.user_seq = resultSet.getInt("user_seq");
		this.gym_seq = resultSet.getInt("gym_seq");
	}
}
