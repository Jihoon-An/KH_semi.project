package dao;

public class PersonalRecordDAO extends Dao {

	    private PersonalRecordDAO() {
	    	super();
	    }

	    public static PersonalRecordDAO getInstance() {
	    	return(PersonalRecordDAO) Dao.getInstance();
	    }
}
