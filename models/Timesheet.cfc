component extends="Model" {
	public void function config() {
		//table("Timesheets");
		belongsTo("user");
		belongsTo("project");
		belongsTo("pivotaltracker");

	}
public query function getTimesheetWithTotal(required numeric userId) {
		var customQuery = "
            SELECT 
            	  'userId' = t.UserId
            	, 'projectName' = p.Name
            	, 'entrydate' = CONVERT(varchar,t.StartTime,106)
            	, 'total' =CONVERT(varchar, DATEDIFF(n, t.StartTime, t.EndTime)/60.0) 
         	    , 'firstname' = u.FirstName
            	, 'starttime' = t.StartTime
            	, 'endtime' = t.EndTime
            	, 'link' = pt.Link
            	, 'sred' = t.SRED
            	, 'details' = t.Details
            FROM Timesheets t
            JOIN Projects p ON t.ProjectId = p.Id
            JOIN PivotalTrackers pt ON t.PivotalTrackerId = pt.Id
            JOIN Users u ON t.UserId = u.Id
            WHERE t.UserId = :pUserId
        ";

        var parameters = {
            pUserId = {value=userId, CFSQLType="CF_SQL_NUMERIC"}
        };

        var options = {
            datasource='testdb'
        };

        return queryExecute(customQuery, parameters, options);
	}
}

//, 'total' = CONVERT(varchar(30), (DATEDIFF(mi, t.StartTime, t.EndTime) / 60))