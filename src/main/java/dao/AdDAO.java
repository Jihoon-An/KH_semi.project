package dao;

public class AdDAO extends Dao{

    private AdDAO() {
        super();
    }

    public static AdDAO getInstance(){
        return (AdDAO) Dao.getInstance();
    }

    
}
