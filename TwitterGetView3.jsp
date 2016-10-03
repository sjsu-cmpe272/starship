<%--
  Created by IntelliJ IDEA.
  Date: 10/2/16
  Time: 12:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Twitter Interface API 3 - Returns a collection of up to 100 user IDs belonging to users who have retweeted the tweet specified by the id parameter</title>
    <h2>https://api.twitter.com/1.1/statuses/retweeters/ids.json</h2>
</head>
<body>
    <table>
        <%@page import="com.twitter.webservice.TwitterService"%>
        <%@ page import="java.util.List" %>
        <%
            String id = request.getParameter("rest3id");
            String cursor = request.getParameter("rest3cursor");
            String stringify_ids = request.getParameter("rest3q1");
            String authToken = "OAuth oauth_consumer_key=\""+request.getParameter("oAuth_consumer_key")+"\","
                    + "              oauth_nonce=\""+request.getParameter("oAuth_nonce")+"\","
                    +"              oauth_signature=\""+request.getParameter("oAuth_Signature")+"\","
                    +"              oauth_signature_method=\""+request.getParameter("oAuth_Sinature_Method")+"\","
                    +"              oauth_token=\""+request.getParameter("oAuth_Token")+"\","
                    +"              oauth_version=\"1.0\"";
            StringBuffer params = new StringBuffer();
            if ( id !=  null && !id.isEmpty())
                params.append("?id="+id);
            if ( cursor != null && !cursor.isEmpty())
                params.append("?cursor="+cursor);
            if ( stringify_ids != null) {
                boolean flag = false;
                if ( stringify_ids.equals("0") )
                    flag = true;
                params.append("?stringify_ids=" + Boolean.toString(flag));
            }
            String fullURL = "https://api.twitter.com/1.1/statuses/retweeters/ids.json"+params.toString();
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
