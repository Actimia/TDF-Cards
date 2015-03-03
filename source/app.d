import vibe.d;

shared static this()
{
	auto settings = new HTTPServerSettings;
	settings.port = 8080;
	settings.bindAddresses = ["::1", "127.0.0.1"];

	auto router = new URLRouter;
	router.get("/", &hello);

	listenHTTP(settings, router);
}

void hello(HTTPServerRequest req, HTTPServerResponse res)
{
	res.render!("index.dt", res);
}
