component extends="cfconcurrent.AbstractCompletionTask"{

	// ZOMG: you would never, ever, ever, ever do this in real life

	variables.allCollected = [];

	function getAllCollected(){
		return allCollected;
	}
	
	function publish( array results ){
		writeLog("Publishing results!");
		variables.allCollected.addAll( results );
	}

}