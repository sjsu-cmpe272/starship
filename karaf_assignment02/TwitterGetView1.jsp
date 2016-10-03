<%--
  Created by:mounika
  Version:2
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Twitter Interface API 1 - Returns up to 100 of the first retweets of a given tweet </title>
    <h2>https://api.twitter.com/1.1/statuses/retweets/:id.json</h2>
</head>
<body>
    <table>
        <%@page import="com.twitter.webservice.TwitterService"%>
        <%@ page import="java.util.List" %>
        <%
            String id = request.getParameter("rest1id");
            String count = request.getParameter("rest1count");
            String trim_user = request.getParameter("rest1q1");
            String authToken = "OAuth oauth_consumer_key=\""+request.getParameter("oAuth_consumer_key")+"\","
                    + "              oauth_nonce=\""+request.getParameter("oAuth_nonce")+"\","
                    +"              oauth_signature=\""+request.getParameter("oAuth_Signature")+"\","
                    +"              oauth_signature_method=\""+request.getParameter("oAuth_Sinature_Method")+"\","
                    +"              oauth_token=\""+request.getParameter("oAuth_Token")+"\","
                    +"              oauth_version=\"1.0\"";
            StringBuffer params = new StringBuffer();
            if ( count != null && !count.isEmpty())
                params.append("?count="+count);
            if ( trim_user != null ) {
                boolean trim_user_flag = false;
                if ( trim_user.equals("0") )
                    trim_user_flag = true;
                params.append("?trim_user=" + Boolean.toString(trim_user_flag));
            }
            String fullURL = "https://api.twitter.com/1.1/statuses/retweets/"+id+".json"+params.toString();
            // TwitterService call to do GET request
            TwitterService service = new TwitterService();
            List<String> resp = service.getTwitterCore(fullURL, authToken);
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
