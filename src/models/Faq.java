package models;

public class Faq {
    private int no;
    private int no_c;
    private String title;
    private String content;
    private String date;
    private FaqMenu faqMenu;

    public Faq(int no, int no_c, String title, String content) {
        this.no = no;
        this.no_c = no_c;
        this.title = title;
        this.content = content;
    }
    public Faq(int no, int no_c, String title, String content, String date) {
        this.no = no;
        this.no_c = no_c;
        this.title = title;
        this.content = content;
        this.date = date;
    }

    public FaqMenu getFaqMenu() {
        return faqMenu;
    }

    public void setFaqMenu(FaqMenu faqMenu) {
        this.faqMenu = faqMenu;
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

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    @Override
    public String toString() {
        return "Faq{" +
                "no=" + no +
                ", no_c=" + no_c +
                ", title='" + title + '\'' +
                ", content='" + content + '\'' +
                ", date='" + date + '\'' +
                ", faqMenu=" + faqMenu +
                '}';
    }
}
