<%--
  Created by alekhya.
  Date: 10/2/16
  Time: 12:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Twitter Interface API 6 -  Returns a cursored collection of user IDs for every user following the specified user.</title>
    <h2>https://api.twitter.com/1.1/followers/ids.json</h2>
</head>
<body>
    <table>
        <%@page import="com.twitter.webservice.TwitterService"%>
        <%@ page import="java.util.List" %>
        <%
            String user_id = request.getParameter("rest6userid");
            String screen_name = request.getParameter("rest6screenname");
            String cursor = request.getParameter("rest6cursor");
            String stringify_ids = request.getParameter("rest6q1");
            String authToken = "OAuth oauth_consumer_key=\""+request.getParameter("oAuth_consumer_key")+"\","
                    + "              oauth_nonce=\""+request.getParameter("oAuth_nonce")+"\","
                    +"              oauth_signature=\""+request.getParameter("oAuth_Signature")+"\","
                    +"              oauth_signature_method=\""+request.getParameter("oAuth_Sinature_Method")+"\","
                    +"              oauth_token=\""+request.getParameter("oAuth_Token")+"\","
                    +"              oauth_version=\"1.0\"";
            StringBuffer params = new StringBuffer();
            if ( user_id !=  null && !user_id.isEmpty())
                params.append("?user_id="+user_id);
            if ( screen_name != null && !screen_name.isEmpty())
                params.append("?screen_name="+screen_name);
            if ( cursor != null && !cursor.isEmpty())
                params.append("?cursor="+cursor);
            if ( stringify_ids != null ) {
                boolean stringify_flag = false;
                if ( stringify_ids.equals("0"))
                    stringify_flag = true;
                params.append("?stringify_ids=" + Boolean.toString(stringify_flag));
            }
            String fullURL = "https://api.twitter.com/1.1/followers/ids.json"+params.toString();
            // TwitterService call to do GET request
            TwitterService service = new TwitterService();
            List<String> resp = service.getTwitterCore(fullURL,authToken);
        %>
        <tr>
            <h4> REST Request: <%= fullURL %> </h4>

        </tr>
        <tr>
            <h4> REST Status:  </h4>
            <%= resp.get(0) %>
        </tr>
        <tr>
            <h4> REST Response :  </h4>
            <%= resp.get(1) %>
        </tr>

    </table>

</body>
</html>
