package models;

public class Fm_i {
    public int no;
    public int no_c;
    public String img;

    public Fm_i(int no, int no_c, String img) {
        this.no = no;
        this.no_c = no_c;
        this.img = img;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public int getNo_c() {
        return no_c;
    }

    public void setNo_c(int no_c) {
        this.no_c = no_c;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }
}
