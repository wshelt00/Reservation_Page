<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ReservationForm.aspx.cs" Inherits="FinalProject_Shelton.ReservationFrom" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">

    <title>Make A Reservation</title>
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

    <h1>Reservations</h1>

    <form id="form1" method="post" runat="server" action="ConfirmForm.aspx" target="_self">

      <div class ="form-group">

        <div class ="row">

        <div class ="column">
            <div class="card border-primary mb-3" style="max-width: 20rem;">
                <div class="card-header">Last Name:</div>
                    <div class="card-body">
                        <label for ="name">Name: </label>
                        <input type ="text" id ="name" name ="name"/>
                    </div>
                </div>
            </div>
        
        <div class ="column">
         <div class="card border-success mb-3" style="max-width: 20rem;">
            <div class="card-header">Number of People Attending:</div>
                <div class="card-body">
                    <label for="hc">Select Number of Individuals:</label>
                                 <select class="btn btn-success" id="hc" name="hc">
                                       <option value="1">1</option>
                                       <option value="2">2</option>
                                       <option value="3">3</option>
                                       <option value="4">4</option>
                                       <option value="5">5</option>
                                       <option value="6">6</option>
                                       <option value="7">7</option>
                                       <option value="8">8</option>
                                       <option value="9">9</option>
                                       <option value="10">10</option>
                                    </select>
             </div>
          </div>
        </div>

      <div class ="column">
        <div class="card border-info mb-3" style="max-width: 20rem;">
            <div class="card-header">Set the Date:</div>
               <div class="card-body">
                 <label for = "Date_Cal">Select Date: </label>
                 <input type ="date" id ="Date_Cal" name="Date_Cal"/>
               </div>
            </div>
          </div>

       <div class ="column">
        <div class="card border-warning mb-3" style="max-width: 20rem;">
             <div class="card-header">Choose the Time:</div>
                 <div class="card-body">
                 <label for="time">Select a Time:</label>
                        <select class="btn btn-success" id="time" name="time">
                              <option value="10:00 AM">10:00 AM</option>
                              <option value="11:00 AM">11:00 AM</option>
                              <option value="12:00 PM">12:00 PM</option>
                              <option value="1:00 PM">1:00 PM</option>
                              <option value="2:00 PM">2:00 PM</option>
                              <option value="3:00 PM">3:00 PM</option>
                              <option value="4:00 PM">4:00 PM</option>
                              <option value="5:00 PM">5:00 PM</option>
                              <option value="6:00 PM">6:00 PM</option>
                              <option value="7:00 PM">7:00 PM</option>
                              <option value="8:00 PM">8:00 PM</option>
                              <option value="9:00 PM">9:00 PM</option>
                              <option value="10:00 PM">10:00 PM</option>
                           </select>
            </div>
          </div>
        </div>

            <div class ="column">
                <div class="card border-success mb-3" style="max-width: 20rem;">
                    <div class="card-header">Membership:</div>
                        <div class="card-body">
                            <label for="mem">Select a memebership:</label>
                                <select class="btn btn-success" id="mem" name="mem">
                                    <%
                                        for(int i = 0; i < memDS.Tables[0].Rows.Count; i++)
                                        {

                                            string id = memDS.Tables[0].Rows[i]["Member_ID"].ToString();
                                            string lName = memDS.Tables[0].Rows[i]["Member_LName"].ToString();
                                            string phone = memDS.Tables[0].Rows[i]["Member_Phone"].ToString();

                                            %>
                                            <option value ="<%=id + ":" + lName + " - " + phone %>"><%=id + ":" + lName + " - " + phone %></option>


                                     <% } %>

                                </select>
                    </div>
                </div>
            </div>

            <div class ="column">
                <div class="card border-danger mb-3" style="max-width: 20rem;">
                 <div class="card-header">Additional Comments:</div>
                     <div class="card-body">
                         <label for="com" class="form-label mt-4">Enter any Additional Needs:</label>
                            <textarea class="form-control" id="com" name="com" namerows="3" style="height: 175px;"></textarea>
                     </div>
                </div>
            </div>

            <div>
              <input type="submit" class="btn btn-primary Subbut" value="Submit" />
            </div>

    </div>  
    </div>
    </form>
</body>
</html>
