package com.epl.soccer;

import java.nio.charset.StandardCharsets;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.http.converter.StringHttpMessageConverter;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;


@RestController
public class ApiController {
    private final String rapid_apikey = "9db1422dddmsh8256d933d39524bp161df7jsn6d4d7532bb4e"; 
    private final String apiHost = "api-football-v1.p.rapidapi.com";
    private final String youtube_apikey = "AIzaSyBPbpQBL46mJzkyOPKcff2IGCVFES1hpoU";
    private ResponseEntity<String> callAPI(String apiUrl) {
        HttpHeaders headers = new HttpHeaders();
        headers.setContentType(MediaType.APPLICATION_JSON);
        headers.set("X-RapidAPI-Key", rapid_apikey);
        headers.set("X-RapidAPI-Host", apiHost);

        RestTemplate restTemplate = new RestTemplate();
        HttpEntity<String> requestEntity = new HttpEntity<>(headers);
        return restTemplate.exchange(apiUrl, HttpMethod.GET, requestEntity, String.class);
    }

    @RequestMapping(value = "api", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> getClub() {
        String apiUrl = "https://api-football-v1.p.rapidapi.com/v3/teams?league=39&season=2023";
        return callAPI(apiUrl);
    }
    @RequestMapping(value = "rank", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> rank() {
        String apiUrl = "https://api-football-v1.p.rapidapi.com/v3/standings?season=2023&league=39";
        return callAPI(apiUrl);
    }
    @RequestMapping(value = "game", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> totalteam() {
        String apiUrl = "https://api-football-v1.p.rapidapi.com/v3/fixtures?league=39&season=2023&last=10";
        return callAPI(apiUrl);
    }

    @RequestMapping(value = "player", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> getPlay(@RequestParam("team") String teamid) {
        String apiUrl = "https://api-football-v1.p.rapidapi.com/v3/players?team=" + teamid + "&league=39&season=2023";
        return callAPI(apiUrl);
    }

    @RequestMapping(value = "score", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public ResponseEntity<String> selectscore(@RequestParam("team") String teamid) {
        String apiUrl = "https://api-football-v1.p.rapidapi.com/v3/teams/statistics?team=" + teamid + "&league=39&season=2023";
        return callAPI(apiUrl);
    }
    @RequestMapping(value="youtube", method = RequestMethod.GET, produces = MediaType.APPLICATION_JSON_VALUE)
    public String youtube(@RequestParam("q") String search) {
        String apiUrl = "https://www.googleapis.com/youtube/v3/search?"
        		+"part=snippet"
        		+"&chart=mostPopular"
        		+"&type=video"
        		+"&maxResults=2"
        		+"&regionCode=kr"
        		+"&q="+search
        		+"&videoEmbeddable=true"
        		+"&key="+youtube_apikey;
        
        RestTemplate restTemplate = new RestTemplate();
  
       
        restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(StandardCharsets.UTF_8));
        String result = restTemplate.getForObject(apiUrl, String.class);
        
        return result;
    }
   
}
