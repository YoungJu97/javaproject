package com.res.travel;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.client.RestTemplate;
import org.springframework.http.converter.StringHttpMessageConverter;

import javax.servlet.http.HttpServletRequest;
import java.nio.charset.Charset;

import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;

import java.io.IOException;
import java.util.List;

@Controller
public class ApiController {

    @RequestMapping(value = "trip", method = RequestMethod.GET, produces = "text/html;charset=UTF-8")
    public String trip(HttpServletRequest request, @RequestParam("numOfRows") String numOfRows,
            @RequestParam("pageNo") String pageNo, @RequestParam("MobileOS") String mobileOS,
            @RequestParam("MobileApp") String mobileApp, @RequestParam("_type") String dataType,
            @RequestParam("listYN") String listYN, @RequestParam("arrange") String arrange,
            @RequestParam("mapX") String mapX, @RequestParam("mapY") String mapY,
            @RequestParam("radius") String radius, @RequestParam("contentTypeId") String contentTypeId,
            Model model) {

        // API 호출을 위한 URL 및 파라미터 설정
        String apiUrl = "http://apis.data.go.kr/B551011/KorService1/locationBasedList1";
        String serviceKey = "YX9saErq4QqTJIlV5QM7saMk7NonKnn9lqIgw3Ha6PT3MJFJ5biqwRMLfWKEW86UdxQ57jyOmKyCObfaClrVHw==";

        // RestTemplate 객체 생성
        RestTemplate restTemplate = new RestTemplate();

        // UTF-8 설정 추가
        restTemplate.getMessageConverters().add(0, new StringHttpMessageConverter(Charset.forName("UTF-8")));

        // Increment the pageNo dynamically
        int incrementedPageNo = Integer.parseInt(pageNo) + 1;

        // API 호출 및 응답 받기
        String jsonResponse = restTemplate.getForObject(
                apiUrl + "?serviceKey=" + serviceKey + "&numOfRows=" + numOfRows + "&pageNo=" + incrementedPageNo + "&MobileOS="
                        + mobileOS + "&MobileApp=" + mobileApp + "&_type=" + dataType + "&listYN=" + listYN + "&arrange="
                        + arrange + "&mapX=" + mapX + "&mapY=" + mapY + "&radius=" + radius + "&contentTypeId="
                        + contentTypeId,
                String.class);

        // Jackson 라이브러리를 사용하여 JSON 파싱
        ObjectMapper objectMapper = new ObjectMapper();
        try {
            // JSON 데이터를 JsonNode로 읽음
            JsonNode rootNode = objectMapper.readTree(jsonResponse);

            // JsonNode에서 필요한 데이터를 List로 변환
            List<JsonNode> resultList = objectMapper.convertValue(
                    rootNode.path("response").path("body").path("items").path("item"), new TypeReference<List<JsonNode>>() {
                    });

            model.addAttribute("apiResult", resultList);

            // Java 코드에서 문자열 포맷 사용
            String contextPath = request.getContextPath();
            String tripUrl = String.format("%s/trip?numOfRows=%s&pageNo=%s&MobileOS=%s&MobileApp=%s&_type=%s&listYN=%s&arrange=%s&mapX=%s&mapY=%s&radius=%s&contentTypeId=%s",
                    contextPath, numOfRows, incrementedPageNo, mobileOS, mobileApp, dataType, listYN, arrange, mapX, mapY, radius, contentTypeId);

            model.addAttribute("tripUrl", tripUrl);
        } catch (IOException e) {
            e.printStackTrace();
        }

        return "introduce"; // 결과를 출력할 JSP 페이지 이름
    }
}
