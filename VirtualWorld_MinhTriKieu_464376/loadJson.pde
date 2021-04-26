class loadJson{
  
  String cityName = "Enschede";
  String AppId = "6e1cb2df0c0d908305d726b5dbff9cf7";
  
  String URl;
  
  JSONObject json;
  
  int result =0;
  
  void loadUrl(){
    String searchURL = "http://api.weatherstack.com/current?access_key=" + AppId +"&query=" + cityName;
    json = loadJSONObject(searchURL);
    
    JSONObject current = json.getJSONObject("current");
    
    result = current.getInt("temperature");
    
    println("The temperature now in " + cityName + " is " + result);
    
  }
  int returnTemp(){
    return result;
  }
  
}
