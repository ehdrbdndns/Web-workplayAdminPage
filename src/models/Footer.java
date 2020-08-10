package models;

public class Footer {
    public String blog_name;
    public String blog_url;
    public String youtube_name;
    public String youtube_url;
    public String Location;
    public String phone;
    public String email;
    public String FAX;

    public Footer(String blog_name, String blog_url, String youtube_name, String youtube_url, String location, String phone, String email, String FAX) {
        this.blog_name = blog_name;
        this.blog_url = blog_url;
        this.youtube_name = youtube_name;
        this.youtube_url = youtube_url;
        Location = location;
        this.phone = phone;
        this.email = email;
        this.FAX = FAX;
    }

    @Override
    public String toString() {
        return "Footer{" +
                "blog_name='" + blog_name + '\'' +
                ", blog_url='" + blog_url + '\'' +
                ", youtube_name='" + youtube_name + '\'' +
                ", youtube_url='" + youtube_url + '\'' +
                ", Location='" + Location + '\'' +
                ", phone='" + phone + '\'' +
                ", email='" + email + '\'' +
                ", FAX='" + FAX + '\'' +
                '}';
    }

    public String getLocation() {
        return Location;
    }

    public void setLocation(String location) {
        Location = location;
    }

    public String getBlog_name() {
        return blog_name;
    }

    public void setBlog_name(String blog_name) {
        this.blog_name = blog_name;
    }

    public String getBlog_url() {
        return blog_url;
    }

    public void setBlog_url(String blog_url) {
        this.blog_url = blog_url;
    }

    public String getYoutube_name() {
        return youtube_name;
    }

    public void setYoutube_name(String youtube_name) {
        this.youtube_name = youtube_name;
    }

    public String getYoutube_url() {
        return youtube_url;
    }

    public void setYoutube_url(String youtube_url) {
        this.youtube_url = youtube_url;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getFAX() {
        return FAX;
    }

    public void setFAX(String FAX) {
        this.FAX = FAX;
    }
}
