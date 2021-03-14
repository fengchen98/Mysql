package fc.jdbc.test;

import java.sql.*;

/**
 * @author ：fc
 * @date ：Created in 2021/3/5 15:55
 * @description：
 * @version: $
 */
public class Test {
    public static void main(String[] args) throws ClassNotFoundException, SQLException {
        //JDBC的第一步：创建连接
        // 加载JDBC驱动程序：反射，这样调用初始化com.mysql.jdbc.Driver类，即将该类加载到JVM方法
        //区，并执行该类的静态方法块、静态属性。
        Class.forName("com.mysql.jdbc.Driver");
        // 创建数据库连接
        Connection connection =
                DriverManager.getConnection("jdbc:mysql://localhost:3306/test?user=root&password=root&useUnicode=true&characterEncoding=UTF-8");
        //JDBC的第二步：创建操作命令
        Statement statement=connection.createStatement();
        //JDBC的第三步：执行sql语句
        String sql="select id,name,money from account";
        ResultSet resultSet=statement.executeQuery(sql);
        //JDBC的第四步：处理结果集
        while (resultSet.next()){
            int id=resultSet.getInt("id");
            String name=resultSet.getString("name");
            int money=resultSet.getInt("money");
            System.out.println(String.format("id=%d,name=%s,money=%d",id,name,money));
        }
        //JDBC的第五步：释放资源
        //关闭结果集
        if (resultSet != null) {
            try {
                resultSet.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        //关闭命令
        if (statement != null) {
            try {
                statement.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
        //关闭连接命令
        if (connection != null) {
            try {
                connection.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    }
}
