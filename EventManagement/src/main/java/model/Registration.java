package model;

import java.sql.*;
import java.util.ArrayList;
import jakarta.servlet.http.HttpSession;
import model.Events;
import model.EventsData;
public class Registration {
    private Connection con;
    HttpSession se;

    public Registration(HttpSession session){
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // load the drivers
            con = DriverManager.getConnection("jdbc:mysql://127.0.0.1:3306/?user=root&password=admin@123");
            
            // connection with data base
            se = session;
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public String Registration(String name, String phone, String email, String pw) {
        PreparedStatement ps;

        String status = "";
        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            rs = st.executeQuery("select * from EventManagement.registration where phone='" + phone + "' or email='" + email + "';");
            boolean b = rs.next();
            if (b) {
                status = "existed";
            } else {
                ps = (PreparedStatement) con.prepareStatement("insert into EventManagement.registration values(0,?,?,?,?,now())");
                ps.setString(1, name);
                ps.setString(2, phone);
                ps.setString(3, email);
                ps.setString(4, pw);
                int a = ps.executeUpdate();
                if (a > 0) {
                    status = "success";
                } else {
                    status = "failure";
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }

    public String login(String email, String pass) {
    
        String status1 = "", id = "";
        String name = "", emails = "",phone="";

        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            
            rs = st.executeQuery("select * from EventManagement.registration where email='" + email + "' and password='" + pass + "';");
            boolean b = rs.next();
            if (b == true) {
                
                id = rs.getString("id");
                name = rs.getString("name");
                emails = rs.getString("email");
                phone = rs.getNString("phone");
                se.setAttribute("uname", name);
                se.setAttribute("email", emails);
                se.setAttribute("phone", phone);
                se.setAttribute("id", id);
                
                status1 = "success";
            } else {
                status1 = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status1;
    }

    public User getInfo() {
        Statement st = null;
        ResultSet rs = null;
        User s = null;
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from EventManagement.registration where id= '" + se.getAttribute("id") + "'");
            boolean b = rs.next();
            if (b == true) {
                s = new User();
                s.setName(rs.getString("name"));
                s.setphone(rs.getString("phone"));
                s.setemail(rs.getString("email"));
            } else {
                s = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }

    public String update(String name, String pno, String email) {
        String status = "";
        Statement st = null;
        ResultSet rs = null;
        try {
            st = con.createStatement();
            st.executeUpdate("update EventManagement.registration set name='" + name + "',phone='" + pno + "',email='" + email
                    + "' where id= '" + se.getAttribute("id") + "' ");
            se.setAttribute("uname", name);
            status = "success";
        } catch (Exception e) {
            status = "failure";
            e.printStackTrace();
        }

        return status;
    }

    public ArrayList<User> getUserinfo(String id) {
        Statement st = null;
        ResultSet rs = null;
        ArrayList<User> al = new ArrayList<User>();
        try {
            st = con.createStatement();
            String qry = "select * from EventManagement.registration where id = '" + id + "';";
            rs = st.executeQuery(qry);
            while (rs.next()) {
                User p = new User();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setemail(rs.getString("email"));
                p.setphone(rs.getString("phone"));
                p.setdate(rs.getString("reg_date"));
                al.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }

    public ArrayList<User> getUserDetails() {
        Statement st;
        ResultSet rs;
        ArrayList<User> al = new ArrayList<User>();
        try {
            st = con.createStatement();
            String qry = "select *,date_format(reg_date,'%b %d, %Y') as date1 from EventManagement.registration where id not in(1);";
            rs = st.executeQuery(qry);
            while (rs.next()) {
                User p = new User();
                p.setId(rs.getString("id"));
                p.setName(rs.getString("name"));
                p.setemail(rs.getString("email"));
                p.setphone(rs.getString("phone"));
                p.setdate(rs.getString("date1"));
                al.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }
    
//    public ArrayList<ProductData> get_eventinfo(String event_category) {
//        
//        Statement st;
//        ResultSet rs;
//        ArrayList<ProductData> al = new ArrayList<ProductData>();
//        try {
//            
//            st = con.createStatement();
//            String qry = " select * from EventManagement.EventsData where event_category='" + event_category + " ';";
//            
//            System.out.println(event_category);
//            
//            rs = st.executeQuery(qry);
//            
//            
//            if (rs.next()) {
//                System.out.println(" 🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊 ");
//                ProductData d = new ProductData();
//                d.setId(rs.getString("id")); // 1..r---db 2.. pass the data or value to Dproduct class set method
//                d.setImg(rs.getString("img"));
//                d.setName(rs.getString("name"));
//                d.setPrice(rs.getString("price"));
//                d.setDetails(rs.getString("details"));
//                al.add(d);
//                
//            }
//            else{
//            System.out.println(" 😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈😈 ");
//            }
//
//        } catch (Exception e) {
//            e.printStackTrace();
//        }
//
//        return al;
//
//    }
    public ArrayList<EventsData> get_eventinfo(String event_category) {
    Statement st;
    ResultSet rs;
    ArrayList<EventsData> al = new ArrayList<EventsData>();
    
    try {
        st = con.createStatement();
        String qry = "SELECT * FROM EventManagement.EventsData WHERE event_category='" + event_category + "'";
        System.out.println("Query: " + qry); // Print the query for debugging
        
        rs = st.executeQuery(qry);
        
        while (rs.next()) {
            System.out.println(" 🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊🎊 ");
            EventsData d = new EventsData();
            d.setId(rs.getString("id"));
            d.setImg1(rs.getString("img1"));
            d.setImg2(rs.getString("img2"));
            d.setImg3(rs.getString("img3"));
            d.setName(rs.getString("name"));
            d.setPrice(rs.getString("price"));
            d.setDetails(rs.getString("details"));
            System.out.println(d.getImg1());
            al.add(d);
        }
        
        if (al.isEmpty()) {
            System.out.println("No data found"); // Print a message if no data is found
        }
    } catch (Exception e) {
        e.printStackTrace();
    }
    
    return al;
}

    public EventsData getEventFormInfo(String event_id) {
        Statement st = null;
        ResultSet rs = null;
        EventsData s = null;
        try {
            st = con.createStatement();
            rs = st.executeQuery("select * from EventManagement.EventsData where id= '" + event_id + "'");
            boolean b = rs.next();
            if (b == true) {
                s = new EventsData();
                s.setName(rs.getString("name"));
                s.setPrice(rs.getString("price"));
            } else {
                s = null;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return s;
    }

    /*
     * public String delete(int id) {
     * String status = "";
     * try {
     * PreparedStatement ps =
     * con.prepareStatement("DELETE FROM institute.data WHERE id = ?");
     * ps.setInt(1, id);
     * int result = ps.executeUpdate();
     * 
     * if (result > 0) {
     * status = "success";
     * } else {
     * status = "failure";
     * }
     * } catch (Exception e) {
     * status = "failure";
     * e.printStackTrace();
     * }
     * return status;
     * }
     */

    public String delete(int id) {
        int count = 0;
        Statement st = null;
        String status = "";
        try {
            st = con.createStatement();
            count = st.executeUpdate("delete from EventManagement.registration where " + "id='" + id + "'");
            if (count > 0) {
                status = "success";
            } else {
                status = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    
    /* Delete Booking by admin */
    public String deleteBooking(int id) {
        int count = 0;
        Statement st = null;
        String status = "";
        try {
            st = con.createStatement();
            count = st.executeUpdate("delete from EventManagement.Booking where " + "id='" + id + "'");
            if (count > 0) {
                status = "success";
            } else {
                status = "failure";
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return status;
    }
    
    /* .................  */
    
    //Event completed..
    
    public String eventDone(int id) {
    String status = "";
    try {
        Statement st = con.createStatement();
        // Executing the INSERT INTO ... SELECT query to move data from Booking to EventCompleted
        int rowsAffected = st.executeUpdate("INSERT INTO EventManagement.EventCompleted (eventID, mail, event, eventdate, eventtime, address, atendees) " +
                                            "SELECT id, email, event, event_date, time, address, atendees " +
                                            "FROM EventManagement.Booking " +
                                            "WHERE id = " + id);
        int del = st.executeUpdate("DELETE FROM  EventManagement.Booking WHERE id="+id);
        
        
        if ((rowsAffected  > 0) && (del>0)){
            status = "success";
        }
        else{
            status = "failure";
        }
    } catch (Exception e) {
        e.printStackTrace();
        status = "error";
    }
    return status;
}

    
    /*...................*/

    public String ForgotPassword(String mail, String pw) {
        String status = "";
        try {
            Statement st = con.createStatement();
            int rspw = st.executeUpdate("update EventManagement.registration  set Password='" + pw + "' where Email='" + mail + "';");
            if (rspw > 0)
                status = "success";
            else
                status = "failure";
        } catch (Exception e) {
            e.printStackTrace();
        }
        return status;
    }
    public String book(String email ,String edate, String event,String time , String address,String atendee) {
        String status = "";
        PreparedStatement ps;         
        try {
            Statement st = null;
            ResultSet rs = null;
            st = con.createStatement();
            System.out.println("--------------");
            System.out.println();
            System.out.println(email);
            System.out.println();
            System.out.println("--------------");
           // ps = (PreparedStatement) con.prepareStatement("insert into EventManagement.Booking values("+se.getAttribute("id")+""+email+""+  edate+""+event+""+time+""+atendee+")");
           
            // Assuming se, email, edate, event, time, atendee are properly defined variables

// Create the PreparedStatement object
 ps = con.prepareStatement("INSERT INTO EventManagement.Booking VALUES (0,?, ?, ?, ?,?,?)");
            System.out.println("Hello");
// Assuming "id" is the first column, "email" the second, "edate" the third, "event" the fourth, "time" the fifth, and "atendee" the sixth column in the "Booking" table

// Set values for each placeholder
//ps.setString(1, (String) se.getAttribute("id"));
ps.setString(1, email);
ps.setString(2, event);
ps.setString(3, edate);
ps.setString(4, time); 
ps.setString(5, address);
ps.setString(6, atendee);

            int a = ps.executeUpdate();
            System.out.println("--------------");
            System.out.println();
            System.out.println(time);
            System.out.println();
            System.out.println("--------------");
            se.setAttribute("email", email);
            if(a>0){
            status = "success";
            }
        } catch (Exception e) {
            status = "failure";
            e.printStackTrace();
        }

        return status;
    }
    
    /* Booking details..*/
    /* Admin's*/
    public ArrayList<Events> getBookingDetails() {
        Statement st;
        ResultSet rs;
        ArrayList<Events> al = new ArrayList<Events>();
        try {
            st = con.createStatement();
            String qry = "select *,date_format(event_date,'%b %d, %Y') as date1 from EventManagement.Booking where email not in(1);";
            rs = st.executeQuery(qry);
            while (rs.next()) {
                Events p = new Events();
                p.setId(rs.getString("id"));
                p.setEmail(rs.getString("email"));
                p.setTime(rs.getString("time"));
                p.setEvent(rs.getString("event"));
                p.setCount(rs.getString("atendees"));
                p.setDate(rs.getString("date1"));
                al.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }
    
     public ArrayList<Events> getBookingHistoryDetails() {
        Statement st;
        ResultSet rs;
        ArrayList<Events> al = new ArrayList<Events>();
        try {
            st = con.createStatement();
            String qry = "select *,date_format(eventdate,'%b %d, %Y') as date1 from EventManagement.EventCompleted;";
            rs = st.executeQuery(qry);
            while (rs.next()) {
                Events p = new Events();
                p.setId(rs.getString("id"));
                p.setEmail(rs.getString("mail"));
                p.setTime(rs.getString("eventtime"));
                p.setEvent(rs.getString("event"));
                p.setCount(rs.getString("atendees"));
                p.setPlace(rs.getString("address"));
                p.setDate(rs.getString("date1"));
                al.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }
    
    /* Users Booking details: */
    
    public ArrayList<Events> getUserBookingDetails(String email) {
        Statement st;
        ResultSet rs;
        ArrayList<Events> al = new ArrayList<Events>();
        try {
            st = con.createStatement();
            String qry = "SELECT *, DATE_FORMAT(event_date, '%b %d, %Y') AS date1 FROM EventManagement.Booking WHERE email = ?";
PreparedStatement pstmt = con.prepareStatement(qry);
pstmt.setString(1,email );
             rs = pstmt.executeQuery();
            while (rs.next()) {
                Events p = new Events();
                p.setId(rs.getString("id"));
                p.setEmail(rs.getString("email"));
                p.setTime(rs.getString("time"));
                p.setEvent(rs.getString("event"));
                p.setCount(rs.getString("atendees"));
                p.setDate(rs.getString("date1"));
                al.add(p);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return al;
    }
    

}