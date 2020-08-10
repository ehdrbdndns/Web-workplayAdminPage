package models;

import java.util.Date;

public class Notice {
    private int no;
    private Date date;
    private String str_date;
    private int count;
    private String title;
    private String file1;
    private String file2;
    private String file3;
    private String file4;
    private String img1;
    private String img2;
    private String img3;
    private String img4;
    private String img5;
    private String img6;
    private String content1;
    private String content2;
    private String content3;
    private String content4;
    private String content5;
    private String content6;

    public Notice(int no, Date date, String str_date, int count, String title, String file1, String file2, String file3, String file4, String img1, String img2, String img3, String img4, String img5, String img6, String content1, String content2, String content3, String content4, String content5, String content6) {
        this.no = no;
        this.date = date;
        this.str_date = str_date;
        this.count = count;
        this.title = title;
        this.file1 = file1;
        this.file2 = file2;
        this.file3 = file3;
        this.file4 = file4;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
        this.img4 = img4;
        this.img5 = img5;
        this.img6 = img6;
        this.content1 = content1;
        this.content2 = content2;
        this.content3 = content3;
        this.content4 = content4;
        this.content5 = content5;
        this.content6 = content6;
    }

    public Notice(int no, Date date, String title, String file1, String file2, String file3, String file4, String img1, String img2, String img3, String img4, String img5, String img6, String content1, String content2, String content3, String content4, String content5, String content6) {
        this.no = no;
        this.date = date;
        this.title = title;
        this.file1 = file1;
        this.file2 = file2;
        this.file3 = file3;
        this.file4 = file4;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
        this.img4 = img4;
        this.img5 = img5;
        this.img6 = img6;
        this.content1 = content1;
        this.content2 = content2;
        this.content3 = content3;
        this.content4 = content4;
        this.content5 = content5;
        this.content6 = content6;
    }
    public Notice(int no, String date, String title, String file1, String file2, String file3, String file4, String img1, String img2, String img3, String img4, String img5, String img6, String content1, String content2, String content3, String content4, String content5, String content6,int count) {
        this.no = no;
        this.str_date = date;
        this.title = title;
        this.file1 = file1;
        this.file2 = file2;
        this.file3 = file3;
        this.file4 = file4;
        this.img1 = img1;
        this.img2 = img2;
        this.img3 = img3;
        this.img4 = img4;
        this.img5 = img5;
        this.img6 = img6;
        this.content1 = content1;
        this.content2 = content2;
        this.content3 = content3;
        this.content4 = content4;
        this.content5 = content5;
        this.content6 = content6;
        this.count = count;
    }
    public Notice(int no, String date, String title, String content) {
        this.no = no;
        this.str_date = date;
        this.title = title;
        this.content1 = content;
    }

    public String getFiles(int i){
        if(i == 1)
            return file1;
        else if(i == 2)
            return file2;
        else if(i == 3)
            return file3;
        else if(i == 4)
            return file4;
        else
            return null;
    }

    public String getImgs(int i){
        if(i == 1)
            return img1;
        else if(i == 2)
            return img2;
        else if(i == 3)
            return img3;
        else if(i == 4)
            return img4;
        else if(i == 5)
            return img5;
        else if(i == 6)
            return img6;
        else
            return null;
    }

    public String getContents(int i){
        if(i == 1)
            return content1;
        else if(i == 2)
            return content2;
        else if(i == 3)
            return content3;
        else if(i == 4)
            return content4;
        else if(i == 5)
            return content5;
        else if(i == 6)
            return content6;
        else
            return null;
    }

    public int getNo() {
        return no;
    }

    public int getCount() {
        return count;
    }

    public void setCount(int count) {
        this.count = count;
    }

    public void setNo(int no) {
        this.no = no;
    }

    public Date getDate() {
        return date;
    }

    public void setDate(Date date) {
        this.date = date;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getFile1() {
        return file1;
    }

    public void setFile1(String file1) {
        this.file1 = file1;
    }

    public String getFile2() {
        return file2;
    }

    public void setFile2(String file2) {
        this.file2 = file2;
    }

    public String getFile3() {
        return file3;
    }

    public void setFile3(String file3) {
        this.file3 = file3;
    }

    public String getFile4() {
        return file4;
    }

    public void setFile4(String file4) {
        this.file4 = file4;
    }

    public String getImg1() {
        return img1;
    }

    public void setImg1(String img1) {
        this.img1 = img1;
    }

    public String getImg2() {
        return img2;
    }

    public void setImg2(String img2) {
        this.img2 = img2;
    }

    public String getImg3() {
        return img3;
    }

    public void setImg3(String img3) {
        this.img3 = img3;
    }

    public String getImg4() {
        return img4;
    }

    public void setImg4(String img4) {
        this.img4 = img4;
    }

    public String getImg5() {
        return img5;
    }

    public void setImg5(String img5) {
        this.img5 = img5;
    }

    public String getImg6() {
        return img6;
    }

    public void setImg6(String img6) {
        this.img6 = img6;
    }

    public String getContent1() {
        return content1;
    }

    public void setContent1(String content1) {
        this.content1 = content1;
    }

    public String getContent2() {
        return content2;
    }

    public void setContent2(String content2) {
        this.content2 = content2;
    }

    public String getContent3() {
        return content3;
    }

    public void setContent3(String content3) {
        this.content3 = content3;
    }

    public String getContent4() {
        return content4;
    }

    public void setContent4(String content4) {
        this.content4 = content4;
    }

    public String getContent5() {
        return content5;
    }

    public void setContent5(String content5) {
        this.content5 = content5;
    }

    public String getContent6() {
        return content6;
    }

    public void setContent6(String content6) {
        this.content6 = content6;
    }

    public String getStr_date() {
        return str_date;
    }

    public void setStr_date(String str_date) {
        this.str_date = str_date;
    }

    @Override
    public String toString() {
        return "Notice{" +
                "no=" + no +
                ", date=" + date +
                ", str_date='" + str_date + '\'' +
                ", count=" + count +
                ", title='" + title + '\'' +
                ", file1='" + file1 + '\'' +
                ", file2='" + file2 + '\'' +
                ", file3='" + file3 + '\'' +
                ", file4='" + file4 + '\'' +
                ", img1='" + img1 + '\'' +
                ", img2='" + img2 + '\'' +
                ", img3='" + img3 + '\'' +
                ", img4='" + img4 + '\'' +
                ", img5='" + img5 + '\'' +
                ", img6='" + img6 + '\'' +
                ", content1='" + content1 + '\'' +
                ", content2='" + content2 + '\'' +
                ", content3='" + content3 + '\'' +
                ", content4='" + content4 + '\'' +
                ", content5='" + content5 + '\'' +
                ", content6='" + content6 + '\'' +
                '}';
    }
}
