<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminPage.aspx.cs" Inherits="FinalProject_Shelton.AdminPage" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Admin Page</title>
    <link rel="stylesheet" href="bootstrap.css" />
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
                      </tr>
                  </thead>

              <tbody>

        <%

            getActiveReservations();

            %>

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
             </tr>
    

          <%} %>

      </tbody>
  </table>
</div>   

</body>
</html>
