<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ConfirmForm.aspx.cs" Inherits="FinalProject_Shelton.ConfirmFrom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link rel="stylesheet" href="bootstrap.css" />

</head>
<body>

    <h1>Reservation Made</h1>

    <%
        
        string name = Request.Form["name"];
        string mid = Request.Form["mem"];
        string date = Request.Form["Date_Cal"];
        string time = Request.Form["time"];
        string hc = Request.Form["hc"];
        string com = Request.Form["com"];

        string ci = "Check-In";
        string cnl = "Cancel";
        string p = "Paid";

        string ID = mid.Substring(0, 1);

        %>

        <%
            if (!IsPostBack)
            { %>
                <div class ="center">
                    <div class="card text-white bg-success mb-3" style="max-width: 20rem;">
                        <div class="card-header">Reservation Pending:</div>
                            <div class="card-body">
                                <h4 class="card-title">Reservation Received</h4>
                                    <p class="card-text">Thank you for making a reservation with us. Your reservation is being processed. <br />

                                        Name: <%=name %><br />
                                        ID: <%=ID %><br />
                                        Date: <%=date %><br />
                                        Time: <%=time %><br />
                                        HeadCount: <%=hc %><br />
                                        Comments: <%=com %><br />

                                    </p>
                                </div>
                            </div>
                        </div>
        <%

            }

        %>
                
        <%
            if(!IsPostBack)
            {
                 insertRes(ID, date, time, hc, com); 
            }
            %>

    <br />
    <br />

       <%  
           getActiveReservations(); %> 

    <div class="tablebox">
    <h4>All Reservations</h4>
    <table class="table table-hover"> 
  <thead>
    <tr>
      <th scope="col">ResID</th>
      <th scope="col">MemberID</th>
      <th scope="col">ResDate</th>
      <th scope="col">ResTime</th>
      <th scope="col">HeadCount</th>
      <th scope="col">Comments</th>
      <th scope="col">Status</th>
      <th scope="col">Cancel</th> 
     <th scope="CheckIn">Check-In</th> 
     <th scope="Paid">Paid</th> 
    </tr>
  </thead>

   <tbody>

       <%

           for (int i = 0; i < aresDS.Tables[0].Rows.Count; i++) 
           {

               string resID = aresDS.Tables[0].Rows[i]["Res_ID"].ToString();
               string memID = aresDS.Tables[0].Rows[i]["Member_ID"].ToString();
               string resDate = aresDS.Tables[0].Rows[i]["Res_Date"].ToString();
               string resTime = aresDS.Tables[0].Rows[i]["Res_Time"].ToString();
               string resHC = aresDS.Tables[0].Rows[i]["Res_HeadCount"].ToString();
               string resCom = aresDS.Tables[0].Rows[i]["Res_Comments"].ToString();
               string resStat = aresDS.Tables[0].Rows[i]["Res_Status"].ToString();

           %>

       <tr class="table-primary">
       <td><%=resID %></td>
       <td><%=memID %></td>
       <td><%=resDate %></td>
       <td><%=resTime %></td>
       <td><%=resHC %></td>
       <td><%=resCom %></td>
       <td><%=resStat %></td>
       <td><a href="ActiveReservation.aspx?id=<%=resID %>&name=<%=cnl %>" >Cancel</a></td>
       <td><a href="ActiveReservation.aspx?id=<%=resID %>&name=<%=ci %> " >Check-In</a></td>
       <td><a href="ActiveReservation.aspx?id=<%=resID %>&name=<%=p %> ">Paid</a></td>
       </tr>
        

       <%} %>

   </tbody>
   </table>
    </div>

</body>
</html>
