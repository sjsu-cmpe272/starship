<%--
  Created by Mounika
  Date: 10/2/16
  Time: 12:06 AM
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Twitter Interface API 2 - Returns a single Tweet, specified by the id parameter</title>
    <h2>https://api.twitter.com/1.1/statuses/show.json</h2>
</head>
<body>
    <table>
        <%@page import="com.twitter.webservice.TwitterService"%>
        <%@ page import="java.util.List" %>
        <%
            String id = request.getParameter("rest2id");
            String trim_user = request.getParameter("rest2q1");
            String include_my_retweet = request.getParameter("rest2q2");
            String include_entities = request.getParameter("rest2q3");
            String authToken = "OAuth oauth_consumer_key=\""+request.getParameter("oAuth_consumer_key")+"\","
                    + "              oauth_nonce=\""+request.getParameter("oAuth_nonce")+"\","
                    +"              oauth_signature=\""+request.getParameter("oAuth_Signature")+"\","
                    +"              oauth_signature_method=\""+request.getParameter("oAuth_Sinature_Method")+"\","
                    +"              oauth_token=\""+request.getParameter("oAuth_Token")+"\","
                    +"              oauth_version=\"1.0\"";
            StringBuffer params = new StringBuffer();
            if ( id !=  null && !id.isEmpty())
                params.append("?id="+id);
            if ( trim_user != null) {
                boolean trim_user_flag = false;
                if ( trim_user.equals("0") )
                    trim_user_flag = true;
                params.append("?trim_user=" + Boolean.toString(trim_user_flag));
            }
            if ( include_my_retweet != null) {
                boolean retweet_flag = false;
                if ( include_my_retweet.equals("0") )
                    retweet_flag = true;
                params.append("?include_my_retweet=" + Boolean.toString(retweet_flag));
            }
            if ( include_entities != null) {
                boolean include_entities_flag = false;
                if ( include_entities.equals("0"))
                    include_entities_flag = true;
                params.append("?include_entities=" + Boolean.toString(include_entities_flag));
            }
            String fullURL = "https://api.twitter.com/1.1/statuses/show.json"+params.toString();
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
