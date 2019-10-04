<cfoutput>

<h1>Timesheets</h1>

#startFormTag(route="showTimesheet")#
    
    <table border="block">
        <thead>
            <tr>
                <th>First Name</th>
                <th>UserId</th>
                <th>Date</th>
                <th>Project</th>
                <th>Pivotal Tracker Link</th>
                <th>Details</th>
                <th>SRED</th>
                <th>Time in</th>
                <th>Time out</th>
                <th>Total</th>
            </tr>
        </thead>
        <tbody align="center">
            <cfloop from="1" to="#arrayLen(timesheets)#" index="i">
                <cfset data = timesheets[i]>
                <tr>
                    <td>
                        
                        #data.firstname#
                    </td>
                    <td>
                        #EncodeForHtml(data.userid)#
                    </td>
                    <td>
                        #EncodeForHtml(data.entrydate)#
                    </td>
                    <td>
                        #EncodeForHtml(data.projectName)#
                    </td>
                    <td>
                        #EncodeForHtml(data.link)#
                    </td>
                      <td>
                        #EncodeForHtml(data.details)#
                    </td>
                    <td>
                        #EncodeForHtml(data.sred)#
                    </td>
                    <td>
                        #EncodeForHtml(data.starttime)#
                    </td>
                    <td>
                        #EncodeForHtml(data.endtime)#
                    </td>
                    <td>
                        #EncodeForHtml(data.total)# 
                    </td>
                </tr>
            </cfloop>
        </tbody>
    </table>

#endFormTag()#

#startFormTag(route="processTimesheet")#
<h1>Enter your timesheet entry</h1>
<form action="/timesheet/index.cfm/submit-timesheet" method="post">
    Entry Date:
    <br>
    <br>
    <input type="date" name="entryDate">
    <br>
    <br>
     Project:
    <br>
    <br>
    <select>
        <cfloop from="1" to="#arrayLen(projectNames)#" index="i">
                    <cfset c = projectNames[i]>
                    <option value=c.id>#EncodeForHtml(c.Name)#</option> 
        </cfloop>
    </select>
    <br>
    <br>
     Details:
    <br>
    <br>
    <select name="projectDesc">
        <cfloop from="1" to="#arrayLen(projectNames)#" index="i">
                    <cfset c = projectNames[i]>
                    <option value=#c.id#>#EncodeForHtml(c.Description)#</option> 
        </cfloop>
    </select>
    <br>
     <br> Pivotal TrackerLink:
    <br>
    <br>
    <input type="text" name="pivotalLink" value="" placeholder="Insert pivotal tracker link">
    <br>
    <br> Time In: (HH:MM)
    <br>
    <input type = "text" name="timein">
    <br>
    <br> Time Out: (HH:MM)
    <br>
    <input type = "text" name= "timeout">
    <br>
    <br>
    <br> SRED:
    <br>
   <select name="sred">
       <option value = 0>0</option>
       <option value = 1>1</option>
   </select>
    <br>
    <br> IREP:
    <br>
   <select name="irep">
       <option value = 0>0</option>
       <option value = 1>1</option>
   </select>
    <br>
    <br>
    <input type="submit" value="Submit">
</form>
#endFormTag()#

</cfoutput>