package operations;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DbConnection {

    //private static Connection connexion = null;

    //-----------------------------------------Postgresql----------------------------------------------------------------------------

    /***
     * Load Driver and connect to the data base
     * @return objet connection
     */
    protected static Connection loadDataBase(){
        Connection connexion = null;
        try {
            Class.forName("org.postgresql.Driver");
        } catch (ClassNotFoundException e) {
        }

        try {
            connexion = DriverManager.getConnection("jdbc:postgresql://localhost:5432/myowndb",
                    "postgres", "postgres");
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connexion;
    }
}
