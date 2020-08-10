package models;

public class FaqMenu {
    private int no;
    private String menu;

    public FaqMenu(int no, String menu) {
        this.no = no;
        this.menu = menu;
    }

    public int getNo() {
        return no;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public String getMenu() {
        return menu;
    }

    public void setMenu(String menu) {
        this.menu = menu;
    }

    @Override
    public String toString() {
        return "FaqMenu{" +
                "no=" + no +
                ", menu='" + menu + '\'' +
                '}';
    }
}
