package models;

public class Contact {
    private int no;
    private String name;
    private String email;
    private String phone;
    private String content;
    private String comment;
    private String date;
    private String comment_date;

    public Contact(int no, String name, String email, String phone, String content, String comment, String date, String comment_date) {
        this.no = no;
        this.name = name;
        this.email = email;
        this.phone = phone;
        this.content = content;
        this.comment = comment;
        this.date = date;
        this.comment_date = comment_date;
    }

    @Override
    public String toString() {
        return "Contact{" +
                "no=" + no +
                ", name='" + name + '\'' +
                ", email='" + email + '\'' +
                ", phone='" + phone + '\'' +
                ", content='" + content + '\'' +
                ", comment='" + comment + '\'' +
                ", date='" + date + '\'' +
                ", comment_date='" + comment_date + '\'' +
                '}';
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getComment_date() {
        return comment_date;
    }

    public void setComment_date(String comment_date) {
        this.comment_date = comment_date;
    }
}
