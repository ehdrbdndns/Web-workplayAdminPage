package models;

public class Facility {
    private int no;
    private int category_no;
    private String img;

    public Facility(int no, int category_no, String img) {
        this.no = no;
        this.category_no = category_no;
        this.img = img;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getCategory_no() {
        return category_no;
    }

    public void setCategory_no(int category_no) {
        this.category_no = category_no;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
