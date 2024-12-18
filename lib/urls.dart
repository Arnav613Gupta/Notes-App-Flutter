
const String domain="notes-api-django.vercel.app";


Uri getNotesUrl(){
  return Uri.http(domain,"/notes/");
}

Uri deleteNotesUrl(var pk){
  return Uri.http(domain,"/notes/$pk/delete/");
}

Uri postNotesUrl(){
  return Uri.http(domain,"/notes/create/");
}

Uri updateNotesUrl(var pk) {
  return Uri.http(domain, "/notes/$pk/update/");
}