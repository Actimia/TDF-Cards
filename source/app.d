import vibe.d;

shared static this(){
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];

	auto router = new URLRouter;
	router.get("/", &index);
	router.get("*", serveStaticFiles("./public/"));

	listenHTTP(settings, router);
}

void index(HTTPServerRequest req, HTTPServerResponse res){
	res.render!("index.dt", res);
}

void error(HTTPServerRequest req, HTTPServerResponse res){
	res.render!("error.dt", res);
}
