class MyConfig {
  static String apiDev = "https://share-to-earn.vercel.app";
  static String apiLocalHost = "http://localhost:3000";
  static String apiProd = "https://share-to-earn.vercel.app/";
  
  String get apiUrl {
    if(Uri.base.toString().contains("vercel")){
      return apiDev;
    }else if(Uri.base.toString().contains("localhost")){
      return apiLocalHost;
    }else if(Uri.base.toString().contains(".com")){
      return apiProd;
    }else{
      return apiDev;
    }
  }
}
