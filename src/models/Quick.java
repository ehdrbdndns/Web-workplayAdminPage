package models;

public class Quick {
    public int no;
    public String img;
    public String url;
    public String text;

    public Quick(int no, String img, String url, String text) {
        this.no = no;
        this.img = img;
        this.url = url;
        this.text = text;
    }

    public Quick(int no, String img, String url) {
        this.no = no;
        this.img = img;
        this.url = url;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }
}
