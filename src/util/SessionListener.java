package util;

import javax.servlet.http.HttpSessionEvent;
import javax.servlet.http.HttpSessionListener;
import java.util.ArrayList;
import java.util.List;

public class SessionListener implements HttpSessionListener {
    static private int activeSessions;
    static private List<HttpSessionEvent> sessions = new ArrayList<>();

    public static int getActiveSessions() {
        return activeSessions;
    }

    public static List<HttpSessionEvent> getSessions() {
        return sessions;
    }


    @Override
    public void sessionCreated(HttpSessionEvent arg0) {
        activeSessions++;
        sessions.add(arg0);
        System.out.println("Created!! activeSessions : " + activeSessions);
    }

    @Override
    public void sessionDestroyed(HttpSessionEvent session) {
        /*Session Counter*/
        activeSessions--;
        for (int i = 0; i < sessions.size(); i++) {
            if (sessions.get(i).getSession().getId() == session.getSession().getId()) {
                System.out.println("Destoryed!! activeSessions : " + activeSessions);
                sessions.remove(i);
                break;
            }
        }
        for (int i = 0; i < sessions.size(); i++) {
            System.out.println("session" + i + " : " + sessions.get(i).getSession().getId());
        }
        if(session.getSession().getAttribute("ADMIN") != null){
            session.getSession().removeAttribute("ADMIN");
        }
        /*Session Delete, exactly session attribute remove*/
        System.out.println("Session Create Time : " + session.getSession().getCreationTime());
        System.out.println("Ssssion Last Access : " + session.getSession().getLastAccessedTime());
        System.out.println("Session Max Live Time : " + session.getSession().getMaxInactiveInterval());
    }
}
