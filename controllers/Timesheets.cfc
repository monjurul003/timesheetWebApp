component extends="Controller"{
	public void function config(){
		super.config();
			provides("json");
	}
	public void function processNewTimesheet() {

		var newTimesheet = model("timesheet").new();
		var timeIn = LSTimeFormat(parseDateTime(form.timein),"HH:mm");
		var totalTime = LSTimeFormat(timeIn,"h")*60 + LSTimeFormat(timeIn,"mm");
		var temp = DateAdd("n", totalTime, form.entryDate);
		newTimesheet.startTime = temp;
		 var timeout = LSTimeFormat(parseDateTime(form.timeout),"HH:mm");
		 totalTime = LSTimeFormat(timeout,"h")*60 + LSTimeFormat(timeout,"mm");
		 temp = DateAdd("n", totalTime, form.entryDate);
		newTimesheet.endTime = temp;
		// writeDump(form.pivotalLink);
		// abort;
		var pivot = model("pivotaltracker").findAll(returnAs="objects");
		var isExist = false;
		
		for (elem in pivot) {
			//writeDump(elem.Link);

        	if (ToString(elem.Link) == form.pivotalLink) {
            	newTimesheet.PivotalTrackerId = elem.Id;
            	isExist = true;
            	break;
        	}
    	}
    	
	    if(!isExist){
			var newPivot = model("pivotaltracker").new();

			newPivot.Link = form.pivotalLink;
			if(!newPivot.save(reload=true)){
				message = "Error creating new pivotal tracker";
			}

			newTimesheet.PivotalTrackerId = newPivot.id;
		}
		
		projectNames = model("project").findAll(returnAs="objects");
		newTimesheet.Details = projectNames[form.projectDesc].Description;
		newTimesheet.ProjectId = projectNames[form.projectDesc].Id;
		newTimesheet.Sred = form.sred;
		newTimesheet.irep = form.irep;
		newTimesheet.UseriD =1;
		if(!newTimesheet.save(reload=true)){
				message = "Error creating new timesheet entry";
		}else{
			redirectTo(action="timesheetView");
		}
		//newTimesheet.pivotaltracker 
		


		//throw(DateAdd('h',form.timein.value,form.entryDate));
		// newTimesheet.startTme = DateTimeFormat(form.entryDate+form.timein, "dd mm yyyy HH:m","");
		// throw(newTimesheet.startTime);

	}
	public void function timesheetView() {
			// throw("testing throwing message");
	    // timesheets = model("timesheet").findAll(include="user,project,pivotaltracker");
	    //timesheets = model("timesheet").getTimesheetWithTotal(1);

	    timesheets = queryToStructs(model("timesheet").getTimesheetWithTotal(1));
		projectNames = model("project").findAll(returnAs="objects");



			    // writeDump(timesheets[1].total);
	    // abort;
	    // for (var timesheet in timesheets) {
	    // 	timesheet["total"] = 5;
	    // }
	    
		// throw("testing throwing message");
	 //    writeDump(timesheets);
		// abort;
	}
	private numeric function getTimeInNumeric(required object inputTime){


	}
}