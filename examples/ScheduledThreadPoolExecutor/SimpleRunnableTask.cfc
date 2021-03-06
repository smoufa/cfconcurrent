component{

	results = { created = now(), createTick = getTickCount(), error={}, runCount = 0, lastTick=0, lastTS = '', uuid = createUUID() };
	runStatus = "running";

	function init( id ){
		results.id = arguments.id;
		return this;
	}

	function pause(){
		runStatus = "paused";
	}

	function unPause(){
		runStatus = "running";
	}

	function run(){
		if( runStatus eq "paused" ){
			return;
		}

		try{
			results.runCount++;
			writeLog("Inside run for id #results.id#! RunCount is now #results.runCount#. Run ScheduledThreadPoolExecutor/index.cfm?stop to shut down this heartbeat.")
		} catch( any e ){
			writeLog("OH NOES!!!!! #e.message#; #e.detail#");
			results.error = e;
		}
		results.lastTick = getTickCount();
		results.lastTS = now();

	}

	function getResults(){
		return results;
	}

}