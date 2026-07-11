ParksServices.ParksImplPort ps = new ParksServices.ParksImplPort();
String[] parks = ps.byCountry('Japan');
System.debug(parks);
ParksServices.ParksImplPort ps1 = new ParksServices.ParksImplPort();
String[] parks1 = ps1.byCountry('Germany');