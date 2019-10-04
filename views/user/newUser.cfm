<cfoutput>

<form action="/timesheet/index.cfm/submit-user" method="post">
    First name:
    <br>
    <input type="text" name="firstname" placeholder="Type your first name">
    <br> Last name:
    <br>
    <input type="text" name="lastname" placeholder="Type your last name"> <br> Password:
    <br>
    <input type="password" name="password">
    <br> Email:
    <br>
    <input type="text" name="email" value="" placeholder="Type your email">
    <br>
    <br>
    <input type="submit" value="Submit">
</form>

</cfoutput>