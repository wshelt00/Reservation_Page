<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ActiveReservation.aspx.cs" Inherits="FinalProject_Shelton.ActiveReservation" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <link rel="stylesheet" href="bootstrap.css" />

    <title>Active Reservations</title>

</head>
<body>

        <!--Display Navigation Bar -->
<nav class="navbar navbar-expand-lg bg-primary" data-bs-theme="dark">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">Navbar</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="ReservationForm.aspx">Home
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="ActiveReservation.aspx">Active Reservations</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="AdminPage.aspx">Admin</a>
        </li>
      </ul>
    </div>
  </div>
</nav>

    <h1>Active Reservations</h1>



    <%  string id = Request.QueryString["id"];
        string name = Request.QueryString["name"];
        string ci = "Check-In";
        string cnl = "Cancel";
        string p = "Paid";

    %>

    <% 
        if (name != null)
        {

            if (name.Equals("Cancel"))
            {

                updateCancelled(id);

            }
            else if (name.Equals("Check-In"))
            {

                updateCheck(id);

            }
            else if (name.Equals("Paid"))
            {

                updatePaid(id);

            }
        }

       %>

    <p>Reservation <%=id%> has been changed.</p>

    <%  
        getReservations(); %> 

          <div class="tablebox">
             <h4>All Active Reservations</h4>
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
                             <th scope="col">Cancel?</th> 
                             <th scope="CheckIn">Check-In</th> 
                             <th scope="Paid">Paid</th> 
                        </tr>
                    </thead>

                <tbody>

     <%

         for (int i = 0; i < resDS.Tables[0].Rows.Count; i++)
         {

             string resID = resDS.Tables[0].Rows[i]["Res_ID"].ToString();
             string memID = resDS.Tables[0].Rows[i]["Member_ID"].ToString();
             string resDate = resDS.Tables[0].Rows[i]["Res_Date"].ToString();
             string resTime = resDS.Tables[0].Rows[i]["Res_Time"].ToString();
             string resHC = resDS.Tables[0].Rows[i]["Res_HeadCount"].ToString();
             string resCom = resDS.Tables[0].Rows[i]["Res_Comments"].ToString();
             string resStat = resDS.Tables[0].Rows[i]["Res_Status"].ToString();

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
