#강동구 Project

#####project name : workplay

####project description : public homepage, responsible, jsp, html, css, js, bootstrap, jquery, poper.js, github

####project skill require
#####1. button click -> color change => animate.css
#####2. 3 count banner -> carousel control
#####3. admin db(arc) & admin page(ready)
#####3-1. remocon image & link
#####3-2. footer select name & link
#####3-3. notice(list), notice detail(content)
#####3-4. faq(answer & question)
#####3-5. facility(category add, category image)

    <context-param>
        <param-name>poolConfig</param-name>
        <param-value>
            jdbcdriver=com.mysql.jdbc.Driver
            jdbcUrl=jdbc:mysql://localhost:3306/workplay?characterEncoding=UTF-8
            dbUser=root
            dbPass=100400
            validationQuery=select 1
            minIdle=3
            maxTotal=60
            poolName=makers
        </param-value>
    </context-param>