<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.util.Random"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
    <head>
        
        <spring:url value="/resources/css/main.css" var="mainCss" />
	<spring:url value="/resources/js/jquery.1.10.2.min.js" var="jqueryJs" />
	<spring:url value="/resources/js/main.js" var="mainJs" />

	<link href="${mainCss}" rel="stylesheet" />
        <script src="${jqueryJs}"></script>
        <script src="${mainJs}"></script>
        
        <title>Quiz Assignment</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            fieldset { border:1px solid orange }

            legend {
              padding: 0.2em 0.5em;
              border:1px solid green;
              color:green;
              font-size:90%;
              text-align:right;
              }
        </style>
    </head>
    <body>
                <h4 align="center" style="color:white; background-color: #709EDF">Multiple Choice Question</h4>
        <form action = "asonJSP.jsp" method = "post">                
            <fieldset>

        <%
            Connection conn = null;

                String question = "";
                String choiceA ="";
                String choiceB="";
                String choiceC="";
                String choiceD="";
                String choiceE="";
                String go_submit = request.getParameter("go_submit");
                boolean isCorrect = false;
                String answerKey="";
                int chapterNo=0;
                int questionNo=0;
                
                Random rand = new Random();
                int  n = rand.nextInt(5) + 1;
                
                int w = rand.nextInt(4) + 1;

                //put initialize JDBC code here
                Class.forName("com.mysql.jdbc.Driver");
                System.out.println("Loaded jdbc");

                conn = DriverManager.getConnection(
                        "jdbc:mysql://liang.armstrong.edu/ason", "ason", "tiger");

                System.out.println("Database connected");

                Statement stmt = conn.createStatement();

                String sql = "SELECT question from intro11equiz WHERE questionNo = '" + n + "' AND chapterNo = '" + w + "'";
                ResultSet rs = stmt.executeQuery(sql);

                while (rs.next()) {
                    question = rs.getString("question");
                    
                    System.out.println("From SELECT statement: question: " + question);
                }
                /////////////////////////////RETRIEVE ChapterNo////////////////////////////////////////////////
                String sqlchapterNo = "SELECT chapterNo from intro11equiz WHERE questionNo = '" + n + "' AND chapterNo = '" + w + "'";
                ResultSet rschapterNo = stmt.executeQuery(sqlchapterNo);
                while (rschapterNo.next()) {
                chapterNo = rschapterNo.getInt("chapterNo");
                    
                    System.out.println("From SELECT statement: choiceA " + choiceA);
                }
                /////////////////////////////RETRIEVE questionNo////////////////////////////////////////////////
                String sqlquestionNo = "SELECT questionNo from intro11equiz WHERE questionNo = '" + n + "' AND chapterNo = '" + w + "'";
                ResultSet rsquestionNo = stmt.executeQuery(sqlquestionNo);
                while (rsquestionNo.next()) {
                questionNo = rsquestionNo.getInt("questionNo");
                    
                    System.out.println("From SELECT statement: choiceA " + choiceA);
                }
                /////////////////////////////RETRIEVE CHOICE A////////////////////////////////////////////////
                String sqlChoiceA = "SELECT choiceA from intro11equiz WHERE questionNo = '" + n + "' AND chapterNo = '" + w + "'";
                ResultSet rsChoiceA = stmt.executeQuery(sqlChoiceA);
                while (rsChoiceA.next()) {
                    choiceA = rsChoiceA.getString("choiceA");
                    
                    System.out.println("From SELECT statement: choiceA " + choiceA);
                }
                ///////////////////////////////RETRIEVE CHOICE B///////////////////////////////////////////
                String sqlChoiceB = "SELECT choiceB from intro11equiz WHERE questionNo = '" + n + "' AND chapterNo = '" + w + "'";
                ResultSet rsChoiceB = stmt.executeQuery(sqlChoiceB);
                while (rsChoiceB.next()) {
                    choiceB = rsChoiceB.getString("choiceB");
                    
                    System.out.println("From SELECT statement: choiceB " + choiceB);
                }
                /////////////////////////RETRIEVE CHOICE C////////////////////////////////////////////////
                String sqlChoiceC = "SELECT choiceC from intro11equiz WHERE questionNo = '" + n + "' AND chapterNo = '" + w + "'";
                ResultSet rsChoiceC = stmt.executeQuery(sqlChoiceC);
                while (rsChoiceC.next()) {
                    choiceC = rsChoiceC.getString("choiceC");
                    
                    System.out.println("From SELECT statement: choiceC " + choiceC);
                }
                ///////////////////////RETRIEVE CHOICE D//////////////////////////////////////////////////
                String sqlChoiceD = "SELECT choiceD from intro11equiz WHERE questionNo = '" + n + "' AND chapterNo = '" + w + "'";
                ResultSet rsChoiceD = stmt.executeQuery(sqlChoiceD);
                while (rsChoiceD.next()) {
                    choiceD = rsChoiceD.getString("choiceD");
                    
                    System.out.println("From SELECT statement: choiceD " + choiceD);
                }
                ///////////////////////////RETRIEVE CHOICE E//////////////////////////////////////////////
                String sqlChoiceE = "SELECT choiceE from intro11equiz WHERE questionNo = '" + n + "' AND chapterNo = '" + w + "'";
                ResultSet rsChoiceE = stmt.executeQuery(sqlChoiceE);
                while (rsChoiceE.next()) {
                    choiceE = rsChoiceE.getString("choiceE");
                    
                    System.out.println("From SELECT statement: choiceE " + choiceE);
                }
                ////////////////////////RETRIEVE ANSWER KEY//////////////////////////////////////////////
                String sqlAnswer = "SELECT answerKey from intro11equiz WHERE questionNo = '" + n + "' AND chapterNo = '" + w + "'";
                ResultSet rsAnswer = stmt.executeQuery(sqlAnswer);
                while (rsAnswer.next()) {
                    answerKey = rsAnswer.getString("answerKey");
                }
                rs.close();
                

                %>
            <%=question%> 
            <%
                if(answerKey.length()==1){
                %>

            <br/>
            <input type="radio" name="contact" value="a">
            <label for="contactChoice1"><%=choiceA%></label>
            <br/>
            <input type="radio" name="contact" value="b">
            <label for="contactChoice2"><%=choiceB%></label>
            <br />
            <input type="radio" name="contact" value="c">
            <label for="contactChoice3"><%=choiceC%></label>
            <br/>
            <input type="radio" name="contact" value="d">
           <label for="contactChoice1"><%=choiceD%></label>
           <br/>
           <% 
               if (choiceE != null){
           %>
           <input type="radio" name="contact" value="e">
           <label for="contactChoice2"><%=choiceE%></label>
           <%
               }
            }
                else{
                %>
                <br/>
                <input type="checkbox" name="vehicle" value="a"><%=choiceA%><br>
                <input type="checkbox" name="vehicle" value="b" checked><%=choiceB%><br>
                <input type="checkbox" name="vehicle" value="c"><%=choiceC%><br>
                <input type="checkbox" name="vehicle" value="d"><%=choiceD%><br>
            <% 
                if (choiceE != null){
            %>
                    <input type="checkbox" name="vehicle" value="e"><%=choiceE%><br>
             <%   }
                }
           %>
           <p> 
                    <button type="submit" name="go_submit" value="View" style="background-color: #4CAF50">Check my Answer</button> 

                    <%
                    String choice = request.getParameter("contact");
                    String choice2 = request.getParameter("vehicle");
                    if (go_submit != null) {

                            if(answerKey.equals(choice) || answerKey.equals(choice2)) {
                                out.println("You're correct!");
                                isCorrect = true;
                            }
                            else{
                                out.println("Incorrect!");
                            }
                            
                            Class.forName("com.mysql.jdbc.Driver");
                            System.out.println("Loaded jdbc");
                            conn = DriverManager.getConnection(
                                    "jdbc:mysql://liang.armstrong.edu/ason", "ason", "tiger");

                            PreparedStatement pstmt = conn.prepareStatement("Insert into intro11e "
                                + "(chapterNo, questionNo, isCorrect, hostName, answerA, answerB, answerC"
                                    + ", answerD, answerE, username)"
                                + "values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?)");

                                pstmt.setInt(1, chapterNo);
                                pstmt.setInt(2, questionNo);
                                pstmt.setBoolean(3, isCorrect);
                                pstmt.setString(4, "liang.armstrong.edu");
                                if(choice.equals("a")){
                                    pstmt.setBoolean(5, true);
                                }
                                else{
                                    pstmt.setBoolean(5, false);
                                }
                               if(choice.equals("b")){
                                    pstmt.setInt(6, 1);
                                }
                                else{
                                    pstmt.setInt(6, 0);
                                }
                                if(choice.equals("c")){
                                    pstmt.setInt(7, 1);
                                }
                                else{
                                    pstmt.setInt(7, 0);
                                }
                                if(choice.equals("d")){
                                    pstmt.setInt(8, 1);
                                }
                                else{
                                    pstmt.setInt(8, 0);
                                }
                                if(choice.equals("e")){
                                    pstmt.setInt(9, 1);
                                }
                                else{
                                    pstmt.setInt(9, 0);
                                }
                                pstmt.setString(10, "ason");

                                pstmt.executeUpdate();

            }
                        %>
                </p>
            </fieldset>
              
             </form>
    </body>
</html>
