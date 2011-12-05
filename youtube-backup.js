#!/usr/local/bin/node

/*
 * YouTube Backup Script
 *
 * Lucas Garron
 * December 04, 2011

TODO:
- Something safe for private vids (requires auth).

 *
 */


var fs = require("fs");
var https = require('http');
var url = require('url');

var userName = "LucasGarron"; // Username whose public vids we want to access

var perRequest = 50;
var startIndex = 1;

videos = [];
videosString = "";
videoIDsString = "";

var callback = function(str) {

	console.log("Callback.");

	var data = JSON.parse(str);
	if (typeof data.feed.entry == "undefined") {
		console.log("Done.")
		fs.writeFileSync("vids.txt", videoIDsString);
		fs.writeFileSync("vids_nice.txt", videosString);
		fs.writeFileSync("vids.json", JSON.stringify(videos));
		return;
	}
	else {
		console.log("More entries: " + data.feed.entry.length);
		for (var i in data.feed.entry) {
			var videoID = data.feed.entry[i].id["$t"].replace(/.*\//g, "");
			var title = data.feed.entry[i].title["$t"];

			console.log("[Video " + videoID + "] " + title);

			videos.push({id: videoID, title: title});
			videosString += "[Video " + videoID + "] " + title + "\n";
			videoIDsString += videoID + "\n";
		}
	}

	console.log("Repeating.");
	startIndex += perRequest;
	go();
}

// From https://gist.github.com/1393666
var go = function() {

	console.log("Go!");

	// http.request settings
	var settings = {
	    host: "gdata.youtube.com",
	    port: 80,
	    path: "/feeds/api/users/" + userName + "/uploads?alt=json&max-results=" + perRequest + "&start-index=" + startIndex
	};

	// MAKE THE REQUEST
	var req = https.request(settings);

	// when the response comes back
	req.on('response', function(res){
	    res.body = '';
	    res.setEncoding('utf-8');

	    // concat chunks
	    res.on('data', function(chunk){ res.body += chunk });

	    // when the response has finished
	    res.on('end', function(){
	        
	        // fire callback
	        callback(res.body, res);
	    });
	});

	// end the request
	req.end();
}

go();