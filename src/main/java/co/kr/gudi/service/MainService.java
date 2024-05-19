package co.kr.gudi.service;

import java.io.BufferedReader;
import java.io.InputStreamReader;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;

import co.kr.gudi.dto.MainDTO;

@Service
public class MainService {

	private String rootUrl = "https://api.github.com";

	Logger logger = LoggerFactory.getLogger(getClass());

	public ModelAndView search(String id) {
		ModelAndView mav = new ModelAndView("result");

		logger.info(getUserRepositories(id) + "");

		mav.addObject("result", getUserRepositories(id));
		return mav;
	}

	public List<String> getUserRepositories(String id) {
		String urlString = rootUrl + "/users/" + id + "/repos";
		try {
			// api 요청 준비
			URL url = new URL(urlString);
			HttpURLConnection connection = (HttpURLConnection) url.openConnection();
			connection.setRequestMethod("GET");

			// 연결 상태 확인
			int responseCode = connection.getResponseCode();
			logger.info("연결 상태 : " + responseCode);
			
			// 연결 상태가 정상이라면(200)
			if (responseCode == HttpURLConnection.HTTP_OK) {
				BufferedReader in = new BufferedReader(new InputStreamReader(connection.getInputStream()));
				String inputLine;
				StringBuilder response = new StringBuilder();
				
				// 값이 있으면
				while ((inputLine = in.readLine()) != null) {
					response.append(inputLine);
				}
				// 다 썻으니까 닫아주기
				in.close();

				// JSON 응답을 DTO 배열로 변환
				ObjectMapper objectMapper = new ObjectMapper();
				MainDTO[] dto = objectMapper.readValue(response.toString(), MainDTO[].class);

				// 저장소 이름 목록 추출
				return Arrays.stream(dto).map(MainDTO::getName).collect(Collectors.toList());
			} else {
				logger.error("GET 요청 실패: " + responseCode);
				return List.of();
			}
		} catch (Exception e) {
			logger.error("HTTP 요청 중 오류 발생", e);
			return List.of();
		}
	}
}
