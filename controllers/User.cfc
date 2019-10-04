component extends="Controller" {
    public void function config(){
    	provides("json");
    }

    public void function newUser() {

    }

    public void function processNewUser() {
	    // how to look at the parameters

	    // writeDump(form);
	    // abort;

	    // how to throw a message in the CF error page
	    //throw("testing throwing message");

	    // How to create a new entry in the database

	    var user = model("users").new();
	    user.firstname = form.firstname;
	    user.lastname = form.lastname;
	    user.email = form.email;

	    if(!user.save()) {
	    	message = "Did not create user";
	    }

	    message = "user " & user.email & " has been created!";
	    
	    return;
	}

	public void function deleteUser() {

		var user = model("users").delete(where="Id=#url.id#");

		if (!user) {
			// throw(user.allErrors()[1]);
			throw();

		}
		renderWith(user);
		return;
	}
}