package models;

public class Admin {
    public int no;
    public String id;
    public String pass;

    public Admin(int no, String id, String pass) {
        this.no = no;
        this.id = id;
        this.pass = pass;
    }

    public Admin(String id, String pass) {
        this.id = id;
        this.pass = pass;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getPass() {
        return pass;
    }

    public void setPass(String pass) {
        this.pass = pass;
    }
}
